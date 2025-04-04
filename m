Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2083.outbound.protection.outlook.com [40.107.104.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C901213BAE3
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 19:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.83
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743795273; cv=fail; b=fhUtoq2hPXXUKRCuj3oXkhAcRDuNTBz9dF/rtZJAUbhJ8KSELUWvWzllOwU57qXE7srctp/q8wgnZa/GKaXe8XramTz2zaYi30eiEcBkDbK+pPwWjlcRP4vSbHeGRk+EwIGGNg6q0fkjL7fv5lgyic6bploPp/J5QQGaAskVqRI=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743795273; c=relaxed/simple;
	bh=AtoqVAOM+NI5KC6emMxej6vSvdk+OWHaVvLypO3a6zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lLJ0Lxx3rzG/0Ai/eWJ7XC4xJ4wfFrEVxEr/SFyhTDeZ61hQ3t187fXY/Qbg6l/dWGhE4x+MPxRhMeYY0a1tgtCGivVUn5lZSEjEmJoyleCZX8jvrhoSo7/Ozim3BhI9Mjn8Z4YYH4gZxEmohd3shYRCOh7YYEEDe2aFkfz+NIg=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=c0yD95f0; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=c0yD95f0; arc=fail smtp.client-ip=40.107.104.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="c0yD95f0";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="c0yD95f0"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=uhAYzD54cnsaJuNZLmHf+LjdB/PG0Q/y0FW93eqsk9oWNA7jztTz7SoOOYA7nd4S2m1dWiwauBqB6Xgk6QidsR3+SzG69glk1iW9uPfDntMKBaO26pX4wyZqCyqVQZQTzkHpU1Ql1xS+kc/mcOx+1uDVdmJa+obRniU//LXmGwWmdYEeH5ZttjWu+WxI3vaoZpWBohEzlpLHxFHROvGnfrVagnfYzkTvlHK7xYtGS6bL4hFonJ7gV6QDXII3Ws0CnqU5QUpx3ZQ3RSMEuf+8l6GfCOfKsOUXYZScapWjgrObxKpMi7u3h6T0v0+QsCKK0MKQ1l8GEF/SKafOktm3Zw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AtoqVAOM+NI5KC6emMxej6vSvdk+OWHaVvLypO3a6zg=;
 b=X3rgh3QucokmWPeLxLVVihZJUCKiqQuTDZ4pFjZ/stttLVYkMjANxSd4cTY3mjbS/Dsx1/u4qVv6TRSY6KKjsRV800/5aEVYReBdVw+CX/LoA36nOb/rOd6CUNf6WuZDu7TiYZ0xpfz1vHq7yRUkgEUhWCIlAmd6g3Tth3yafqyIro6JromLCwhViw62GeeufqFh4z+AD89I5ggkkkhgRRyGnVkAU4GezHslGfQ37OO4poQ7WuhSt0DQPGWNaOTVVPXoqnSGTj+dhycOpDPD2VutpX4zZ+S8v0CmMy92lFNGj+y/Yj6KPpL6eWNAtRLbnvUb8CK6QfLKSIAPeTmqKQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 4.158.2.129) smtp.rcpttodomain=redhat.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AtoqVAOM+NI5KC6emMxej6vSvdk+OWHaVvLypO3a6zg=;
 b=c0yD95f0k0oSka6yVj4xUEKE8Q0VACVTF1PmNRbNDhecSQoKo8RVtt/oMkGAKqc73HOW4kEY6HbPd4YEP8CLxYJgrHeFu8Av7lvnmwjmmFz5XNirrCMwq1Ynb2EQI8aPrWaSxlboQA62Kb1Q/Yq7MsTtxNKSZmW3VunR91qRUFs=
