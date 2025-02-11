Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04olkn2079.outbound.protection.outlook.com [40.92.46.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EBF1E9B03;
	Tue, 11 Feb 2025 09:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.46.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739266332; cv=fail; b=Uy31CAlALb7IAJEzxlbFjWxNnTSuIDnJMkrYh5deosD92YFs3ePg0c//KfRp1r2lGG0u/ku6X2DFK51jggtlx9fEISDpSQl8abdWp/axEkc5Xn6RS7bBw68zjlv55L4T6SQJBc+6FNVrZHEhK+8Ybs6hcTSyvOQ7sqN5x5pTCno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739266332; c=relaxed/simple;
	bh=e3vA3cdqJ/nbpne+XOXKFCm9omBKYmuns200vOG+b2w=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ZybN8vbbUndpPywsoyQDK8RSVozXsr7DPsbuxT2XjeM4sNc8s0c50yQaWLaz8WNhFjafd4cNav5tZ8fbrW4pduCWw2/RYzo+fPtefXpgNlOUNB3lMVUKHkTF5+AkoBbMYbCQg6dV3T0YBEuvgztZfl9dejujVubsg/ThGZggzYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=YMNBlERf; arc=fail smtp.client-ip=40.92.46.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="YMNBlERf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NyXD6SKzsSJXi04E745lYenHOdRio6UYSwFewz+O5OMbmBKrN2ovsXhBq1w/ubxywkjfFS/j4ipsg766B+soyIvMj6mR160S3K5JBTDciglub5PdWYejEEtnmIb+otXnSpUc+ei6+ZZReJ9ZwJOdykNcoE16Fc+kt40fansVDObqNAXNHcobz9ZGIQWwkbgDZk3fi3Vzmz0/hiqQRj8F8miOhVSnweV7yM2xyAfEFEYjZuNEgdaoSuY/xoXPM2kSRA/xmkO1ee3EwfvBT/Sze8O0xx9EraiZwW5qbAn/PJ+6XEdjU1iX3LW9wQgUG1e1zJEXM0QHWMHllgabREpM7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLh2VJMQuV822bogWn6lLj3879BSGO0GePo4oisjVSY=;
 b=FeuveVDKxIGv30drxT489rKTi2qTNVw92H8scIDEKSOMj8Lcxi/sYeWinwBorW8XxuOJAJvCgUX92cboDB4LC3S3Dneui3WKLHON7rVieYcJwcneI8aaAF1HQQ1K2yl7/l0lkN8XcNg8yupor83hA9aVvdwu3RcKdy6tFkKrWNjLYdd10p/vmwKLwVZpMUZ2/PBwLtzTExzZFb2gGKX4p0Zus2Z8CoTmiBf5YDQtN2m1TeSvJNV/tL0H7wiSHbjsULe3sDulzHB9Hhhifk1IzihZjbTw+XeTSZivbNnpnZLCOdKRPRGd04spJc7DQcMLgJ6UA0jkrajCtG13Yo4MlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLh2VJMQuV822bogWn6lLj3879BSGO0GePo4oisjVSY=;
 b=YMNBlERfCIkQA7pGD0zuMB/lMt4zOkSWpBVhc2z+NxarwjBGg/tY86LMEDZAIFu3KiSQOWJhoURWmPmJ/AFMtf/18o7nzW4ynIaJdFP6EFx25mBOsRAosa+m1D30m2VDf4vA5q8S1EqeeYZQ0sDAbf3dX4ODKJXAbI77E1mxCkeQ9Wd1FBKN3qhm2gDjswERpdZYXzncL+uiv5o3ZsP0XxddW8rH5p7JxFbZSQvcoZsyDZKl0xEbiqm8ijIGWbOu3T7IwDjBycrqd9fl2tOuVlKDHhQvpSX878bNoRIdffur0AurS1FcfzfrYpVCS/EOObRxT6cIKwCjZAeNckgYMw==
Received: from BYAPR12MB3205.namprd12.prod.outlook.com (2603:10b6:a03:134::32)
 by MW4PR12MB7166.namprd12.prod.outlook.com (2603:10b6:303:224::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Tue, 11 Feb
 2025 09:32:08 +0000
Received: from BYAPR12MB3205.namprd12.prod.outlook.com
 ([fe80::489:5515:fcf2:b991]) by BYAPR12MB3205.namprd12.prod.outlook.com
 ([fe80::489:5515:fcf2:b991%5]) with mapi id 15.20.8422.012; Tue, 11 Feb 2025
 09:32:08 +0000
From: Zhou Stephen Eta <stephen.eta.zhou@outlook.com>
To: "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"mattst88@gmail.com" <mattst88@gmail.com>, "arnd@arndb.de" <arnd@arndb.de>,
	"paulmck@kernel.org" <paulmck@kernel.org>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>
CC: "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] arch/alpha: optimize virt_to_phys with compiler automatic
 sign extension
Thread-Topic: [PATCH] arch/alpha: optimize virt_to_phys with compiler
 automatic sign extension
Thread-Index: AQHbfGT8bXQnnoZcCkuc2ewxr4TU+w==
Date: Tue, 11 Feb 2025 09:32:08 +0000
Message-ID:
 <BYAPR12MB32057EF854A36230B5BC7E1AD5FD2@BYAPR12MB3205.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: aa
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB3205:EE_|MW4PR12MB7166:EE_
x-ms-office365-filtering-correlation-id: b2b1f6ca-5198-4cf5-5a32-08dd4a7ef443
x-microsoft-antispam:
 BCL:0;ARA:14566002|8060799006|15080799006|461199028|15030799003|19110799003|8062599003|102099032|440099028|3412199025|41001999003;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?rLLU7vJ12ohGwYSlxUmrvzYNrC5k3AFtxLzDUjSPMXh6FHwQn+AJA39C33RA?=
 =?us-ascii?Q?Lr/+TjJEVN7my8xPUqXkM2YyXoL4jfGiD3DWHJW7othPtxRD9mnMyBZleR0m?=
 =?us-ascii?Q?/o+dLT6n4mcZlhHf6i5EjqG4NaDC4RIBnUSYvhN061cJmA0XFPC8niNYIFBW?=
 =?us-ascii?Q?uXBJlUsrYKxkhISJWDwjedpRpMYTW3fzihgvzlAxoAUah+ETiRpjNN6gJXbM?=
 =?us-ascii?Q?PGpJ2xNBtG9fm0STv0nIfdiPTVZqHJhy20H5uWOA4SjeNIjQFJ9OPH9iwG65?=
 =?us-ascii?Q?Iv43dYQ20KMgt0aoqqysdetZrdAHOs22aPX5mknZcnZmC4P70GSjvegjhfEw?=
 =?us-ascii?Q?aw7xUxNG1VNGE+EZ2Mgq76Uh46gk+jjOjMJijAevowf6XMwUt/4vYHp6TbbP?=
 =?us-ascii?Q?lE5V07prIpQWHPM3DtyPesnRaJ+ioH1kRHnmMcCmGVYVk76Z1IzGk1T9FwzG?=
 =?us-ascii?Q?Swh7KiPS2IUppLkJ6FM69Wk0qz+8JNxAZo4JAdP2mOwozY0ghDyhq9oRFz2E?=
 =?us-ascii?Q?I1vUGC4Dtenhiwe6deWzQdIOxyJaoLPpL+wQ64VwJ/AvVat0+TBBWU+MhHV8?=
 =?us-ascii?Q?tlefGZxcF/X719vd1hbwJcuvQ919OsYEt8F8Pv8b3JP8guedoXt/8kTiRkji?=
 =?us-ascii?Q?8OCHphh1jd5fXteo0oyae/a6uIrBAiXUD60Si8cXSgFsbvv0NRT/A7DAV1BK?=
 =?us-ascii?Q?0feWxs504DNiKcmv/b6jnKL/dB8f/0YmoMUV678r7v6mkRfT3ux7l66+wptS?=
 =?us-ascii?Q?ethSJJVfp4EMPix5GOY60j7zSTBjoIWDj2M3ulHDIqLtP/lDjv5fiY/oOJ8v?=
 =?us-ascii?Q?Xf3rrIgb/K6IlMcmhzpVTXg58qMRisMMZ7ugauSJreY7OtQTrd6RfIeGx8vf?=
 =?us-ascii?Q?ywopNFS/rQDZF1PfSCvMYzneBWeOkso6Se1MdiCc5JX85dwdmdJOSH83q5XI?=
 =?us-ascii?Q?/rFzzL7AxiXpoVixoqAMXXX4tKHxr97ycgaKxCKM+2/xJs0m6+XK5cOhhjHY?=
 =?us-ascii?Q?wFC+9nTcFaiYSUSXn7wMfylX6WgySAavwO5EwxLeI4Us9O+msbR2ENUR8DCq?=
 =?us-ascii?Q?F4bJsgB0Ili2RjPFKrW1dLwj2v3UUx6Ief+2MNQ12jkOi47nj+w=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?eMqqc4po4Mg5fteATIcSOq4d4FmrsfbidjW0eV+BssIveGG9c4JRkY7u3i7z?=
 =?us-ascii?Q?DRqvCnRb7WIWJ+dJ8tNmj5l+tS4yvojkM+H4zHZ4WmMMDovm+xyLix6FW2ae?=
 =?us-ascii?Q?T2cixlgGjRZ4BzBPSdgu7TKvsPNVIqPWvWrw6oxneEH8lmXK6QA8TpgXx/LH?=
 =?us-ascii?Q?iRzUiXXQi3AAyaPqPt0MZ3KnOhYdDOsSXNKGd0CsWFVrD3NXZwh24IFh9OBf?=
 =?us-ascii?Q?OtleHNyLEza1WMY9bNuRKRfP/kbW/MgSqQY+Ham441/FbRp20Z/BDupw8ytQ?=
 =?us-ascii?Q?nnatdDh0UvTW4BaXN/8mdDX5nYDQ1aFc8wjGBxg8Y2Rvhx3G2pxD1DmDjud4?=
 =?us-ascii?Q?HdThqcBwexpQbgK8QDUQdrt2fGJBFvGelEnNTD8dg502h5Q72gZdp1CEQJB3?=
 =?us-ascii?Q?/GkdxGCOJupUFyPfPEjNpo/PIf61lsTnwb2+kQKATlsFkqORF43OodTEKvt1?=
 =?us-ascii?Q?GyEajaASI55JbZSKc10RsKl6o05JpgQLEhZt0MiXmoQjTMEGsj3QIvTHPNNS?=
 =?us-ascii?Q?fvDF4U8eAdQfmOJ0CqoQKdR59GhAbm7Nl77XOW0LBTH5TrBxuGW89MwYobC5?=
 =?us-ascii?Q?hu9wbO7h8MnPugYkdB8oat4zRXuRwfbbSNVKsFKn5BOXZnL21mwtQLnzxFjS?=
 =?us-ascii?Q?jrAgshdgipOLqTfpyvyj71fkwEHyMbA96QY5F/1aVNLUenexGhxvMJ+B+Gef?=
 =?us-ascii?Q?kUMEcNUH5k9HfYlUcYZejWInSCK2VHE6Qjfb1aD2dAGRKUZFsJ2UpBhROxV+?=
 =?us-ascii?Q?OgKEA9pXTetzZP83ZKmDp2r53vbajJwH+F8FTnxNUfRD5UErNgNhH+M87q4k?=
 =?us-ascii?Q?FDnLZEY6TZxbl4mPcV/9kn5C7QAjU8GOEo/xqwjz6pXuJKMb8TiUfj0Kc18W?=
 =?us-ascii?Q?yOxF8S/lLQUKPlxFDJj0gJHqOpPtzIVbjwqptZZRlAAjGdHiXVaZRtqYz+j4?=
 =?us-ascii?Q?F5cJlvA3XhyLqAcyN33l9EL1zBa0AucNdjSHmEyQaxIqmf+UcnnZF3qmOSNC?=
 =?us-ascii?Q?QfxJ8mePuSHtThl1cr8LkbJxubvDZ+0OKQitPz2cBZj4/YmIyklZl9lha+W/?=
 =?us-ascii?Q?IdN/H+Z6VAV7VVesIIOsb9HtM9YDWN4x5Uq9BwtWsVrbD/Iqd4t/BuY1gaBB?=
 =?us-ascii?Q?LQSkDxkVXr8IcJpsNsWIZB4UEkgB2w9GECvEUV7VtGSFwp9fvzlpKz2+uHrI?=
 =?us-ascii?Q?UVlUKJogGVmNNW+GzBMF+OcwvjIPHJaW+uokHbOwvB+HC/tLTPC/yMnN5ykC?=
 =?us-ascii?Q?pvA7XknRvXKZJDUVpJ3e?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3205.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b2b1f6ca-5198-4cf5-5a32-08dd4a7ef443
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 09:32:08.0634
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7166

From 0bf2dd816c8369e2c690869b5f6c671f28c2b196 Mon Sep 17 00:00:00 2001=0A=
From: "stephen.eta.zhou" <stephen.eta.zhou@outlook.com>=0A=
Date: Tue, 11 Feb 2025 16:48:14 +0800=0A=
Subject: [PATCH] arch/alpha: optimize virt_to_phys with compiler automatic=
=0A=
 sign extension=0A=
=0A=
In the `virt_to_phys` function, the following changes have been made:=0A=
1. **Automatic Sign Extension**:=0A=
   - The manual sign extension code has been replaced with the=0A=
     compiler's automatic sign extension.=0A=
   - This simplifies the code and leverages the=0A=
     compiler's optimization.=0A=
=0A=
2. **Fix for 64-bit Address Overflow**:=0A=
   - Previously, when the input was a 64-bit address with a=0A=
     negative high bit (sign bit), the sign extension caused an=0A=
     overflow, resulting in an incorrect conversion to 0.=0A=
   - This issue has been addressed by using the compiler's=0A=
     automatic sign extension,=0A=
     which ensures proper handling of negative addresses.=0A=
=0A=
3. **NULL Pointer Check**:=0A=
   - A NULL pointer check has been added at the=0A=
     beginning of the function.=0A=
   - If the address is NULL, the function now=0A=
     returns 0 to prevent potential crashes.=0A=
=0A=
Signed-off-by: stephen.eta.zhou <stephen.eta.zhou@outlook.com>=0A=
---=0A=
 arch/alpha/include/asm/io.h | 8 +++++---=0A=
 1 file changed, 5 insertions(+), 3 deletions(-)=0A=
=0A=
diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h=0A=
index 65fe1e54c6da..4d7cd7486b7d 100644=0A=
--- a/arch/alpha/include/asm/io.h=0A=
+++ b/arch/alpha/include/asm/io.h=0A=
@@ -70,9 +70,11 @@ static inline unsigned long virt_to_phys(volatile void *=
address)=0A=
 {=0A=
         unsigned long phys =3D (unsigned long)address;=0A=
 =0A=
-	/* Sign-extend from bit 41.  */=0A=
-	phys <<=3D (64 - 41);=0A=
-	phys =3D (long)phys >> (64 - 41);=0A=
+	if (!address)=0A=
+		return 0;=0A=
+=0A=
+	/* Automatic Sign-extend  */=0A=
+	phys =3D (long)phys;=0A=
 =0A=
 	/* Crop to the physical address width of the processor.  */=0A=
         phys &=3D (1ul << hwrpb->pa_bits) - 1;=0A=
-- =0A=
2.25.1=0A=
=0A=
