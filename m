Received: from outbound-ip24a.ess.barracuda.com (outbound-ip24a.ess.barracuda.com [209.222.82.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20ED1F3FC1;
	Thu,  3 Apr 2025 14:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=209.222.82.206
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743691291; cv=fail; b=s6OSzVlseO5crLQFZR1xg00bvNXwphlV0RB5H1NJMiRtHo15OBXA6FncDVOcpCB7G2XXObdcOgBFqL4CqStTg3aO9pEu7LtWDjB2bULFcYRVOIWErTXmz16F7GnP3+sLV9yeuabdzDSEfwX45W0SkbRZ1LOqWf3w/noXQgaX+DU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743691291; c=relaxed/simple;
	bh=Ukt1DXXnFLLaWA61TKNizaTzcAMPUePKEtLXKDpHWvo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=pkKrifwIVYfZBHagdlqGfxvcStww646y98Q4OBRcMryLwo/xWt8F6rUo5BealaY1QRhiCiwFGxj5b9pJ40NJ0ntNySaKgYSAL4DIgg4QaRq7o2UQh/gq5ZR3NPsjMo2N/+Wu3echIvPt4DpuQT9YlSczyHshK/tdzdWhASAv7Us=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com; spf=pass smtp.mailfrom=digi.com; dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b=pnCaWXbb; arc=fail smtp.client-ip=209.222.82.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b="pnCaWXbb"
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2177.outbound.protection.outlook.com [104.47.73.177]) by mx-outbound9-129.us-east-2a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 03 Apr 2025 14:40:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PO4jdgqyc4N+SAMzay7QUTQ0RKI1HxXmOBRaSvnQ2g/itBsHYo9uqhD/XiXJL0ArvYVBYq+1g3+ymjKwHWjmMq4feG7RN77cQ3P6VzqhljLH8GOboEC8LFgp7oVtuKRfg4Xrr9yMOMMdkQKJVJYD5w6Gr2RDxlY6vpVsSXO/VBJdErUaHYhLyE50QsxzOnY9mXdx7exRnjb+1E0xpi+qNirrA+RDjkJ+u3VpVwQc1hTztsq8Sydjx/SAUH0n3rEnQUs6I29Fhth5tVxdYCUrAaIbl7iHmaLTzj0gr7W3duPFHLWvTseUJO1Q0/xG3b8i7qqB2t1xsHx21UT/Fuv7vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TKGP7fRr0nbNkvFuWxkTTcTy3m0ysrsc5fFOY/+z3oI=;
 b=eyIs4XoXv7daIeMMVkn6bPaWw3IVDq8pS/curKepOGTXCBWh3FMBuDb7nOUa9PvtqxdiJYDEOkPs+zZzl8qEKBUZk34q3FDNCHZ5Gugzx5j+1ONzJzB6QbeuLuIjNzfXm78aH7Kf3+CujpTytcOgF8yg7Ws9HPtYgLwwlmP/D41FCkx+b0oVgQQehGrvvRtQGeHTNmT7ZM6ijev1D/mtRALun3UU0Emh0x/MjaWK2T7Che81npZ03hOLYL/ZOO7t1fNwvU4Zw94JqwCO5k1ZEky/PDAHa/X5aFM/lF56xarCe7yIsOyjzbrbuF/eGyw6C348EinCYAGTZuB+BCm/wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TKGP7fRr0nbNkvFuWxkTTcTy3m0ysrsc5fFOY/+z3oI=;
 b=pnCaWXbbapHjDkR2gnrL5i1d+V1JVrAcm+6i4Hz0QsB9RKJqwwqggi7aNKHV6it5uYTsV7w16m0UlEipcAG89L4tOYKEcU+BiKPQ88tFDedMv7amZhKyPI4HkOnOTZtE+c4Q11EXGpPoFlXb7wFNa6a/nwcbYumiJzvGCHGJX0BTP6AchweUJuOPKGIa+Tsh1N/LxT2xGzcfLrMCEjuVp4aMOlOXocX4gW+RoEMX9KC1YgE92Z7VT5hSmI804z7CfjmDcDnw/HIkmmAtO0Ro1LIfJ+Z0HsRwKsNyodo/qAQEjL8yazdEUTFngQ5dS8mqz8OjUCD8OesXGHde+2ECcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from CO1PR10MB4561.namprd10.prod.outlook.com (2603:10b6:303:9d::15)
 by MN6PR10MB7442.namprd10.prod.outlook.com (2603:10b6:208:470::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.38; Thu, 3 Apr
 2025 14:40:48 +0000
Received: from CO1PR10MB4561.namprd10.prod.outlook.com
 ([fe80::ecc0:e020:de02:c448]) by CO1PR10MB4561.namprd10.prod.outlook.com
 ([fe80::ecc0:e020:de02:c448%4]) with mapi id 15.20.8583.038; Thu, 3 Apr 2025
 14:40:48 +0000
From: Robert Hodaszi <robert.hodaszi@digi.com>
To: gregkh@linuxfoundation.org,
	oneukum@suse.com
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	stern@rowland.harvard.edu,
	viro@zeniv.linux.org.uk,
	Robert Hodaszi <robert.hodaszi@digi.com>
Subject: [PATCH] usb: cdc-wdm: avoid setting WDM_READ for ZLP-s
Date: Thu,  3 Apr 2025 16:40:04 +0200
Message-ID: <20250403144004.3889125-1-robert.hodaszi@digi.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::20) To CO1PR10MB4561.namprd10.prod.outlook.com
 (2603:10b6:303:9d::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4561:EE_|MN6PR10MB7442:EE_
X-MS-Office365-Filtering-Correlation-Id: f8adeca2-c589-48e4-8202-08dd72bd861f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9KhrKam7zuWOTtsl8EXOwyVm4xhkQ8yvFTNB8kDY/cdijb2tjwGTqN+AGNvc?=
 =?us-ascii?Q?W+QLp/6HXy1rTaHowSnIGGfNHURWxTuP7OtHTBCMIJm58QqbDuU/cmMB/brl?=
 =?us-ascii?Q?vaxnYyCZq6IW5gyw72IIJ8F8YCP3TzIujJXujq/BuMNtWYRfZIs0qm3j77ua?=
 =?us-ascii?Q?T+sH9X9v5LmZQvb4eprN7lHfHj6NpWkUN+BQP66bm66A+Yiyip5zauQf4Jai?=
 =?us-ascii?Q?NKOBqUWSXxFnNASpiT18gL3NKeQwL3zYaBMEXEH3PtjrExd7TS3elVkLyn5y?=
 =?us-ascii?Q?P1fC6Evfl5IcJcSi3onlGBmY1S6GJmGzV+m1ybLnSTWSQjfhmCN2y6uU98Cb?=
 =?us-ascii?Q?SAdXH+EvUlVGM0pAxDmTdb5mUG0x3BOcJwspIjCVvryIv+qYw1nskhdHRdze?=
 =?us-ascii?Q?S1hMeu3Sy9ArGHYuSLxfADjBzbfoT0J8ln5Kby9wqKAINrUnDwEVMJXrGmnn?=
 =?us-ascii?Q?WQMGhgJA3oCzVL5dPXX5rIGiLoW+CGfqdSmtx0sGn8wm0Ads2k25tMN4SKls?=
 =?us-ascii?Q?JrU37kEdsK/fT0eVFYv03lyZb7rO1eSKyba9apqgE+gK9jFfM+LkTGd5qdDE?=
 =?us-ascii?Q?NvfVKM/C/tWHaVTLtKnvs+rL3dUyPYhvzxjCiUO7qretOKHhqVPiRz7/lQkt?=
 =?us-ascii?Q?2QozqPmxbuySn0OM5iUVTIYYI9unKQPBbiNRTBPO2OVj435JqUfVT8xWug6g?=
 =?us-ascii?Q?sLtTyl6FEUngPbVD+MpFoMWO4mt+4FTOPTpZgxsa/1PmDPjaBWpKWCVgpDTC?=
 =?us-ascii?Q?RVxgaE91docrg75sdZ4BFvmbCFIf8hKcmz8PEJgFK72y0h9jVfRazH+p2ICL?=
 =?us-ascii?Q?bbfoniKIR5XszC5LLgLKBgGewfUSc04TIa/KUg4b6MYmu5muNiUiOI2CyFSc?=
 =?us-ascii?Q?fgf1AAnjETFKdkAOclXq2Qu+NfxRbp7ahl4xHsOTC3NvsJ7zW/KmeNHNzrMz?=
 =?us-ascii?Q?thdGjgNe9zynX5ZBzymjbDRb3J9sFEfi3JDv4/wGfHvTRC4NeW0GT6j7noFG?=
 =?us-ascii?Q?1XXyXq9OMno+JXTxfHRa5eWfSkn/vEvDleyBgV97uwu0dUfDsEkSKfvSSNVQ?=
 =?us-ascii?Q?nC9TmfIi/035Qh9y7YTzyEVIgFL6cSUBcctNOf28pXJ6T/zfuC6ePL5qgzhB?=
 =?us-ascii?Q?DAoaqMlAU2EPegNtJCXyaWhqMp8wVWJPbOLNUXGZ3p+JRLjp0RD9zoLymq7R?=
 =?us-ascii?Q?e0MOJ6W4FqgPxJuRkX8YqfJRelSA7/y3uAsvdUmBNr1clGbmHEOeNd2h9hVj?=
 =?us-ascii?Q?vs01UV7PNLuhc6hkCRy96AeNpE37MdWoZ6J87U9grxnAuOQurbXhLG+qDeva?=
 =?us-ascii?Q?ZRtYmlENzv6j+FfiJcL35oA8cZ3NPBlZL/A7nfppW1/abH2PqZc2zkJdc5JH?=
 =?us-ascii?Q?GULl/F9mo3Bv1V7a0Orvq9iWOCVVsYuk4XzOlCVJKawcafIpWq0z9pPvA6vO?=
 =?us-ascii?Q?HP4tsv6Jkag7LDLKoEkVJe66xY7Hh9Mf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4561.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3rVD39235PBgVgbDNat6KgZi2X+VuqEi2xWL6eo09bpAW8HvKRrii/H+ShXv?=
 =?us-ascii?Q?7ouaiXB9wn0gqEivZafRcH+akfkYYOcymPlrHpSKJREOMnlWTldlPx1SPCKt?=
 =?us-ascii?Q?tag/zbJCHxMObtnA/xOapWZc4TNNYfaxlhCqVF6ss00SzV2LKpNipZQCADtN?=
 =?us-ascii?Q?ZgeOFx78LEEKK6nXR1exPUoVrgxLku2JhsbFsUVJJKru4lqTGLuWINKRvfPl?=
 =?us-ascii?Q?IH1w5Xn4tfCxG7Azh6my5G+K36rY1mod41kJ/EiYeLi0Arc8ICcEYmt+ZSzQ?=
 =?us-ascii?Q?NbmmJuDlzJD3SbQZYyp+gVLIFT6Z5OpcREBLe+7mCLOtFQyIysbfkAj3SeRP?=
 =?us-ascii?Q?XtWQIx+1j8AR46B6hl/OX7e+jkMsQ861Usy3/OEH/RjkGd6jx885MweG/yQQ?=
 =?us-ascii?Q?Vfo607/FkonQw014BUFTjATywh0AxgKQdVVzKTUxeQ8jyvx7DtrP89SXUoTV?=
 =?us-ascii?Q?7NdNUHTlm0qOYvh0s+hTOrY7KuPIw+ktoRpiRR8aN2HbN4ksT+IS5PBu3iiu?=
 =?us-ascii?Q?wKNUpbtktXP6CHExbjLY1XqfzmfjdXoNhALRX69GcNfxWGbHiZ7vMzBMiGz3?=
 =?us-ascii?Q?fjkPZUvdDbKNBwwZF3H4RTOHHIDEG+T70l/9MggYkT//bZIo2QFdbxoAc1mt?=
 =?us-ascii?Q?O+jJJ6989ElC5a1HPDAXEdqfdTmH5AtMMd5OoEM96Vtmm2OcO4Bz5/qmPBDF?=
 =?us-ascii?Q?FozuKYN9xrwy+KI1ugIMMbk/Xt7q4112JgouH3/oL5fbpdiSVWAnsNAXX+kZ?=
 =?us-ascii?Q?ZPPwOwAGMqYCRPkhrjzNq4NW+kWRiel1CSm3hjZjaccxEmmioPGunH/1q6S2?=
 =?us-ascii?Q?nw2+As6Oavq2qaqKQ3hxnBSPxIXhD/wKX/2CR/zXlE1K39zdRKJsJLpPlRuQ?=
 =?us-ascii?Q?KQZ0PVAGlKjjIiwa3cqOwwMEQEBbhuysrgBIAAuTqiR8BOignTDRXA4OwrGc?=
 =?us-ascii?Q?mLxHKCdcN/MrCtAAQyBprZTLHHsfIiThuz6FCtPirNL9pvAqolLXoeyeLfM6?=
 =?us-ascii?Q?SomrKfpu8CuBGg6yCx2TeDBDrvPmLUqUf5P/yIlR6dVX+0EW++B4yuqgrNyg?=
 =?us-ascii?Q?+boIzxWBlGT7bGqYCe8apBuBkU0u1SI76dp5bPS8bnAYflodM4ardfa4AXTI?=
 =?us-ascii?Q?dr+E++iztVR1JA9ed9xpOp5pEBILzLoEtLB+vOG+sLuxfIvIxp0fhlnhxJiA?=
 =?us-ascii?Q?9tyWLzX9Wt2R3PLQ7IkHGevcYR0KTdHVmw68d7X6KScKCtA7zHUz57mV1nI6?=
 =?us-ascii?Q?jp9gZIGj6g9XENc7053qm9jEEu/a+D5tnv0/1B55Ek15dqrcg9A3QVP2nFpH?=
 =?us-ascii?Q?HxPw79RdcAgNn29UDVWHmrLb1Fx1Nlvt5UFaFh8+dwnCe0BJCaPkFPCjISMy?=
 =?us-ascii?Q?JTjPL9nIORZmZ1E93UTU2QkSwYdTK9YQzCAPrgBjPdM8SpZCdolQHNZ5vwYh?=
 =?us-ascii?Q?CUkMw5HmQf/LnOnlU8E/GhCX5zniOCDJr4Iso1nDlpDZRJHscbPfppxTqjLf?=
 =?us-ascii?Q?OIWx+UMbSAn8t0/bPBG5vAOvWj59yhc8GqV5U+4CLTmPwEql0K/BlRmI7VE2?=
 =?us-ascii?Q?lQGEDiSuG+0kQPK5lbQunKH0ljGM5qLFH/fo5ZrG?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8adeca2-c589-48e4-8202-08dd72bd861f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4561.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 14:40:48.2654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3sYo7VeTu9l9kblU2ftrG+v4i8dTUFcfNNBXu6ZiqrwjD3tgPeEMzll2oy5j1cEJWvJNhjcmwDp14JjMzf84WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7442
X-BESS-ID: 1743691251-102433-7745-11178-1
X-BESS-VER: 2019.1_20250402.1544
X-BESS-Apparent-Source-IP: 104.47.73.177
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVsaG5qZAVgZQ0CA51TzZxMI80d
	AyLdXC0tLC0NggxdTI1DTJyNQ42dhIqTYWAD0rqH9BAAAA
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.263623 [from 
	cloudscan11-244.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status:1

Don't set WDM_READ flag in wdm_in_callback() for ZLP-s, otherwise when
userspace tries to poll for available data, it might - incorrectly -
believe there is something available, and when it tries to non-blocking
read it, it might get stuck in the read loop.

For example this is what glib does for non-blocking read (briefly):

  1. poll()
  2. if poll returns with non-zero, starts a read data loop:
    a. loop on poll() (EINTR disabled)
    b. if revents was set, reads data
      I. if read returns with EINTR or EAGAIN, goto 2.a.
      II. otherwise return with data

So if ZLP sets WDM_READ (#1), we expect data, and try to read it (#2).
But as that was a ZLP, and we are doing non-blocking read, wdm_read()
returns with EAGAIN (#2.b.I), so loop again, and try to read again
(#2.a.).

With glib, we might stuck in this loop forever, as EINTR is disabled
(#2.a).

Signed-off-by: Robert Hodaszi <robert.hodaszi@digi.com>
---
 drivers/usb/class/cdc-wdm.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index 86ee39db013f..28c5ed840a40 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -92,7 +92,6 @@ struct wdm_device {
 	u16			wMaxCommand;
 	u16			wMaxPacketSize;
 	__le16			inum;
-	int			reslength;
 	int			length;
 	int			read;
 	int			count;
@@ -214,6 +213,11 @@ static void wdm_in_callback(struct urb *urb)
 	if (desc->rerr == 0 && status != -EPIPE)
 		desc->rerr = status;
 
+	if (length == 0) {
+		dev_dbg(&desc->intf->dev, "received ZLP\n");
+		goto skip_zlp;
+	}
+
 	if (length + desc->length > desc->wMaxCommand) {
 		/* The buffer would overflow */
 		set_bit(WDM_OVERFLOW, &desc->flags);
@@ -222,18 +226,18 @@ static void wdm_in_callback(struct urb *urb)
 		if (!test_bit(WDM_OVERFLOW, &desc->flags)) {
 			memmove(desc->ubuf + desc->length, desc->inbuf, length);
 			desc->length += length;
-			desc->reslength = length;
 		}
 	}
 skip_error:
 
 	if (desc->rerr) {
 		/*
-		 * Since there was an error, userspace may decide to not read
-		 * any data after poll'ing.
+		 * If there was a ZLP or an error, userspace may decide to not
+		 * read any data after poll'ing.
 		 * We should respond to further attempts from the device to send
 		 * data, so that we can get unstuck.
 		 */
+skip_zlp:
 		schedule_work(&desc->service_outs_intr);
 	} else {
 		set_bit(WDM_READ, &desc->flags);
@@ -585,15 +589,6 @@ static ssize_t wdm_read
 			goto retry;
 		}
 
-		if (!desc->reslength) { /* zero length read */
-			dev_dbg(&desc->intf->dev, "zero length - clearing WDM_READ\n");
-			clear_bit(WDM_READ, &desc->flags);
-			rv = service_outstanding_interrupt(desc);
-			spin_unlock_irq(&desc->iuspin);
-			if (rv < 0)
-				goto err;
-			goto retry;
-		}
 		cntr = desc->length;
 		spin_unlock_irq(&desc->iuspin);
 	}
@@ -1005,7 +1000,7 @@ static void service_interrupt_work(struct work_struct *work)
 
 	spin_lock_irq(&desc->iuspin);
 	service_outstanding_interrupt(desc);
-	if (!desc->resp_count) {
+	if (!desc->resp_count && (desc->length || desc->rerr)) {
 		set_bit(WDM_READ, &desc->flags);
 		wake_up(&desc->wait);
 	}
-- 
2.43.0

