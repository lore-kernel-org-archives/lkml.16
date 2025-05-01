Received: from sonic313-47.consmr.mail.gq1.yahoo.com (sonic313-47.consmr.mail.gq1.yahoo.com [98.137.65.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86DF25F98D
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 21:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=98.137.65.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746133332; cv=none; b=i3ZRUeTo3CLnzK799ENGkNLTWhwXjh0dl4bk1nMVfnYjuPTHocOMi4HcT+3mUWO+v7F2uaOxJUsxHOUJ+swwqVvvcmCK89xwX+iK2jz6QV8p75NkbdgfASF5RC4YiGuIYAqUKiAZLbI675l21deAXRT0laHE9OX5e7U61AXj4ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746133332; c=relaxed/simple;
	bh=8BQgMnOPLzJcsHZKQXjtera8wmGFTGQ4Ws6OqMUcXpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=QWKeON+VycQSL2hDnWE/UhbDEsF75Op/WN8CrjrWWaF0oN8snu8X7eXIWY8UERE7FvEHze0U1aWXvlY/ZFvA4mmMaihFg4wB2KSeFnYMfk/BPj4d/mv3SQmYBAEyI+rJvwILYtNTrm65Ze7aXxWD0X1UUAov360r5/aOHCWn/Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com; spf=pass smtp.mailfrom=aol.com; dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b=jRmf07uf; arc=none smtp.client-ip=98.137.65.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aol.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b="jRmf07uf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1746133330; bh=tgdHuHwBD1KjujCVAxrOeOpzFBWKO2iH4yol6NkKnIg=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=jRmf07ufCLFTJazdCOQUJaMXe3vVR/BqzZAL+tOUZCybZhT/ybYJZmMUKb9PrnL9LS7y8ax2IpDq2Big+OHoGir9+zMo9m4w0GfYEE76uHglbLOdKg+BQkYa/URoAQCJyXXCZWS0omaN2c/Q90pgKaML3roArQqqvyswjCprAOFQP8TY89WCdEWJFHcq+AnYcmeoNeQPfNBQilmFQNmH8zxgppe1Op+HgvVgp3aY+F6UojxAKCmg3BXQ1JNOmByqeE55jE9LjumnI/PXOg1bX58O43/U/mPv4rebnfdpHpQ7iuzf59SXbbmOtfHvKXqNt46zzEsLMcbBqT8+wlIAuA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1746133330; bh=jURYFUP1G7TZH+xM81ojL1JKNBxv0NvvHU7POJsqc1S=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=JF2ci1Rcu9E/U2NeEWFbks6Lz51e9Qh8ZNqgm8W/afTfZVWfMXi5d2pSWTJAPzcpB4ib5gUJ0QQ2A22PDEww1D+jwaQYRZd2d4lzTyYv671uniT9joFI0mFlcSlyUd+MBSkQiMXDqAGbwDH4ZbikRvnNHgu68vzs4xfYJ9FAP2JfKMycR+JwruGREY7YylETQfxzRoc+ZHeyXePIOqbkG4dAXO39/SSMe4FYsV6dr/tKznbjJrEvIsMOUwqqCaIBUbYcVQK/DSuo41zMGxQnT3Ltnn9EtetazKPP/twJAf2+mazyMt6HFi4KhLBCIeCkrz4CbxLQKXbzJCupkt1qtg==
X-YMail-OSG: eZfxIRsVM1lXAgLGQpmlCbW_.QROo59wChths4C6DXV3OjF07XdBejwAZFOXZmo
 dQ.Hmkhi4JyNagM0AKQpRyx6uzC1UpDCTKaFbrduyWA.kZGaGNQz8pvuK2p0vBXobiQtJ8S4T66c
 8M6I4bdhqTZosm8PwrusYlm1hR98J63KHHRgsiDBwIOXW0Rij6tMEHHWObNP1rWuWXt3QnnMTYIi
 tEZ6STew08LCvQ878yY9YS2k378L_EfJnCt3LQIP3s99behB85PuS1BlwF3FaErA7rK22UcJeCus
 dlXuf3dIyVDxbBCBmo.ExNlkPZbUR5Q.kAjxEU8r8IvtQozfZFidhfA7qvLDtk5rlIKX2v8W78eN
 9aeXdNx4gkrVfgb0uXfaWceMhIRop6a2VGJtcyod1LBujFCs.gaBUB05C9Orb_yrPxcBoS.eQyWO
 e4Jr9qPTgIS97WRzQHpPdxtiAG6YD4Z7zfjQOi9X_Q5_SLTS.78xr87GJSjSnn_DPRInasSUUVf3
 KCZjP_FuXWwnn377kRraqYElTyccnxaseFTzMzM8TKGgBr_Y33_maSFiF3PsIwhGFpEECKJ_Kmx0
 QWs6Cu8uKf2mSKby3F76b0NWJG3NdsqvvMTqq0.HiOXIfmZx.xgFdPFLA8TlK6zNU7bSqZ4geMyr
 FwodcCO0xZDoAi79lS_lhE6v5bEvPnzVxNlibB215utlnTRdHoUOeBJsWRyadPzUslDsMwbTyq8f
 egX63o9irnCMiHjPA3jjmNUlJw5DCqUlC92hl3ccvuSRjFZz.NHNEYbTWkTG2wC6FDq4Ejq5XB3j
 hgC9euKUcvbuqVd1axGrCHkJZ5zaBZvixQycQfIKsmslbeU5S__iZtkVW2NVH6hOmV4wzAapEJPB
 _v4ASmhhDDpcI6bI3DVaz6sQIX1p7TtZLQXdsmadnf.oK9His3vejdbLvZsJBL_Y5yKxbsh9KTTW
 ZHZ7VN5.3fy2Z80Xu7EMHshdRgeu5TPxzOB74ecC2VezVnqdsu85H0IGHf0U9oinlkoVy.Pqzzg5
 86lsAyCK8KvFiQBfRwycPesj5YJfoQSiCosTNvASIdrHX7nF2JoaUu17zqvh76fcpSN1LmdY4iZg
 PEwt_MBmZIbCCzFeEw0SKbR9e8OP8Gkxh_ERtlo.reoaL1XWW.UgwOWh.UjkC_AUjz5Iuyme2ZGI
 7ARyBmJHASgTf.BFh4I6UMzutKKILFoGSgJtv3vb3GREgv9HZa.KxwquwUBtuGt05rU2eqBGg01V
 pA9LfMj17JItkWITRHPic3GDBv_8agcQg8sS76mltWm6YxC.lpYoNFME852FKbHkqPG0tQ6B8tog
 DcgP.qNzhKbSyVWFkehn.CSYAn9i67eRPRlD0bC_4R2Ytuh3Ef29HoRfCd_Qa1RyuWFo_t1ug.Si
 MqsUpahnwKhU9Nu2WHe7cjVT3EAdKsiC1ktbHSTHSV0mqoiYIenA65jO62YfNM4IZB4hTeF8ne1e
 gIqw3APgWN5pxSYAfBtSvpRvdFj2hwQj7oUbfTyU.er.RePjI4xpQWRa_wfl16S7.VwzNpfHTSnp
 P0MCDNqQXFohAhQxBGhaP3sVtFNFWtq26o9FnyF9AjGy_EK8D6E.DOfJ4YGi_IZ.MQTl.SReKASz
 VJUpaiIxDw9FOQViJmCjc0HfXb8vhqWlsC8Fazoe4ryX6V20Ue6341W0br7HqD9zLMcgIfvNiKb6
 FV0LhKtczzHvcIR_L2xLofadGVtgdPfYbGXoNLc1x7p._qbMbqcXrcez3lFBp5jYhx2H6dxC_4G.
 e50Vmo9rnvRdrXHkxr9wHNRRZR4HpqBMIJZQC8Wdu_ljX1sYSgcbBEKsHsMZFFjryxCS31WMS52f
 zZeX.sMdmTxdVNmb.hClmxAaKZWMeAVzJvMZhgDkgCvSskLW4bEbUXqHwqbEtl9EUldmOqhDPb11
 z15wUr9XXWRhhvTArVtI7Y6yoaI4en_IHB_7t6al1QO7N_.HbitvlHmeeGYoUfHKlvHTGw5w.yX9
 S3CnnLeq8du1YXcAQr2z8uWcacJVPIbum0Dc2QOSzGJ5T4YjlasEon7IgFEXCSU5HXF5FmbJCnhy
 FITWLfqI48OeDd4RYj40cTPNR6V3nxRbfCjR9RK9ZxKXRjPrpkVD.WACG30Q56VgkM_Tiyha73Ya
 VkE9Pi4uTYObo7YLpqQb73eynsWt1yls36soWTHO5uHALCuGF2WpFlOEfmVAXklPacq4bHWMKmjM
 9v_G52xB61VRYCsFX0Qnn.2alnjqUPLhDwUoqUnAf8uo84kl.gsV2Rh4EWMWXIICjU55bVHEDZEb
 4b7mHY1ZEAuOpfELQEcLptf1oHiTIr8YeONFqAwhCUx8_K_Vdron8CFWYe3c-
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: 5795e362-1f95-4e80-8c6d-965873ffca1e
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.gq1.yahoo.com with HTTP; Thu, 1 May 2025 21:02:10 +0000
Received: by hermes--production-ir2-858bd4ff7b-vtq9f (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 5a27a9df395be0c8f98fb626c99e5270;
          Thu, 01 May 2025 20:29:47 +0000 (UTC)
From: Ruben Wauters <rubenru09@aol.com>
To: "David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: Ruben Wauters <rubenru09@aol.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 net-next] ipv4: ip_tunnel: Replace strcpy use with strscpy
Date: Thu,  1 May 2025 21:23:55 +0100
Message-ID: <20250501202935.46318-1-rubenru09@aol.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250501202935.46318-1-rubenru09.ref@aol.com>

Use of strcpy is decpreated, replaces the use of strcpy with strscpy as
recommended.

strscpy was chosen as it requires a NUL terminated non-padded string,
which is the case here.

I am aware there is an explicit bounds check above the second instance,
however using strscpy protects against buffer overflows in any future
code, and there is no good reason I can see to not use it.

I have also replaced the scrscpy above that had 3 params with the
version using 2 params. These are functionally equivalent, but it is
cleaner to have both using 2 params.

Signed-off-by: Ruben Wauters <rubenru09@aol.com>
Reviewed-by: Simon Horman <horms@kernel.org>
---
Changes since v1:
Replace existing 3 parameter strscpy with 2 parameter scrscpy
Edit commit message adding justification for scrscpy and for added
changes
---
 net/ipv4/ip_tunnel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/ip_tunnel.c b/net/ipv4/ip_tunnel.c
index 3913ec89ad20..678b8f96e3e9 100644
--- a/net/ipv4/ip_tunnel.c
+++ b/net/ipv4/ip_tunnel.c
@@ -243,11 +243,11 @@ static struct net_device *__ip_tunnel_create(struct net *net,
 	if (parms->name[0]) {
 		if (!dev_valid_name(parms->name))
 			goto failed;
-		strscpy(name, parms->name, IFNAMSIZ);
+		strscpy(name, parms->name);
 	} else {
 		if (strlen(ops->kind) > (IFNAMSIZ - 3))
 			goto failed;
-		strcpy(name, ops->kind);
+		strscpy(name, ops->kind);
 		strcat(name, "%d");
 	}
 
-- 
2.48.1

