Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247CE1ACEDF
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 05:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748236097; cv=none; b=DrihZvvQtrYFnRDT8Mt5amz9cJ0dcPFMtxcbMpFn/UopmxlCNKVLORbUNw/8tj/rxQRGCFCbt+tAC3IB6AW6Qteg7gvAYiwC9lU8pEDW+jlXMWX5Q1VoK7BZf/f0rxCZYumu/BeJh7WtzQuXVfa+wGE7NCRPbWLRekzJwlNxzM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748236097; c=relaxed/simple;
	bh=VN3uKbL1JqOpb7xEOcPjFAJ2oOJbhSAV/lt65qfGpCY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=eGNRdGoRgVoR1a+fgP5GMjZ3T2betDcGiSsu0FvnNqtXWHRa8qoanlc5NVPwqKqaZOf+RaE1qQ9K2/f8RW1CcjUk7pG5uK13F6khHlonyLdpVJ+1zpzIJxiQHqnhJzo6pHjaMCq5v86UZMTChkYaIpv5LHpwON5y19UeaTmwrgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmo-cybersecurity.com; spf=pass smtp.mailfrom=gmo-cybersecurity.com; dkim=pass (2048-bit key) header.d=gmo-cybersecurity.com header.i=@gmo-cybersecurity.com header.b=Ic1RnCGr; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmo-cybersecurity.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmo-cybersecurity.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmo-cybersecurity.com header.i=@gmo-cybersecurity.com header.b="Ic1RnCGr"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so22004665e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 22:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmo-cybersecurity.com; s=google; t=1748236092; x=1748840892; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ywmyN/RiFF7WteRQHUKPH3zi5cyGT7RpRE4XhtfXD3Q=;
        b=Ic1RnCGrmbto5he7xm8ingV94/4jNJ3MimwhNbJRNn01noUCtwTKxh+0gsQ7niSgNn
         ZldYlZOm8YjokVNwrbjzCWz3ITuAhNokqMWbLz0S3cEOqEOcekXePPe84b530wSNyd/s
         aIFsH7dSjiCX8fXI9xKnhfV2+qLQXWc/ksBH3ran1kJ597x1SpuyJp0FLg4uL0R+gRsp
         sE1H8ytDQhRS6suc486V+4n7YaroVXJUiOCSOXSQ8uL5QHjOt50T7oE3Pj4P7CoX7wbl
         TCU4tkmU22gOQzlPGdxb4jK/iVpW34fj3N/FPFeFxLOVyn5HiFpUjXK4i8HIMbAaLHvq
         79Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748236092; x=1748840892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ywmyN/RiFF7WteRQHUKPH3zi5cyGT7RpRE4XhtfXD3Q=;
        b=nkPYGll43yQpDxVWmZF1tlMlRtspeOs47uKgTcXB3CSoxrMY4vjGXCnyhfyWb0XIAI
         yVc8DWLrPkwWhb5pr1RTX0xBkUsagltW9y/q/NXr3IoL06uEEwfa+z6qrAhTfvCmQ6+A
         5jLyvXtLEOF7xGsx5JphSeDPfR+bimRlmbiQN/hCBa/Zbyd8gOL2a6B8MEv0XDeO83XW
         V+aITCupe0iDV2zP9OVKe+HpiM0nPeOy8gB47lsMxqUIOE2CKHZ0HrAoQX+9e1ZPZnzK
         HBdTXY8gteRAYbz3HjA1cum5vplAAmxxdZYZzGujECW1HUpERt/YdKdrDAv+A4v9JgQ/
         umCg==
X-Forwarded-Encrypted: i=1; AJvYcCXcxUbxZpTcJWA4fo1+GIU/Z8GB9LKYtNI8k0ZkPjQH2pQzG00K60YtLeidYEo4JRqSPLUrUQQqdZKcXrs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIRq6ouE3HtW64lKTUYe6bcXfpb+a7+Hpry8WYFxZs2dmYwWwc
	s0rxDEriga01F9nc9yiv9LO6Dc8/k5nh/wBrZ/MIBFWn5R5ZXWGUSIyuwExUQMuaB0s9TnHbJKi
	G0oQgF+dS1ae3bqiL3inWYx1tbnsc4JHKg/0+AYqAIw==
