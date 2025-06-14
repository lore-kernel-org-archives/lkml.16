Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E89823DE
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 01:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749863033; cv=none; b=Ls3cpN1pJUf0YfxNyBhfVowmDX31evEI0UcFqYK3v5OWicsmDmEne+wqTYIPsDI1RXgHHmRSGlXjcgQG4U0jCQEa4sGYPSQRAG57EMfVcjIPhzqGQDcL+OqGzoxPePS/madieBLKMzn40uTSM5z5qS2gK7Obi4jQIkILxZ4jTqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749863033; c=relaxed/simple;
	bh=g2LVzuKYEPK5r4ZuJhHrZvPL/0zQBB35IpExDh7Xll0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zn1QxO8Ld9TGol+HDr88R0V6I4256n/YjUNs9UItjv73GXDfAXdir44tXoF5jyDcUix+17V2MNTZGbIiyqiqNeboK70QkMpErs837c7qm7Ts5GCEZ1fhx18HZbr9bx+IIJfDaQgWty4dLKH6uRd1jpBuekJYo3S18exDlFh56j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=BDCUNlyD; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="BDCUNlyD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=eYG/P1O+JryPbUcsMux4WisbYnBxk9G918rPkmGuTzY=; b=BDCUNlyDKt5j4ZRY
	5wvLB4IgA2SWMRQHz9dEMrYyDL+KWyMu42Ew0HPw1SwMTnUPpmhAi0e16NfXaouVVNQrcWh13aM5C
	4RTpY+ejc5e0FjnRNvoMb5+dq1B8kc7/K7SLesIzND4ZnafIe01vWgMUT3nWsZx5VQ4srJoYsyIQS
	WpbTM9qAWfh0GRV4OnVqSspQXnWcKdih1cZu4jnMzhJxjzY56EbWA0ozB5WsPeqnaAUAAU0yMeOn3
	fOfBwkQh9q/uqamM0lcuzLya3bpG78wQTRllP60/6EfDTaMRHQA4WzZTvSEch1+ab2L2kuwAopjR+
	VowjV86KerzZRrHJPg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uQFJC-009amM-2C;
	Sat, 14 Jun 2025 01:03:46 +0000
From: linux@treblig.org
To: bryan-bt.tan@broadcom.com,
	vishnu.dasa@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 0/3] vmci deadcode
Date: Sat, 14 Jun 2025 02:03:41 +0100
Message-ID: <20250614010344.636076-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

Hi,
  This is a set of deadcode removal in vmw_vmci; all of
the removals are whole function removals for functions
that were added in 2013 but haven't been used.

Build tested only.

Dave
Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>


Dr. David Alan Gilbert (3):
  misc: vmw_vmci: Remove unused vmci_ctx functions
  misc: vmw_vmci: Remove unused vmci_doorbell_notify
  misc: vmw_vmci: Remove unused qpair functions

 drivers/misc/vmw_vmci/vmci_context.c    |  54 ----------
 drivers/misc/vmw_vmci/vmci_context.h    |   2 -
 drivers/misc/vmw_vmci/vmci_doorbell.c   |  53 ----------
 drivers/misc/vmw_vmci/vmci_queue_pair.c | 133 ------------------------
 include/linux/vmw_vmci_api.h            |   7 --
 5 files changed, 249 deletions(-)

-- 
2.49.0

