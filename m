Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42DF25B1C1
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 08:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747040336; cv=none; b=oIEm1wHuiP+5hdEleZhIxoV+sRRWH+Rw3ut8FU1UMGszLwGcA6M3lw82PULyGXFeazKraPH6FTqXvyfxaIBiWiZuTcaiDMwl/LxZK6JtkaTqzG4IRN4uZW5N7zTsKhmtIb1gPB98RErFN7EesZ5b2qvp3zgO1WGZ84F2Ljyanxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747040336; c=relaxed/simple;
	bh=I+cbJMLjMUUGphDajlbBcPL7lRMWlPCK6STK0AciPjo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MmwgAotG5GgXCe75HLfKRKhz6p7txLPzCbl9qr+ZBOHsjY4dEECwir69cuicaZCJO9DwkoKCs7pm9pj+evJG6Pj1dqM+SV2JcuLp6CBkEns13akciJ5juAZnA1xBHgjnhwkldjlzD5i+B0dHtqxvuC6jzbSk1/USeGtUNGy7WTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F+8hzV1X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F+8hzV1X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1EAFC4CEE7;
	Mon, 12 May 2025 08:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747040335;
	bh=I+cbJMLjMUUGphDajlbBcPL7lRMWlPCK6STK0AciPjo=;
	h=From:To:Cc:Subject:Date:From;
	b=F+8hzV1XeU+J2AygaTWjlciBMi1IOfgrV3w4+Oi0vTU5d1NUhKwg0XGrquTn9UFUG
	 QP1LxPN7uTGQ5w59o8tsHZxgyih7dk3iB9DbiBLQSq7wMcAE4oAj3bXplLRDh5iwWb
	 3t8eoKQfB9fPnJS9TP7GzrV57WaF8nv8eb9tewjpkhsm9ROisr0MSQHeDgZMInbASx
	 IuDUv08D2V1xm3kV3dWybGOxnhkNr0vKb5OD+uOpcKhKrvK8i3ETtaJ2CVIHOnJuWv
	 3+wLK49SYbJlRyFtuoYIxBvKYjOrTP0o7FtspEjJDMNRBtomvkjdw0odG+Cny/aaxT
	 HmpxiUNCnPFUw==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: wsa+renesas@sang-engineering.com
Cc: linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] misc: ti_fpc202: Switch to of_fwnode_handle()
Date: Mon, 12 May 2025 10:58:52 +0200
Message-ID: <20250512085852.2432422-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_node_to_fwnode() is an irqdomain's reimplementation of the
"officially" defined of_fwnode_handle(). The former is in the process of
being removed, so use the latter instead.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Fixes: 1e5c9b1efa1c ("misc: add FPC202 dual port controller driver")
Cc: Romain Gantois <romain.gantois@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/misc/ti_fpc202.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/ti_fpc202.c b/drivers/misc/ti_fpc202.c
index b9c9ee4bfc4e..cc597682b89c 100644
--- a/drivers/misc/ti_fpc202.c
+++ b/drivers/misc/ti_fpc202.c
@@ -284,7 +284,7 @@ static int fpc202_probe_port(struct fpc202_priv *priv, struct device_node *i2c_h
 
 	desc.chan_id = port_id;
 	desc.parent = dev;
-	desc.bus_handle = of_node_to_fwnode(i2c_handle);
+	desc.bus_handle = of_fwnode_handle(i2c_handle);
 	desc.num_aliases = FPC202_ALIASES_PER_PORT;
 
 	fpc202_fill_alias_table(priv->client, aliases, port_id);
-- 
2.49.0