Received: from DU2PR04CA0170.eurprd04.prod.outlook.com (2603:10a6:10:2b0::25)
 by AS8PR08MB9431.eurprd08.prod.outlook.com (2603:10a6:20b:5ed::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Fri, 4 Apr
 2025 19:34:26 +0000
Received: from DU2PEPF0001E9C4.eurprd03.prod.outlook.com
 (2603:10a6:10:2b0:cafe::b5) by DU2PR04CA0170.outlook.office365.com
 (2603:10a6:10:2b0::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.26 via Frontend Transport; Fri,
 4 Apr 2025 19:34:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com;
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C4.mail.protection.outlook.com (10.167.8.73) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22 via
 Frontend Transport; Fri, 4 Apr 2025 19:34:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s7I0LwkIVD+4z8GauypDUHL6UsH1OYSlpHH+x5ass5kFijujpI8J+xYnICmMzVls1GYl6zNnMA8+R7w1D82awB1g6XorwKcwVZ2UitF4KUJkLy5v56ILBgN4X4h6Ujb6HwIaviDIG9escIkEhrLS9+RCepzgCWW4slwPlJiXtvFev4uhMdbSxU1IrTDoeU4jHjbtdM+JA+/PEp2Qz4bfZGGXbcEmwSlM1vCR6kor8G6SUAuQ0qbQS5+6KuTqsIb4q3+8cBBZ9DD2lKQGlDC/HT2O5Qs6K4mHwV+/nAAvxRUlxlIsU/p4H2Sosoo9DtrHf23OjI2dievJPt6Y1ZP/IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AtoqVAOM+NI5KC6emMxej6vSvdk+OWHaVvLypO3a6zg=;
 b=ths7YC2LCVXPGoVoMI6JkyXhyCt3FTI+pFgtK1yfRZb17fViPn4wzBNA2L1qucA4fVRe4UhL3KqkqKZ86vkqCw/6D2ffjj5HxT5ZfhdtQmsLavEN+vpqZhQqti+sEXfaCE3YDJmbYAnS3mc6J+7PJMsEgZoLJlfu1W+nnMHSAn43gTPby0HlEYjJe5Ir68SZY/tDCnX8Osxc1nt/QKeF0hXxWmnQCX3Hq04JliBJmtF0nqM+FH6j0OKWOPDTBTbhB2V6wBY7H2DIl6DtCATNF9fOcRgaUD+h9IeETcFAVbt1OjoY0vQI7705KAXij47mQx55wWQDVL7HmLvZwh4Tyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AtoqVAOM+NI5KC6emMxej6vSvdk+OWHaVvLypO3a6zg=;
 b=c0yD95f0k0oSka6yVj4xUEKE8Q0VACVTF1PmNRbNDhecSQoKo8RVtt/oMkGAKqc73HOW4kEY6HbPd4YEP8CLxYJgrHeFu8Av7lvnmwjmmFz5XNirrCMwq1Ynb2EQI8aPrWaSxlboQA62Kb1Q/Yq7MsTtxNKSZmW3VunR91qRUFs=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DBBPR08MB6233.eurprd08.prod.outlook.com
 (2603:10a6:10:204::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.43; Fri, 4 Apr
 2025 19:33:52 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%6]) with mapi id 15.20.8534.043; Fri, 4 Apr 2025
 19:33:52 +0000
Date: Fri, 4 Apr 2025 20:33:48 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: David Hildenbrand <david@redhat.com>
Cc: catalin.marinas@arm.com, will@kernel.org, broonie@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, frederic@kernel.org, james.morse@arm.com,
	hardevsinh.palaniya@siliconsignals.io,
	shameerali.kolothum.thodi@huawei.com, huangxiaojia2@huawei.com,
	mark.rutland@arm.com, samuel.holland@sifive.com,
	palmer@rivosinc.com, charlie@rivosinc.com,
	thiago.bauermann@linaro.org, bgray@linux.ibm.com,
	tglx@linutronix.de, puranjay@kernel.org,
	yang@os.amperecomputing.com, mbenes@suse.cz,
	joel.granados@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, nd@arm.com
Subject: Re: [PATCH v2 0/4] support FEAT_MTE_STORE_ONLY feature
Message-ID: <Z/A0HJNtUkL+THCk@e129823.arm.com>
References: <20250403174701.74312-1-yeoreum.yun@arm.com>
 <1618bf36-7f7a-4d32-a6a6-242323007d67@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1618bf36-7f7a-4d32-a6a6-242323007d67@redhat.com>
X-ClientProxiedBy: LO4P123CA0008.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::13) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|DBBPR08MB6233:EE_|DU2PEPF0001E9C4:EE_|AS8PR08MB9431:EE_
X-MS-Office365-Filtering-Correlation-Id: 494e1a53-3ce4-4a9c-b7a6-08dd73afb572
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?ZWuewcmfWT+RYW77OBw7k1Fuh5zpJFiZaBslbvxE0RmClrDlDnNhxsSK2bzj?=
 =?us-ascii?Q?SaIlIj2XvkmCbTr/rZrF4hFUpB+UHUPSVvpKCU/yz8EGKR6Igrmec9Katn2D?=
 =?us-ascii?Q?mNpaYFBP6To8MWPlxp3fMVsVH+3PkGfGgmuQsASERi6ouhdy/MNGWt+840lp?=
 =?us-ascii?Q?k0upMRIdV73YuVpQOG/YMAvi1++CEpg2XXRhVtB7/Kr1MULJ/ynKsnB5tHMj?=
 =?us-ascii?Q?t+kCh7jozAAo6epJORq1wLTooLZjZBHWVJ04mtIw6dRE1tm0syrJyRb5HARq?=
 =?us-ascii?Q?Qqy31blB/Tv/F8XOKTuQXyOyr5q0oVyNS3wn/5SbWObr5c9FLtXYaFNtr+DL?=
 =?us-ascii?Q?TW8xhX5+/0K+HPFaIbKLZSR7YdpUgU5JMn6UllVGS5fTt8J0X1V7/qoKZ1JM?=
 =?us-ascii?Q?bCNqyj1YxJmyxR/kWJ5Erqgg8wwVgXY/DfDmQN1nph1QHMirluncexTi+1fQ?=
 =?us-ascii?Q?protY0271LOuLPk2ZEcI+QraQxtudzb7z1/MdF2+Dh0Qm3J94nJbQO6S8Zgn?=
 =?us-ascii?Q?WJ2l4OyYlwIB3ihztwVJaVW3dTBpDCfpe/+OJr2MB/q98BmCuQKQOskq1vCz?=
 =?us-ascii?Q?X0I+grpYUV29Exz/4/cDitQueCV+LVwbQloAjvslx1J7ZccvlJn4EczrPW8U?=
 =?us-ascii?Q?YQ+au5MDfTha6TwSXmzhzYJkuqgn0yNjAXZXRkXjQKbAGR7pkm9CyX0V34Wn?=
 =?us-ascii?Q?t9kcFi9/GJnQMIGjGfW4rfFaV0dAtS3xCfBC2IcR6g8Ddw0R52a0P5FrfhRZ?=
 =?us-ascii?Q?7c9E9ou7FphDS52q3NthwxfTRkFFqcsn3suoRQtUqGKDACUU8UvK+XCA+HCF?=
 =?us-ascii?Q?cXFopho5c51QDzzLz6FT18G5ekKoDT9YBXqjuojyiInPmraZ8CWiox49huPX?=
 =?us-ascii?Q?QWiPnG1Igm4LfXAyBjo467eWBXG8DjG8BNf4owN+hkFh56iGSBzz4E9shmJ+?=
 =?us-ascii?Q?xeR+ELm73h0Q9Q/9/ZcjOSy49JUs/fNuva3OLjVHkTW0AkMPltpr7N+27yPz?=
 =?us-ascii?Q?m5dQ1S/dCkdOOFA7VXjTutnZfo+2jrX2lDzh0jacC32ahl2CygaE2jtvxRNS?=
 =?us-ascii?Q?mSo2QGLajySE7HMSB/JFzXk1+9AdyW5sVhdWWpTFROCSEIqyM7QI0Gi6HJYB?=
 =?us-ascii?Q?Fa5cp0MWazwtH3KV8jQcGaJZfMYQpW503Lne8hQbDNCqm44r3C2PmtvZD7id?=
 =?us-ascii?Q?mWwqu7tE5X3E6J6LyDaKsaOfZHVQq9UbH1MM34CgoR+uXPLLq4uKIQPFNJzj?=
 =?us-ascii?Q?BLW/+XZwKA07jlvMFPeQ7mPNGV5cFHq6ZictY6uaj1npuI6yhIWsF5dNqX1m?=
 =?us-ascii?Q?jJCPrwdqdbZOX6laRtictYpn//P+NvllxqJTnvfWv4KB8xlIa6aouUWdKNTR?=
 =?us-ascii?Q?mrjwX6DaXYa7+UwZQTOTOKSsQDPm?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6233
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C4.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b1f79933-8b06-46dd-5592-08dd73afa154
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|1800799024|14060799003|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Gmb03PpldFhPLIhYEBqgDTG1hNKqxwT3HMV2gFeptJWV3Da85lEvVL3J9w24?=
 =?us-ascii?Q?8ZhBvZT26iGNeOGi31ZPGfjeb+6Ctx6BaMLo2L3PxNOPm4gH+fIu7docO5dG?=
 =?us-ascii?Q?f5I/MgEx4nDHbiu3dVWv2PJOZDbbLGdnrQZu2GZOogLQUWdTbhQrv3W4aH2P?=
 =?us-ascii?Q?dC8LCQ8z8oHF4WS6c41pIYUAEUIY1ffBswjSvXhrl4o1SSpz/GrQ7SLGhHKm?=
 =?us-ascii?Q?eoWVi5stTBn2SXug8fZaCIuDjFT+pPn6OS4v2+1VpQ26S4HpnfFDyxtmAkVD?=
 =?us-ascii?Q?hM732PdLp9kHxSYLL0a3MQme5sIfTqN2lRa5NPbXTYqDW0iABn6z5kjNwfZu?=
 =?us-ascii?Q?MvoBLe4hEusfQtQ+tAR0jSUPNki4tFOQpwhzfY0HmVLue2hhaOPqUJmI2FI7?=
 =?us-ascii?Q?wH+263GL67P+8jEseM9EFYYDr2vcGsmK8MkinRJRDY3JDN2NsM2Ad257WIKh?=
 =?us-ascii?Q?9HygVC39s+wOZrG3v3YYD62SpRH6n9JwRG6Omwy1vISLYeILOF/2iSH9+iQt?=
 =?us-ascii?Q?+5aEWhqduq3NVDKEhujacGqfoQRQG42cBQJ/rGICOYGxD4rw8RRiqtVBCSSC?=
 =?us-ascii?Q?wR7FeGC9Www2QYR10la6a1h5yqR2VVqz5qbsRGaPYDpCdMFDfrpjfet8DS/V?=
 =?us-ascii?Q?AiJR/T+4BsAghGkLNa8Gs93mX1roqzo3PpFvne3wQccREqF6LUf2M323ho+x?=
 =?us-ascii?Q?Vb2qgmrz9UuwV3lK9r1amFISSwy7w+AKLJBsghAp2EhrwCsIpXqJTqQeg8xr?=
 =?us-ascii?Q?Yyu1KrvUizjAMqKXdKVHgbO/C3aPpg5LKEVGJykNLRRlVyBR3MlBmPgTEigP?=
 =?us-ascii?Q?CSw51fi/v/b3CSLuBHAWe+EJcSAjHSuX3dWERQ8bHDrpN51idL9l+lyTa9N7?=
 =?us-ascii?Q?ia3PlRTq45cpN232lgYLw7tpmRLQnNqg1w9m19Zn6HtNW3Sxl/yO3VKdNWZ4?=
 =?us-ascii?Q?iF8WmztlJAvGPMchbMtiN7j68xhWB+ZkghNdcWRgNWrKS/nZ7468oNOxcaGj?=
 =?us-ascii?Q?YS3TFxqO9wpWtixIElbobQlDmbGXwfy+BYJgYJsfXGsCkyqytOigFDGA4lr1?=
 =?us-ascii?Q?4cKD/2rqPjtnI3Hlq58PNVLIKaZ4IC2ML9PEzPWkt+jouWjGZVru/DePc+Jr?=
 =?us-ascii?Q?bzOWC3Ffmf/e53mqtEiyu5zO3Zl6P0qsudlWSvVeIRsdski0fVqbH/E2DcB6?=
 =?us-ascii?Q?JEiwbLddHyeM0YzFiZYR4mrgFp4Dtx2p0CVhkLAxWOYXUQOpiAp5o1KAw7Lc?=
 =?us-ascii?Q?nNJvl5n+r7pDSN7pM9OK31jjK2wzzHGR6VJykKAYwqBn5VT6SyKqmnIi99Ps?=
 =?us-ascii?Q?07fSXsNyHfQL1mrgyHX/oCK9rfz9gyIMB9m0xfm+oz75x/8HGpGNxkTDCGSJ?=
 =?us-ascii?Q?6He5KoR3w880gAYJTFDgKz7gBbYv/iZaJDrCwHJEisPFLzea7KFpq4I5qzHF?=
 =?us-ascii?Q?4WXjeYeEHkyPz4E/Om15mTJWGSFrO2jwWXk0Mb2fqM2Lh6XA/EBg7SNbiaVa?=
 =?us-ascii?Q?yt6m50b1W71hacCjZQ7u7TAZrG1gVV346PtH?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(1800799024)(14060799003)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 19:34:25.6206
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 494e1a53-3ce4-4a9c-b7a6-08dd73afb572
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9431

