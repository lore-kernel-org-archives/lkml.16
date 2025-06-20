Received: from outbound.pv.icloud.com (p-west1-cluster6-host10-snip4-10.eps.apple.com [57.103.67.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1E128F51C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 14:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.67.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750430466; cv=none; b=DgE/oaPrVpJu0E4q2Tseh+K64fmWEZHCjl1tGZMb+fgKjCzO1aj83FymJS6oOPGgvKuoeS7d37AhS77LbkBCJtYE1iBCMncwoyOoWxXpzBoE2XwjiPsTH6JJHatTaTL44WeybxJxxQMc6bp+4Ig4H6YlcfOAOKHaok6qgvWxiUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750430466; c=relaxed/simple;
	bh=LcjSt/nGvmhhZqhV1lbIlUfcRdmY1AVKoDE4Y0rZ778=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YDOU3SiVrfwC/JggIaivIllnenc0O1ahPTzjytgwGUgk4Ofu3sUsdHTU2ib4t/58gQ2I//ago1pK++lP/JQNTMs3JcK8Tt9lNgqbNpD/FD2BbPvFiIxnAMTzotSC1/i2ngWhOtjmiq8hWAVrOzIinGKyOrlgNR/A7EatgaVW9aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=eEpw3Row; arc=none smtp.client-ip=57.103.67.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="eEpw3Row"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=5/FS7i6cquSDZ1MGYBD/5C+ATw4jDtBL80jA52quSRE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme;
	b=eEpw3RowqRWvDRng5yO8Tk9PhFhD8bC2arA5GNrtExPIbDshOG2dIdFOMLBAQ9rUI
	 Xxqsrl4stmrvAQr0LZ7RwpAdSqxb3f0C1C3fM3tEsbZfqX3Bez+tqUwMf57fgagQsw
	 eXhSKELBApjaTVM3FNnf0xuqX2nvF3S3L2lsh8Ij+PiCXPKclb7mdxLKVL2q3zZoIg
	 0QIzWcvopCJwGVGIWzvV5KcNTy8YiVx9o4ZYW5a83qG+skZZpgwQHpgelnp2EtXz/m
	 Ocbio96hdBb0TLYICWc0UBG6Jv1tAUYiQ2lCNOjaylmVLmKUIqzVPY1TvwNY9gsCCd
	 i+1VfRt4nCq2Q==
Received: from outbound.pv.icloud.com (localhost [127.0.0.1])
	by outbound.pv.icloud.com (Postfix) with ESMTPS id 7D4011803BE5;
	Fri, 20 Jun 2025 14:41:03 +0000 (UTC)
Received: from [192.168.1.26] (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id AEF97180B565;
	Fri, 20 Jun 2025 14:35:44 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Fri, 20 Jun 2025 22:35:18 +0800
Subject: [PATCH 1/3] char: misc: Remove redundant forward declarations
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-fix_mischar-v1-1-6c2716bbf1fa@oss.qualcomm.com>
References: <20250620-fix_mischar-v1-0-6c2716bbf1fa@oss.qualcomm.com>
In-Reply-To: <20250620-fix_mischar-v1-0-6c2716bbf1fa@oss.qualcomm.com>
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-kernel@vger.kernel.org, 
 Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: XDqqMO63qnK1jeRaF1pOA8Zw7036sNkg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEwNCBTYWx0ZWRfX0pe9SC4zM4yE
 16neVigBTlcuOF/+0SDZzHhkTKpndT75MNgf+UDT8kKBWUL9KPdEmzKyH2glQXm3r4D4acvfYxR
 WxZgZJhT0WOFNOSoCogihBp13jC7sj5WDsiJfqb6Sy+mjZL9lA+E0JqVP1Zl61oud/JAirWRtuk
 fjtA/VS3vmUotOxj3fAy/vWk/buRSN7ykzqnvxKzaJ+hgIkjW/detFIk0vBcIJycOXTMXmnhRoP
 712tD7B9peYz1/Mjozz85EQJcMruSP/Q1zshpE2Aefa1NQ5QGIaMDQrAkKKpfVa1rEm9D5GOc=
X-Proofpoint-ORIG-GUID: XDqqMO63qnK1jeRaF1pOA8Zw7036sNkg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_05,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999
 mlxscore=0 phishscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506060001 definitions=main-2506200104

From: Zijun Hu <zijun.hu@oss.qualcomm.com>

Header miscdevice.h includes linux/device.h which has definations for
below two forward declarations directly or indirectly:

struct device;
struct attribute_group;

Remove these redundant forward declarations from miscdevice.h

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 include/linux/miscdevice.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/linux/miscdevice.h b/include/linux/miscdevice.h
index 69e110c2b86a9b16c1637778a25e1eebb3fd0111..3e6deb00fc8535a7571f85489c74979e18385bad 100644
--- a/include/linux/miscdevice.h
+++ b/include/linux/miscdevice.h
@@ -73,9 +73,6 @@
 #define RFKILL_MINOR		242
 #define MISC_DYNAMIC_MINOR	255
 
-struct device;
-struct attribute_group;
-
 struct miscdevice {
 	int minor;
 	const char *name;

-- 
2.34.1

