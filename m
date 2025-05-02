Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2040.outbound.protection.outlook.com [40.107.21.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520AE23C4E4
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 10:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.40
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746182106; cv=fail; b=WX/ZONGRmUVEZIqw5wWshwf/hZx/XPbxMxK4WzthnPsKPNSf6qRjdXynykgSbgJctRhgYWssccf4A82w/5T2WeRKrff7gFigXGNGb7Zjc25xkHJuR23lC3oTnGU/K678JB+0HCizRLkTpdBPnOVnDzwmOB/J9GdMnC72S9yPVzk=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746182106; c=relaxed/simple;
	bh=mzJqxCGpSC45Jm8tKO735UOTR2bVXjSlcUT703+4FKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mAZTILEfgYyqVq5g/rBy8GqMaVRwc/rtTK90da+5jvOw0wpWmUt/M0CaDfGWx+OrOWuS2dOPjjQl8yh875FDCHMSPl0XvGHMBsMu0WlJwMyqjm/xjYFC3p7tQxiSUpPt/5NfA86uudhPlSGK1XL3ZkTGcBix6lJ1q4fIJIO+dHo=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=b3vkJqCw; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=b3vkJqCw; arc=fail smtp.client-ip=40.107.21.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="b3vkJqCw";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="b3vkJqCw"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Pft22UUa+PyKtUEDMG1C2iLSJwZTktfGoO1yFHNo9tO+bdv6ctaujypjAe2Loi4XVlvucG8OKk5grsVB8joR+9onlNesDBaCJUHRT9J1I+SvopKBp3w2aqfI2y8Kw+0GkYn4s8lk+pSCAo8/t+d8QXHmEMEQ33ZyH8J7hmd4oeMzh82+GZPazBnba1ws1Fkqiuozfn0mvLG4UWijh4t6/NeSIuGltACiCWfowr5l5APvglX7vt4ZK/bIgzVR4ukh+9Mmybj1MEuNdIYqZQxwBOA4Q2GaHJwzRYJITXVNKIIszkaoVDrVAGz7o4sMTwd/OInzodbc/+JFu/8HRJ93pg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzYgVSRd333DKATrQvbKSjYexpqyLoFCLB6U6mUq6h0=;
 b=ouy2LkTWgeBec+mYq6+CQseXfPd63Vvcf/Hc3dt1tZYnn6bAW4Lzj4WMXHt2LDSuClTkOlWCW2q5fTarYa/LIQUTrrMGPM3mimIq/xrszTIwvrcz+iq5JsX6KRaP6QFA118SuackcVx40XfEgS8s7m3WCVctgjPS1cbWXUkdf/oz2i+TGUFIqlsl/qIICqk0qi/+ApPZvBCLHaTzKX3ECkJ40fxQIosxdowtvmh8dz3TV8d0lT1WfUH1KuVHNtPR5oSK0dbytO3NINewDXUdPvEKTE0YThpCLbTPfmCWjE01nwJ8GiZKAeU0+d0VO1ciCV+UcZT/+rHyXUlfwlNPpw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzYgVSRd333DKATrQvbKSjYexpqyLoFCLB6U6mUq6h0=;
 b=b3vkJqCwJAfgqVJgY0QEAK2DGoaJ9z+6qcKLph290Nz+DcKDPxkDQRl3doYaN0t8IfJbrFU2oWpYW5jwFAh/ALKg6Dr5H4whfHA5CPoyEBgQqZtDgmOnHNDlbj1Xi4R9PEkQoQ7K1JWWDupJ/DplByy1fouf3gCoPFF3dGx6J/w=
Received: from DUZP191CA0041.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::20)
 by AS8PR08MB8948.eurprd08.prod.outlook.com (2603:10a6:20b:5b2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Fri, 2 May
 2025 10:34:54 +0000
Received: from DU2PEPF0001E9C6.eurprd03.prod.outlook.com
 (2603:10a6:10:4f8:cafe::79) by DUZP191CA0041.outlook.office365.com
 (2603:10a6:10:4f8::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Fri,
 2 May 2025 10:34:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C6.mail.protection.outlook.com (10.167.8.75) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.20 via
 Frontend Transport; Fri, 2 May 2025 10:34:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PQ4lw4UDhio8w9Gt1QzbHCz9eGrcBjSI8DkiOyxjMydsyRc3X8AEc1kqOrjfn/1l+2cKvcGBuEZEfvQFgzBzuaXKY0w6TO4X1JrU9Mo02Vr6gUwKnq3CUxmCHvykM1z9UMKQzAvG0fitILGXzTrpXpMzo1bC9dFkjQiwbJ/RDJTS1cPIBbW+xmKESyEng4NpFD2Ep06SRvrvTChykUtLnhcoaBs3pwJNT6iaSyUw6dR+27nocgmtDHUs7CwZsTxVeoAu8s1QEZS4u2l4rFQrCHdE3kTcda/3pmoE7z5GE5AWFwmxo2YgIUddIXIkJzdd7F5PXAMnz44Z3hCGh1xR2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzYgVSRd333DKATrQvbKSjYexpqyLoFCLB6U6mUq6h0=;
 b=kR+hLjyaJcVHjESWTnE1TQGQtF31aQy7+2Lj0pGNGyNV+NLVZrK52ekktrFpnLvG811IvPmwzw/ybvaoMmhY7HoWYzoqHoG7UMlvkdrFH52HWtuXd94k/lljF3OIHzefnudyBQ9al/eUuHoxWEqwjwn1yX9tqLDy//UxwC+dA+vIJF1MgmkcwrpDCi/dLL0XLewL+pjqSJusl4g5YPoNgwpRBWOd23eepRJtGwks48+tqKDvEUNsgSIzeosx7vdlRu+0AZvkas58orXqfu2A98rhk1fMLtWLnyMLLNyRsPHrLslPi7bOtRI/hj8pu54vIGFR5DvjdYoUSLJiCd0ybA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzYgVSRd333DKATrQvbKSjYexpqyLoFCLB6U6mUq6h0=;
 b=b3vkJqCwJAfgqVJgY0QEAK2DGoaJ9z+6qcKLph290Nz+DcKDPxkDQRl3doYaN0t8IfJbrFU2oWpYW5jwFAh/ALKg6Dr5H4whfHA5CPoyEBgQqZtDgmOnHNDlbj1Xi4R9PEkQoQ7K1JWWDupJ/DplByy1fouf3gCoPFF3dGx6J/w=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by PAWPR08MB11196.eurprd08.prod.outlook.com
 (2603:10a6:102:46d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Fri, 2 May
 2025 10:34:21 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%6]) with mapi id 15.20.8699.021; Fri, 2 May 2025
 10:34:20 +0000
Date: Fri, 2 May 2025 11:34:17 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: suzuki.poulose@arm.com, mike.leach@linaro.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] coresight: prevent deactivate active config while
 enabling the config