X-Gm-Gg: ASbGncs8DtR2Fj24f5cpgajn0hCf2jIhXmriPFZ8dxPuA1zR42SaElu3Jit/QYjWfOc
	0sMaPdOM1ZWf7qmiGHGF17pD/c/NTzUXcUxo++yS/fMNtT3xj9hIQT2OKc98m0ITEXSJsUFuxO2
	sFFiKkosocw0gg0a9gCyflHhoIbdSx6eDiRSqE04cDlwqhJ/FvHuzvKYjgNVcsIm2yrhnCUu2ba
	4s8
X-Google-Smtp-Source: AGHT+IHQtcTKnTqIqu1AWfIXts75t/CEdk2U0zHZsJFQRNgEtFrrICKZ1gNLvc7nyaNDbGUkXhq5BKtnb5bMzcgZXLo=
X-Received: by 2002:a05:600c:6215:b0:43d:40b0:5b with SMTP id
 5b1f17b1804b1-44c932f9411mr60425455e9.25.1748236092265; Sun, 25 May 2025
 22:08:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?5oi455Sw5pmD5aSq?= <kota.toda@gmo-cybersecurity.com>
Date: Mon, 26 May 2025 14:08:01 +0900
X-Gm-Features: AX0GCFsCp7T-RWT5r2wyD3bTuMWuFueQJ7SnXQQHT4ejrzVyXl82yc9Vvz4Q4nc
Message-ID: <CAA3_Gnogt7GR0gZVZwQ4vXXav6TpXMK6t=QTLsqKOaX3Bo_tNA@mail.gmail.com>
Subject: [PATCH net] bonding: Fix header_ops type confusion
To: =?UTF-8?B?5oi455Sw5pmD5aSq?= <kota.toda@gmo-cybersecurity.com>
Cc: =?UTF-8?B?5bCP5rGg5oKg55Sf?= <yuki.koike@gmo-cybersecurity.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, pabeni@redhat.com, 
	edumazet@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In bond_setup_by_slave(), the slave=E2=80=99s header_ops are unconditionall=
y
copied into the bonding device. As a result, the bonding device may invoke
the slave-specific header operations on itself, causing
netdev_priv(bond_dev) (a struct bonding) to be incorrectly interpreted
as the slave's private-data type.

This type-confusion bug can lead to out-of-bounds writes into the skb,
resulting in memory corruption.

This patch adds two members to struct bonding, bond_header_ops and
header_slave_dev, to avoid type-confusion while keeping track of the
slave's header_ops.

Fixes: 1284cd3a2b740 (bonding: two small fixes for IPoIB support)
Signed-off-by: Kota Toda <kota.toda@gmo-cybersecurity.com>
Signed-off-by: Yuki Koike <yuki.koike@gmo-cybersecurity.com>
Co-Developed-by: Yuki Koike <yuki.koike@gmo-cybersecurity.com>
Reviewed-by: Paolo Abeni <pabeni@redhat.com>
Reported-by: Kota Toda <kota.toda@gmo-cybersecurity.com>
---
 drivers/net/bonding/bond_main.c | 61
++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 include/net/bonding.h           |  5 +++++
 2 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_mai=
n.c
index 8ea183da8d53..690f3e0971d0 100644
--- a/drivers/net/bonding/bond_main.c
+++ b/drivers/net/bonding/bond_main.c
@@ -1619,14 +1619,65 @@ static void bond_compute_features(struct bonding *b=
ond)
     netdev_change_features(bond_dev);
 }

