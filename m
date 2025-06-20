Received: from mx.olsak.net (unknown [37.205.8.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3E2283FDA
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 09:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.8.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750412482; cv=none; b=izCwsUBPDqYpoBefspc3L8TpLBQqvCUxq3cS4kTY0QMZ53tvGcsL9qH+qgs9fb9ixSRdioDI4B/37X0wi0wlixQJx6bPsScv7mhOBIn6uM3rL7E8kyDvJ0A7VJCogvb7fChpxJ/YMI80dAXbWc6Q+H1s1KBZM7QkcfsmnBW/ACk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750412482; c=relaxed/simple;
	bh=YpMeK3Qa8hxRaDNvO5VnJnDDPwLBJXzUgoBjfT/woSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZWY3tPs2AvZKEgqglbCTSOo9vIeMAL1qwnaCLdRaQWtBVPIPXGhcccWVLYyUpwSKTFeIFmIp+6e+1c+oqQhOvOnb6ZwKnLrbTLqY9DRGCWIyKSafWmpzgmj8Fs1GJAz5lWGmtcirTAf9zMCZ0q5NsrIlNsvB2GrsD6YazV4qju0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dujemihanovic.xyz; spf=pass smtp.mailfrom=dujemihanovic.xyz; dkim=pass (2048-bit key) header.d=dujemihanovic.xyz header.i=@dujemihanovic.xyz header.b=qZVLRNH3; arc=none smtp.client-ip=37.205.8.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dujemihanovic.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dujemihanovic.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dujemihanovic.xyz header.i=@dujemihanovic.xyz header.b="qZVLRNH3"
DKIM-Signature: a=rsa-sha256; bh=DKogfq0OjBU4FRyBvSEKx/PwjacgVG06NBpZNEcXE/4=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:Message-Id:Message-Id:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1750411564; v=1; x=1750843564;
 b=qZVLRNH38QjmEptmTnUIN5nlRfOEUS1RNQ30VjnY4xrlrHNqFGw/3K/AYcmsY5GwLvzk/oL7
 cMg2XzjZbwz2tFZ7sRjLxsJxfbIO/n35aq37Td5hGXVx1S2ni9jbFwvV3MVq8grkApoy/CS5za1
 CY2DftxonTEzLxB9rQXEq4lceHX7tHf3Qwt+7t8O526hhqY21UrkYaL/616kHPT+txS3oGBmfAe
 wYBtVH7+dlFwCZL2mbzWFW1r/BYJytS4WFT3PhMYG57h3gChuTKSB/bSb8OB3/LOxn7MDkfs114
 0kYWrvyf6NS/jKo5T8jd46Rh1v09K3/OhiAclgRtgHkrQ==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id 0e343b10; Fri, 20 Jun 2025 11:26:04 +0200
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Date: Fri, 20 Jun 2025 11:25:35 +0200
Subject: =?utf-8?q?=5BPATCH=5D_mailmap=3A_update_Duje_Mihanovi=C4=87=27s_?=
 =?utf-8?q?email_address?=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250620-mailmap-v1-1-a6b4b72dbd07@dujemihanovic.xyz>
X-B4-Tracking: v=1; b=H4sIAA4pVWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDU0Nz3dzEzJzcxALdZPPEVFNLSxNTMwtTJaDqgqLUtMwKsEnRsbW1AAX
 WwqVZAAAA
X-Change-ID: 20250517-mailmap-c7ae59945685
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Karel Balej <balejk@matfyz.cz>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=975; i=duje@dujemihanovic.xyz;
 s=20240706; h=from:subject:message-id;
 bh=YpMeK3Qa8hxRaDNvO5VnJnDDPwLBJXzUgoBjfT/woSw=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBmhmlp9YozeO913qTfO/bDR+PdDj9UXPyyNUbj0fL1x+
 kSf5mbPjlIWBjEuBlkxRZbc/47XeD+LbN2evcwAZg4rE8gQBi5OAZhI3XKGv9KdTUe3zf62fG51
 hvz1wCXCLBoOabOdVfac2pf9yCZt7WKG/2mTTJtezPFtOa2/9VEa+zwW9UDhqb//7LKffTI4cU3
 YAn4A
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03

I'm switching to a new mail address, so map my old one to it.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 9531546fcac9e08f6d9610e4f6af7e7c86850bd7..4707f80df1503e04bbc68b80c9accf715f3f70cd 100644
--- a/.mailmap
+++ b/.mailmap
@@ -216,6 +216,7 @@ Dmitry Safonov <0x7f454c46@gmail.com> <d.safonov@partner.samsung.com>
 Dmitry Safonov <0x7f454c46@gmail.com> <dsafonov@virtuozzo.com>
 Domen Puncer <domen@coderock.org>
 Douglas Gilbert <dougg@torque.net>
+<duje@dujemihanovic.xyz> <duje.mihanovic@skole.hr>
 Ed L. Cashin <ecashin@coraid.com>
 Elliot Berman <quic_eberman@quicinc.com> <eberman@codeaurora.org>
 Enric Balletbo i Serra <eballetbo@kernel.org> <enric.balletbo@collabora.com>

---
base-commit: 172a9d94339cea832d89630b89d314e41d622bd8
change-id: 20250517-mailmap-c7ae59945685

Best regards,
-- 
Duje Mihanović <duje@dujemihanovic.xyz>