Message-ID: <aBSfqU9ssymM/yC5@e129823.arm.com>
References: <20250324191740.64964-1-yeoreum.yun@arm.com>
 <20250325151803.GD604566@e132581.arm.com>
 <Z+OuATAe31GbcKZ2@e129823.arm.com>
 <20250428162214.GG551819@e132581.arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428162214.GG551819@e132581.arm.com>
X-ClientProxiedBy: LO4P123CA0118.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::15) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|PAWPR08MB11196:EE_|DU2PEPF0001E9C6:EE_|AS8PR08MB8948:EE_
X-MS-Office365-Filtering-Correlation-Id: b85705fd-a13f-4c76-5166-08dd8964f9e5
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?6HwqQKSpQRStLRR20+Q/eSy82HjlpllxYl6GZkhqPQXN4eWicmY/4qkuP9ik?=
 =?us-ascii?Q?yI9JyMNn46Zc+rEGZFoe88qel25R6tP6RY/L+FKPAoNkw3oaLBTknt8npGFN?=
 =?us-ascii?Q?Y1++rGrdDGPVx6hoWrPoxvz4wHocCW/ekEPcPFA7N5kqszDzaUxIW0HVtTZP?=
 =?us-ascii?Q?Idp1N+f1jDdcd4BHrVwRAOjZOCm3fk0UmU/VQh5ErbSukacxLy5DeOtkQ2pH?=
 =?us-ascii?Q?Nvrjd9dRJr6FldICW1RGNNrNSAI1+aUIxtjqOvAo+IFGrlkitVXyjkixMqPo?=
 =?us-ascii?Q?4ByE0qjXIC+bRNsNsFZKtTVbaa9PvP91eCZpxgtCODvbg7a/SdPCMygCUbxB?=
 =?us-ascii?Q?hx/cUTDV8pBcbENewSPsKK3gScEl36Uu0a03xIRox0J5D5kDpR1D7TIvZ9Dh?=
 =?us-ascii?Q?uJWwSdbwLZ2jpY7MI7EMJ6DIKO42r6x8Hs0xeIxwdv/K+KxOpzM4Eb1dhx5q?=
 =?us-ascii?Q?QX7zwj7Sbj2iIs/e0si/Dk2uxXiTV89gCk7QblUAjsEqCO8/j4FFvuq4ynYS?=
 =?us-ascii?Q?vNAhm30Djl7qm9zXfEqp+avhBGOnvZKw4r+m9zkbRLibDLIqYmyZXwvBwMQh?=
 =?us-ascii?Q?nbXdRy9E0OkfVXwiCmLXHd+UffWV7V3hSWIYNhslu7JUGuZ7XaGZMdmzjnU5?=
 =?us-ascii?Q?ci+nbtuqsRzod26XeQ9Gr6rc5+XwF89vOKkEYno1zI2pjkWICjik+BmfSJCi?=
 =?us-ascii?Q?1M4sVPNsBiJbEGWjQXzaPmfW5j5dkPc0+Im8fJPHwzbewLJP6nFH46HcU6i7?=
 =?us-ascii?Q?Jd948Q9pgOSujraUnC5TbKS47p/1OXfDqSA+oVz5JVhYb63wOQ0dVQoaEmab?=
 =?us-ascii?Q?PMPKBWbQ0wCIvmazKPOJJJ0SdKkFXE4aYcnTbKawGB+hLN9U5s3EOoOwjgI8?=
 =?us-ascii?Q?/d4MYKy/fqIjyH2ydZma3XKPTSlV1BWkht7aX60YGFqsIJNvmvDRqW8SMls4?=
 =?us-ascii?Q?KUJJbku2Y0+ayvnVWdXpH3X2V3LI9ZJ3Dihp5Pt30OqE2SjWy/PI9X89RHUI?=
 =?us-ascii?Q?L8tmRjAIcbjGmeuKBscVK032PE9clCwDt5bRkMKqD/xqkZjkruwDVXvxtL7K?=
 =?us-ascii?Q?H5NAPpcgoaVKJo0OX8vQCJ4nm8ATbS5dpr1OTBLDJ2xbPkFxjdOTm+du8Nai?=
 =?us-ascii?Q?2F48UB4SjOIgVLv9e3/2sWsMNLnpWhSLD/hWoDFLdC2RUKQUp8azp338RjZf?=
 =?us-ascii?Q?Gu5xZ3ZHIOQCyYN7MTxOcF1Tb5t54juEGuUPICBZ+912Io7fj6yilG+NGlnB?=
 =?us-ascii?Q?ZLT6jaHkpzrJnzbQB/xjMRMdPr1twV/v3+a/lYsckdNyWx32LJ6mN1WJxTQ7?=
 =?us-ascii?Q?8qjcDePJBYaPNH/CRIGaYWGqTz7XZU+dbMsYraIP5cdUPToZP14HVlhw3XOy?=
 =?us-ascii?Q?XSg/JBSjyrXO07nCxyj8SMMp0PkKXHPOPerb0TJLBiTl11M8OPDUs9ZCk1mi?=
 =?us-ascii?Q?BjDoMFseVp8=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11196
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2513af46-f7a6-4fc8-9ebc-08dd8964e5be
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|35042699022|376014|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tcTzs33sduZkHT1CdcJR3G5EB43szi6rxEp1QEH5tU0OR0Et9+QtThWMhVoY?=
 =?us-ascii?Q?nEPGbQcNK/pOfaHrjScELEaHgxCBvpfhPF6g3tKv1/HMfgvoVte15gHgH7tS?=
 =?us-ascii?Q?VPR6TbiLKLJaOQ/rugQLRBC2Id/MaAYowuo98CMdP3au1O9TA8nUfyBb7xrT?=
 =?us-ascii?Q?JN8txdr9SBBQz8VBQLy0SW/YYsrX8hkl840u755Ll3SJXU3esFL9uK/9kvnr?=
 =?us-ascii?Q?iild4BrJPYwuFJmGGT0vLYp4C37xJzA0e1E5cYHEJjKtdrlfKpi/ly7FKgDz?=
 =?us-ascii?Q?OuDPBuZdGJbZA0jBpH7m6p/ZBn1IMQbvTpyYJcDRJM5DHmVrvTVKYAfwIClv?=
 =?us-ascii?Q?1wkMRZHk9uZRlTtpUlpKddggPa2f22vj6nNWB/HKPw0Mele5t2yS+q6BWGnH?=
 =?us-ascii?Q?FkB4jDF0tkmfCo8Lsejwv94m3KM/a6959FCpvA6mYtY5ubUXHTPl6Mk6H3zK?=
 =?us-ascii?Q?8Hsf/1hyw9WAY1J6IFEPvf3UbofhD0DfJ1OhWpPeRPBMRySvLf5tkOpTF55z?=
 =?us-ascii?Q?t+1vr9gxBbPFdlqAU8XpFCPSs0w1LyZaeXxdgdWAfC7nuy5to++NMDzBfQfR?=
 =?us-ascii?Q?B3gXVthpx+IsWSs+zYM35bTs3Nm4jUOYfj//btlL+Pguqs+dDjMsQorqU+1Q?=
 =?us-ascii?Q?xuJYPx38VG92HkKP+xjgxWhriVXIBq9h2Hq4ej/YKCtCkYFmAxXOl4DrSDVP?=
 =?us-ascii?Q?r9rhkDWC53I0jb8S3UGr2XpiVvvKLdwYlQjqXC1q1dX5G7wG2GSI5cW4OLZt?=
 =?us-ascii?Q?BWyCSCfOnbtOd1MrKUX+E7MPAvlLflxbyPpIk6+IrPNW9d67BVCbE6ndnV/T?=
 =?us-ascii?Q?+M0jp7xzQqq5ik4T5/X9agAaPZlrpN2IFgPllUrEoMJri2ze/HPvhEfdgR7L?=
 =?us-ascii?Q?vPPXUc7/6b+b/4IwH4ttopOIKqnQ6XOUIn3p6s0SUKIh1xvujPB1Myw5R9bQ?=
 =?us-ascii?Q?vyMHYsZR4Q7a/yp4+VJxzH9j+xioiZZQ2sY66TtgXFjKViHKEDcWDgZTECOE?=
 =?us-ascii?Q?GxKTleoS6O35sxzG0yG8GZ0BkhvLPW3jWHwLQfiFo0iaFri3ZZ0CnlYw/xOq?=
 =?us-ascii?Q?Sb4p+RivjFuwPFJMnBnU/J7Cba4BwQHopefW+H6oqFmCiJYElTg+1+RIK8hB?=
 =?us-ascii?Q?CSrS64AxR8he78fDAlorG9UXngpYHBrnGBfD6a+1aA1VCdqEuUmildmz/eSI?=
 =?us-ascii?Q?ciFue4lZ4taAsiLoqSMoYqB0KhRF/1q5NxdO3vthTZlisilyNcWCpmIgcV1G?=
 =?us-ascii?Q?S8GXJjz12s4WMda1KuVkenoQv4Zq/NDkaNM85UulHICXYmVKxC2S0Pk7VSvE?=
 =?us-ascii?Q?cRizHOEOXehPZrYwbiobiRZrJNnycB9Eb1/qXyjCrCx1oUVbpNsySR4PHaLZ?=
 =?us-ascii?Q?9DDUaVWtQu+A/zgtXzyiMosfzg14W4mEStcu9bUXrkwj1ChFCeTbXJ7ChwWl?=
 =?us-ascii?Q?mBbbpX+wN1TDpREfKTogoGiV9Voe/IhHKN3IQykdK+AyGGgM/W04CMq13MjW?=
 =?us-ascii?Q?/bcwT2Lmy9yVz6IbS7pdPX9xjCq4os5s8BfF?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(35042699022)(376014)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 10:34:53.7623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b85705fd-a13f-4c76-5166-08dd8964f9e5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8948

