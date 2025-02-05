Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919DD218AC4;
	Wed,  5 Feb 2025 12:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738757569; cv=none; b=eYissbsvbyskoLFSQXyM4o19sKqsETEAm7VPg9afZikMPf1kF9CMP8UTpjSWupjvtn5ht83KEojic9vN1wk4pOs+FiKx3esZEhZOFgv7w2b0A3HJRG8UTHi/8wY1QSHv8DMc9MIumV3V7YPu+xgiS5HfzZga4ljgfSoHssYuzeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738757569; c=relaxed/simple;
	bh=MgNQbHA+Uss8ZdAh8/lhXo3Fi03Bha3FNW9V7RjPhMI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FmN+XQyMnWtM1IaV4V9JWsiihGCEGSQdbMqdpvcMKQVLWPyIXJBirgrCxqplcRqBoG0/sgR2ZD9VOToNWJSG4ZieGHUEOpPDaHIS8EolhclEI+dZX5yOaz3RIbKsHOWN93mu++Tk1riTuxovL2S+jsDQmnXgjn4jUw5UHD1BRME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H7UwiYWv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H7UwiYWv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DA0FC4CED1;
	Wed,  5 Feb 2025 12:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738757569;
	bh=MgNQbHA+Uss8ZdAh8/lhXo3Fi03Bha3FNW9V7RjPhMI=;
	h=From:To:Cc:Subject:Date:From;
	b=H7UwiYWvpezsH8tPIyUBWNs2FDJXNEhxkLH4nu862BUEzOSUYB4IBsLQZ9v3a4h8J
	 7Mb77pKFAOyLdBtO/2SBWkoWlzVth0SlLSHR2wvvysQhsrT60g5RaLxGvK5dr6oGBP
	 ePtdRWcRfiUVAMpukiiCuz7f3OkAFEo0vKqByLmOSNa0oXUvKwbbwEbbErZDN6N0FD
	 lcOWqfBh1Tg6/T2IKddz58aHq996x1Vplw/Pg3I3YdBnjVGUibrWTk/RU+7kNiWx2r
	 DJB5CvVZGKe87+Fh7Vf8Fk+sd3O4blBdV3seVeHO149dD48MNwmi015IeqPFVFcLyx
	 cNSV+akt51bAA==
From: Arnd Bergmann <arnd@kernel.org>
To: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Nihar Chaithanya <niharchaithanya@gmail.com>,
	Rohit Chavan <roheetchavan@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpib: mark pnp_device_id tables as __maybe_unused
Date: Wed,  5 Feb 2025 13:12:26 +0100
Message-Id: <20250205121244.322054-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

This variable is not referenced in either of these two drivers driver,
causing a warning when they are built-in and W=1 warnings are enabled
with gcc:

drivers/staging/gpib/tnt4882/tnt4882_gpib.c:1507:35: error: 'tnt4882_pnp_table' defined but not used [-Werror=unused-const-variable=]
 1507 | static const struct pnp_device_id tnt4882_pnp_table[] = {
      |                                   ^~~~~~~~~~~~~~~~~
drivers/staging/gpib/hp_82341/hp_82341.c:811:35: error: 'hp_82341_pnp_table' defined but not used [-Werror=unused-const-variable=]
  811 | static const struct pnp_device_id hp_82341_pnp_table[] = {

The MODULE_DEVICE_TABLE() entry does have the effect of loading
the module when the PNP device is detected, so it is still needed
for the modular case.

Ideally the drivers should be converted to pnp_register_driver(),
which would lead to the ID table actually being used.

As a simpler workaround, add a __maybe_unused annotation to shut
up the warning.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/staging/gpib/hp_82341/hp_82341.c    | 2 +-
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/hp_82341/hp_82341.c b/drivers/staging/gpib/hp_82341/hp_82341.c
index 800f99c05566..7284311e04e2 100644
--- a/drivers/staging/gpib/hp_82341/hp_82341.c
+++ b/drivers/staging/gpib/hp_82341/hp_82341.c
@@ -808,7 +808,7 @@ static void hp_82341_detach(gpib_board_t *board)
 	hp_82341_free_private(board);
 }
 
-static const struct pnp_device_id hp_82341_pnp_table[] = {
+static __maybe_unused const struct pnp_device_id hp_82341_pnp_table[] = {
 	{.id = "HWP1411"},
 	{.id = ""}
 };
diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index 2e1c3cbebaca..cf3b2a0eb93d 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -1390,7 +1390,7 @@ static struct pci_driver tnt4882_pci_driver = {
 	.probe = &tnt4882_pci_probe
 };
 
-static const struct pnp_device_id tnt4882_pnp_table[] = {
+static __maybe_unused const struct pnp_device_id tnt4882_pnp_table[] = {
 	{.id = "NICC601"},
 	{.id = ""}
 };
-- 
2.39.5