+static int bond_hard_header(struct sk_buff *skb, struct net_device *dev,
+        unsigned short type, const void *daddr,
+        const void *saddr, unsigned int len)
+{
+    struct bonding *bond =3D netdev_priv(dev);
+    struct net_device *slave_dev;
+
+    slave_dev =3D bond->header_slave_dev;
+
+    return dev_hard_header(skb, slave_dev, type, daddr, saddr, len);
+}
+
+static void bond_header_cache_update(struct hh_cache *hh, const
struct net_device *dev,
+        const unsigned char *haddr)
+{
+    const struct bonding *bond =3D netdev_priv(dev);
+    struct net_device *slave_dev;
+
+    slave_dev =3D bond->header_slave_dev;
+
+    if (!slave_dev->header_ops || !slave_dev->header_ops->cache_update)
+        return;
+
+    slave_dev->header_ops->cache_update(hh, slave_dev, haddr);
+}
+
 static void bond_setup_by_slave(struct net_device *bond_dev,
                 struct net_device *slave_dev)
 {
+    struct bonding *bond =3D netdev_priv(bond_dev);
     bool was_up =3D !!(bond_dev->flags & IFF_UP);

     dev_close(bond_dev);

-    bond_dev->header_ops        =3D slave_dev->header_ops;
+    /* Some functions are given dev as an argument
+     * while others not. When dev is not given, we cannot
+     * find out what is the slave device through struct bonding
+     * (the private data of bond_dev). Therefore, we need a raw
+     * header_ops variable instead of its pointer to const header_ops
+     * and assign slave's functions directly.
+     * For the other case, we set the wrapper functions that pass
+     * slave_dev to the wrapped functions.
+     */
+    bond->bond_header_ops.create =3D bond_hard_header;
+    bond->bond_header_ops.cache_update =3D bond_header_cache_update;
+    if (slave_dev->header_ops) {
+        bond->bond_header_ops.parse =3D slave_dev->header_ops->parse;
+        bond->bond_header_ops.cache =3D slave_dev->header_ops->cache;
+        bond->bond_header_ops.validate =3D slave_dev->header_ops->validate=
;
+        bond->bond_header_ops.parse_protocol =3D
slave_dev->header_ops->parse_protocol;
+    } else {
+        bond->bond_header_ops.parse =3D NULL;
+        bond->bond_header_ops.cache =3D NULL;
+        bond->bond_header_ops.validate =3D NULL;
+        bond->bond_header_ops.parse_protocol =3D NULL;
+    }
+
+    bond->header_slave_dev      =3D slave_dev;
+    bond_dev->header_ops        =3D &bond->bond_header_ops;

     bond_dev->type            =3D slave_dev->type;
     bond_dev->hard_header_len   =3D slave_dev->hard_header_len;
@@ -2676,6 +2727,14 @@ static int bond_release_and_destroy(struct
net_device *bond_dev,
     struct bonding *bond =3D netdev_priv(bond_dev);
     int ret;

+    /* If slave_dev is the earliest registered one, we must clear
+     * the variables related to header_ops to avoid dangling pointer.
+     */
+    if (bond->header_slave_dev =3D=3D slave_dev) {
+        bond->header_slave_dev =3D NULL;
+        bond_dev->header_ops =3D NULL;
+    }
+
     ret =3D __bond_release_one(bond_dev, slave_dev, false, true);
     if (ret =3D=3D 0 && !bond_has_slaves(bond) &&
         bond_dev->reg_state !=3D NETREG_UNREGISTERING) {
diff --git a/include/net/bonding.h b/include/net/bonding.h
index 95f67b308c19..cf8206187ce9 100644
--- a/include/net/bonding.h
+++ b/include/net/bonding.h
@@ -215,6 +215,11 @@ struct bond_ipsec {
  */
 struct bonding {
     struct   net_device *dev; /* first - useful for panic debug */
+    struct   net_device *header_slave_dev;  /* slave net_device for
header_ops */
+    /* maintained as a non-const variable
+     * because bond's header_ops should change depending on slaves.
+     */
+    struct   header_ops bond_header_ops;
     struct   slave __rcu *curr_active_slave;
     struct   slave __rcu *current_arp_slave;
     struct   slave __rcu *primary_slave;