Hi Leo,

>
> [...]
>
> > > > --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > > > +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > > > @@ -1020,6 +1020,9 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
> > > >  	smp_call_function_single(drvdata->cpu, etm4_disable_hw, drvdata, 1);
> > > >
> > > >  	raw_spin_unlock(&drvdata->spinlock);
> > > > +
> > > > +	cscfg_csdev_disable_active_config(csdev);
> > > > +
> > >
> > > In general, we need to split changes into several patches if each
> > > addresses a different issue.  From my understanding, the change above is
> > > to fix missing to disable config when disable Sysfs mode.
> > >
> > > If so, could we use a seperate patch for this change?
> > >
> >
> > It's not a differnt issue. Without this line, the active count wouldn't
> > decrese and it raise another issue -- unloadable moudle for active_cnt :(
> > So I think it should be included in this patch.
>
> I read the code again and concluded the change above is not related to
> locking and would be a separate issue: when we close a Sysfs session,
> we need to disable a config on a CoreSight device.
> Could you clarify what is meaning "unloadable moudle for active_cnt"?
> I only saw "cscfg_mgr->sys_active_cnt" is used for module unloading,
> but have no clue why "active_cnt" impacts module unloading.

Yes. but it also related "by this patch".
When the load config and "activate" configuration via sysfs,
not only the cscfg_mgr->sys_active_cnt is increase but also
"individual cscfg->active_cnt".
This patch extends the meaning of "cscfg->active_cnt" includes
"enable of configuraiton". so that cscfg_config_desc_put() prevent
decrease "module reference" while holding individual active_cnt.
That's why without this change, the "module reference" couldn't be
decreased. The problem before this change is deactivation doesn't
chekc cscfg->active_cnt but put module reference whenever it calls.

> > > >  	cpus_read_unlock();
> > > >
> > > >  	/*
> > > > diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
> > > > index a70c1454b410..6d8c212ad434 100644
> > > > --- a/drivers/hwtracing/coresight/coresight-syscfg.c
> > > > +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
> > > > @@ -391,14 +391,17 @@ static void cscfg_owner_put(struct cscfg_load_owner_info *owner_info)
> > > >  static void cscfg_remove_owned_csdev_configs(struct coresight_device *csdev, void *load_owner)
> > > >  {
> > > >  	struct cscfg_config_csdev *config_csdev, *tmp;
> > > > +	unsigned long flags;
> > > >
> > > >  	if (list_empty(&csdev->config_csdev_list))
> > > >  		return;
> > > >
> > > > +	raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
> > >
> > > I think we should use spinlock to guard the condition checking
> > > list_empty().
> > >
> > > Here the race condition is the 'config_csdev_list' list and
> > > configurations on the list.  For atomicity, we should use lock to
> > > protect any operations on the list (read, add, delete, etc).
> >
> > Interesting... Would you let me know which race it is?
> > here to check list_empty(), it already guarded with "cscfg_mutex".
>
> Thanks for pointing out this.  I read the code and understood that in
> some scenarios the list is protected by the mutex "cscfg_mutex".
>
> I would argue for using locking, we need to make clear for two thigns:
>
> - What is the race condition;
> - What locking is used to protect the race condition.
>
> For current case, a CoreSight device has a config list, the race
> condition is the config list will be manipulated by multiple places
> (e.g., for module loading / unloading, opening or closing a perf or
> SysFS session).  So a spinlock is used to to protect the config list.
>
> "cscfg_mutex" is a high level lock, my understanding is to protect the
> high level operations from the Sysfs knobs, though sometimes it can
> mitigate the race condition on configuration list mentioned above, but
> the spinlock is the locking mechanism for the low level's config list
> on a CoreSight device.

[...]

> > However list_del() is special case because iterating config_csdev_list
> > can be done without cscfg_mutex -- see
> > cscfg_csdev_enable_active_config().
> > This gurad with spinlock purpose to guard race unloading and
> > get the config in cscfg_csdev_enable_active_config()
> > (Please see my response below...).
> >
> > the emptiness of config_csdev_list is guarded with cscfg_mutex.
> > therefore, It seems enough to guard iterating part with spinlock :)
>
> Mixed using cscfg_mutex and spinlock get code complexity, and I am a bit
> concerned this is not best practice.
>
> At a glance, I would say 'cscfg_mutex' is purposed to protect the global
> 'cscfg_mgr', per CoreSight device's config list should be protected by
> 'cscfg_csdev_lock'.

Agree. BTW this patch is just for bugfix and consider to backport to
lower version.
I think it would be better to improve lock related things with another
patch if it's necessary.

> > > A side topic, as here it adds locks for protecting 'config_csdev_list',
> > > I am wandering why we do not do the same thing for
> > > 'feature_csdev_list' (See cscfg_remove_owned_csdev_features() and
> > > cscfg_get_feat_csdev()).
> >
> > In case of feature, It's okay since it couldn't be accessed when it
> > gets failed to get related config.
>
> I looked at cscfg_load_feat_csdev(), it uses 'cscfg_csdev_lock' to
> protect the feature list.  This is why I thought the feature list also
> need to be protected by the lock.  Now it is only partially protected.

I don't think the feature don't need.
Since when add the configuration. "feature first and config second"
and reference and remove is done with  "config first and feature second".

That menas if enable logic get configuration, we can gurantee the
liveness of each feature.

> > When we see cscfg_csdev_enable_active_config(), the config could be
> > accessed without cscfg_mutex lock. so the config need to be guarded with
> > spin_lock otherwise it could be acquired while unload module
> > (after get active_cnt in search logic cscfg_csdev_enable_active_config()
> > and other running unloading process)
>
> To make things more clear, I have a questions.
>
> 'cscfg_mgr->sys_active_cnt' is used in the cscfg_unload_config_sets()
> function to decide if can unload module, if any configuration is
> active, why this variable cannot prevent unloading module?

because cscfg_unload_config_sets() runs in "unload_modules" where
module reference is 0.

in the diagram. the enable get the configuration but other cpu do
deactivate and unload together.
Here, by other sys_active_cnt becames 0. while enable logic get the
config's pointer.


> > But feature list is depends on config, If config is safe from
> > load/unload, this is not an issue so we don't need it.
> >
> > Thanks for your review!

--
Sincerely,
Yeoreum Yun