Hi David.

> On 03.04.25 19:46, Yeoreum Yun wrote:
> > The FEAT_MTE_STORE_ONLY feature provides support for
> > tag check for store operation only. read operation is considered
> > as unchecked operation so it doesn't raise tag check fault.
>
> Can you add/share more details of what the implications are, how it would be
> used, who would set it, etc.
>
> Just from staring at this short paragraph leaves me rather clueless.
>

Sorry for my bad.

ARMv8.5 based processors introduce the Memory Tagging Extension (MTE) feature.
MTE is built on top of the ARMv8.0 virtual address tagging TBI
(Top Byte Ignore) feature and allows software to access a 4-bit
allocation tag for each 16-byte granule in the physical address space.
A logical tag is derived from bits 59-56 of the virtual
address used for the memory access. A CPU with MTE enabled will compare
the logical tag against the allocation tag and potentially raise an
tag check fault on mismatch, subject to system registers configuration.

Since ARMv8.9, FEAT_MTE_STORE_ONLY can be used to restrict raise of tag
check fault on store operation only.
For this, application can use PR_MTE_STORE_ONLY flag
when it sets the MTE setting with prctl().

This would be useful for debugging purpose
i.e) finding memory courruption point, use-after-free and etc.

--
Sincerely,
Yeoreum Yun
