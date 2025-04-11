Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013046.outbound.protection.outlook.com [40.107.159.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4938C21D3F6
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 16:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.46
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744390137; cv=fail; b=PgIeJcMduTIZHzK4ewLyY0GjsNSYrxuMgYnpK1TvUWNyHba8+DB3h//1aq7rW1zcKYNtKUtGDu7V1g3Gh5H5ZBzEkkKxuGKXjVk+63ipT7kj8/QLk2ZEsXhPfozvTL93FXzUbaHx5KOt9VvM/kK+eFcxozTMs/LNoY+pUA8xUjA=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744390137; c=relaxed/simple;
	bh=8bt2QK3Jaew55hQRel1ofxQ3PE1AWDxp9WB65gHy3GU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=L29NBPhxHb3WHNRK/IPv5Rf5HwXW0dOsg4I/JEiC79LJuLa9HQFollKYL3xm7oXdxR1I3wCpnM2Ws+vIGRnXxaZrI/zcRCN526yIfXMT4iPCitXQXQYbNlNwiPJV47bPwScvCq8PAqL/UgNrn2Jv9++Js0i2sX9RaEt4G6W/X60=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=QG5xQR8v; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=QG5xQR8v; arc=fail smtp.client-ip=40.107.159.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="QG5xQR8v";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="QG5xQR8v"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=x2zle5JdjFaFnCopNjoCjx8bq8JXqDfZx9+jepKKTtmw8Eq1mrC8XY8TaK6gga21HmP54oCcmqRh/C6Q73o4B2Wt/F1e8xQfOHcPA56WvpsguJbR5sq+FRrWNOvc92kKwzx0t09GJecZB2lBlMG7l8NMd5no6r/9gbS5yDCQNJVPBkxsdVGF5bWG2ILbmd5KFyfKYXn0uq1ZNdqatrkuODHkMFA/8JpP16ghpx6M0gGGcrWp2ZcH1jGwcywqYjbmVDUBV5RJhs/tsEaPby5irmJjjb+Hsj3vJNXiMm1NsVJb6S/bZPac/9F8ThDY6HBIKnYajDlNwfZ9NosWqS9j+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vzizt5E338PnuUAEil2qsjw55tI1Oxg/xqDXZGAa6w0=;
 b=ykd4ERhwj4Fy0/KpIJSeoo0U19O1EiafCfg6HSDxXylTuEA2WHVVGzBPaFbL1dekkPsVbAcMODkfye5b/ZeavTXZ+Sexcd1S2RnHSm2jIjsfdOnlYIcFbAsPIqeXBUuI7lYNwZCGg/waPIQC5n7+WSVjmon59O8bMSXV8a3BpGV/MvPSdvCoGc1p7iSAWzrIuwjEfwKkJA499/+8biT/cnm6O6EIez2GYwmf7j8mcdbYUP5Nooogqf5xwMK+TEktXSzjYCkWrOOPPVWdOl2nm+i8pzJLQoHH1OZyE/B9JBS3knDwR29R6Auv6lE2pIltyXryjLqaNVFzQLcIANVzZQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vzizt5E338PnuUAEil2qsjw55tI1Oxg/xqDXZGAa6w0=;
 b=QG5xQR8vLVDkJIDKOS5K4RaaSDnq6//GDzbd6PpbmsbM9oLIpu67MEutsVxU6XRA599ny83B7K+q1MrOPxUZu87LtvFBq1QdsUwAr9/uebb/TP3APGfqoMvC2/s8vkaeGwD1LeOuPZoN8oj2+Tl4kVuV0Nveo4FLQtIhc6vn3Pc=
Received: from DUZPR01CA0194.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::19) by AS4PR08MB7603.eurprd08.prod.outlook.com
 (2603:10a6:20b:4cd::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 16:48:50 +0000
Received: from DU2PEPF00028D0D.eurprd03.prod.outlook.com
 (2603:10a6:10:4b6:cafe::9f) by DUZPR01CA0194.outlook.office365.com
 (2603:10a6:10:4b6::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Fri,
 11 Apr 2025 16:48:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D0D.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Fri, 11 Apr 2025 16:48:50 +0000
Received: ("Tessian outbound 15d661e369c7:v605"); Fri, 11 Apr 2025 16:48:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f52803acf18a4762
X-TessianGatewayMetadata: H6ImjYdMdYMFO7tuD1BvPU4sT2SxN2UOldA5jcMahmZKTJ1d5zvG966NrrP35qxBzE2MUeRUa3ABSsUJSMdlwu799SdeTC8dtCZofyF7axBgPCPet7ejh4bHr0gqgVjReWfsILeUPeEK07TZiT0sZ9h8AaCpNKq8Zh/Dp7cwy+A=
X-CR-MTA-TID: 64aa7808
Received: from L2c728b089e97.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E278D63C-140C-461C-AFC6-067A12821FC5.1;
	Fri, 11 Apr 2025 16:48:42 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L2c728b089e97.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Fri, 11 Apr 2025 16:48:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xdDNieTr1W8lkBHNO2MRmNyzEpExYGfV0bAlUtBAoVY905FKkVoq2LCAkmwn1tBzN5ibjO0T3NdpY/ZLmUXcuF/CW323Hu3JfqK0F3CcSKPHrt0qq3AR80mGtHHsmZqXaFIJlePkOEkoAr5z4Fv2xG5dKdEGzEO19EQlM4meBjsyLkBw3yaHNpIMmxNpBi0jDpRkHDOi1yaWmo8qXRCYkhNv5I7jmWhLg0anEAeovaHjYYt0pCSXs5Pl1gwr6BhPwNBmTHgcnSyvJBjln/nMpw6zlGsJVOXI2U61AFw4AxIYX0pIbejKYusLxKjL5vgydXJUD6P4SaHdmaUyjANCog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vzizt5E338PnuUAEil2qsjw55tI1Oxg/xqDXZGAa6w0=;
 b=W2GLxILxL+imp5XjOn7Os0w39f1w4zq1KTnRB8mMnLQ9rZjC2gyL8isRLU5hvhwM88w0z3yDnaEdoOjnQ/pB+Nm2qCZmTvzH/TtMbllvO1JxxuR67Ik3h75QLwbb+cao8u3gTWcSRar/5DTx72jvJdCWk5KcuKrkiVn65E1C3Orj1mC9s9v/TieG4D3Ww4RQdqx2ID8xyKmapfQUCA5c21bl0TdTShkSxBEw6kdvVH0SpKmIXKkGeaY6xhz1p7XJA20wRohctE6X6RUWZJgILrgibiThvGqYJ8Aj63xZHbG7rOYGHRaUnEGR2X59F7W1yzc+Bp1YdWiXFQE88WXAFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vzizt5E338PnuUAEil2qsjw55tI1Oxg/xqDXZGAa6w0=;
 b=QG5xQR8vLVDkJIDKOS5K4RaaSDnq6//GDzbd6PpbmsbM9oLIpu67MEutsVxU6XRA599ny83B7K+q1MrOPxUZu87LtvFBq1QdsUwAr9/uebb/TP3APGfqoMvC2/s8vkaeGwD1LeOuPZoN8oj2+Tl4kVuV0Nveo4FLQtIhc6vn3Pc=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB9PR08MB7605.eurprd08.prod.outlook.com
 (2603:10a6:10:308::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Fri, 11 Apr
 2025 16:48:39 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 16:48:39 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] drm/panthor: Add 64-bit register accessors
Date: Fri, 11 Apr 2025 17:48:03 +0100
Message-ID: <20250411164805.2015088-1-karunika.choo@arm.com>
X-Mailer: git-send-email 2.47.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0256.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::16) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	VI0PR08MB11200:EE_|DB9PR08MB7605:EE_|DU2PEPF00028D0D:EE_|AS4PR08MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: 651021a2-cc3a-43d4-b9f8-08dd7918bc5f
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?I7TJbpWGgnGibdeFCjf+5v0MFJaZ519pbJHp/7EYZ4RXAAccEe1+cS2U2Ta4?=
 =?us-ascii?Q?/d0rcuu5xccUC20Jvl8f3oJGFec0xgrepNrm1KCmaZkP84qR3a/oDsyqU2ll?=
 =?us-ascii?Q?8UOaWaO56G0T+Gm5aNFcPZBRaYdQPux+UrgSNwgWIUz2IdjjjSAFw+gnYN1a?=
 =?us-ascii?Q?tYpfQdo+gjZL7Klj+ECLtGBW0qP7BUTZE1w9juQqlTSgltcT9jQOcqsy64NL?=
 =?us-ascii?Q?uo3qwbdfhN/qJjrU40pEct5Q75yAyHARnJKYpayVdIx0iXE8WI/0pfI4gzQh?=
 =?us-ascii?Q?WOgoBnN2MX6CjJ0C1fX3+iE89u3q3jdFSmcbsbyLJEZWQiLdLRaul6juxsg2?=
 =?us-ascii?Q?ivoh57WI1lATkx3HDw6HxuKO80U1UblGHVsEbuor4ClvDU5YUAuq3AoQ8omW?=
 =?us-ascii?Q?dOBK2DWIU4vSxxR63EPB6Q9xW1WhdOhwDuNb94wB/53WGUD2UMRdl9g3YjbI?=
 =?us-ascii?Q?baMnkP/AfGhnueq4sz98xX0Agy+2U1AzDR54BZBoQMTwv3Y1cBDW5DcLV+/1?=
 =?us-ascii?Q?eaOk3P1kTo8u7CInaZ/OMmIS6qCVF6+Vd63MVNBhs7RjOuehJt/c5m/uaAc9?=
 =?us-ascii?Q?fjbbKR+dwkhNyGa0Ujd6WcVRW4pJB5rgigFfbM0ira2U8D26mBu5nOURCmT1?=
 =?us-ascii?Q?1G1FxD74d7wd6x9oGspkKrQHKYPqiFspD6cxDo1rJCDj1ebXaDvXMfWye1so?=
 =?us-ascii?Q?1Gi3V5FWe4297QxbYuaahJNC0Vj6me5AEZlJ1Y5ct6FPQeh7zZTPhwtGYz7Y?=
 =?us-ascii?Q?kpBUOeVJkC3bKgCVNCUm+M4POusSRLjk8DrDtE54dduTXvSh2vG+rdLidtG+?=
 =?us-ascii?Q?id/kylOwJiwoOSspzuQQjsjDvNM2EoLQNzbZrkzt0PlvyhBSauGfDuJg20Y6?=
 =?us-ascii?Q?vWSkZjPHl67zrkPcW/XMA+ckO3ljJ2ajCdmU5qYnJyE3hiUNtRcggVkT/QIM?=
 =?us-ascii?Q?ZJdLsp2wvPE+t85lEYnGuZt7H8htf7RDWLQEb+0rxO9IvZjsMOjrqah3Q3Jg?=
 =?us-ascii?Q?NloM4v2xH9ymz3hQrsk9ydnH0wxqxaY99JhR5zA2QqGX9XwuFRHh8swmZQbz?=
 =?us-ascii?Q?fqRJyy8KgCYrxvhCkexdneu5z7agiQSFUK8a1gt14twNcWLSFTQo5L+naOlh?=
 =?us-ascii?Q?9iQ+n+M1B63vDdtRkBxOiY+bns4CfXcf8ana6TnDY4VdZx9JKpM4CZ3YfgoH?=
 =?us-ascii?Q?pRGlQfVC4wVwBWMM/3KAPPV2dKZfMchfHBr1RedWuwROZR6dK1BAw/9S81CW?=
 =?us-ascii?Q?OTsBKUEaNE3IF58AiqTCMNZCgsQgoPkODcutBcAN7mtJd/RKqsJ9K/XVChOv?=
 =?us-ascii?Q?nXhWpHBiNEaprabBoaIADigookYC+ZVg/pFrVr+FKK+K4WRww64iXUwAbRKz?=
 =?us-ascii?Q?wGIjcUZNNHqw4FtjPBZbOdCSLBqctV6x9xHA3GxOP7kh72JqwnuuMlstUpaF?=
 =?us-ascii?Q?k5fPXCpypXk=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR08MB11200.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7605
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:800:257::18];domain=VI0PR08MB11200.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8e053a47-f189-4cdd-6398-08dd7918b5ce
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|36860700013|35042699022|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GK3TC+/ffmXCD/NPmDjJoqS5f8+ZeZKGrtytac3a3vmfMBfAWF5R2W4L+1WT?=
 =?us-ascii?Q?uhEEjNmghD0orU9Rwf7SlZDLBAy+dOr8NEaXG6WOwfvpcHL1YgnY1XO+IWat?=
 =?us-ascii?Q?bSZN+e+T45AqaoIdFahHuA8xBzSRsPLkYac9Z8XuvqfIaGiQiF48NAo6i9ac?=
 =?us-ascii?Q?2DijzLQWlqpdh3qVcmyKgdvRE2Sqz0vPRZvEeSlvDSx/SXYla0umkdEMzQrK?=
 =?us-ascii?Q?yWLw38AOMtWOxia7Bg3Zl+OzkjyDRHL3uZLwYOykE/NczbvyLJMFlI7JsKHI?=
 =?us-ascii?Q?KLO1mfwm0oH7Z8YvHdKhHldEAqh6BrLgeGPoitnX5vvJdtScfbRwHVJ/4b76?=
 =?us-ascii?Q?PshMoGrjInAO7fR5AeYpYmbl7cQ0uEVTdRscIBqKD4wffCXpkc39lhJmU+7v?=
 =?us-ascii?Q?0PQe/+u6zZcVOOB8Bl+GyamU99f3g+U7DrZORBJIBqSGojlxsDSyVGPi+emI?=
 =?us-ascii?Q?rBKdFRpcQETYNM2tL+O6MxSSWk5p71uROBecjQqRcVbrtPA1NJHpStcOb0OU?=
 =?us-ascii?Q?pqp34MDE/WYVoiEstAMKp5hJpmbC/j2Y6xmwGQS944KNM1DoflBgPX1rMIQ2?=
 =?us-ascii?Q?nPPJ2Glp8r8SYPrkwykcfGqpc+fUMfYnnY498KM3kj93VhZYj3BV1z4nur/v?=
 =?us-ascii?Q?UtSx98ncQHlHXE8KtAy4z1VFRBfWipdDCQB44GnnaxSfG6ZVnnZvWJhOXRN4?=
 =?us-ascii?Q?+cxapANXJZ4lfYF/p2PWqO0Y0SFcBHEmfdWPmGmGmRWjdteTa3eDmUdSyKBt?=
 =?us-ascii?Q?yZkB0oPgs4iua9nBq1JaFy6ljlqG2S/zfHbMa2m1jLoNldK9+ruD5Qq2kQXQ?=
 =?us-ascii?Q?ls6sLcpQv9/aH1ZVfr5YjHPRak41OpietH7I0P+4ApArNBTgT5ES6ZrYfMq1?=
 =?us-ascii?Q?PCn8xVTOFJC7FqOTl7iOKRKNRX+uHf6Wl7fawYBtVrk3RD/HxOCWGHP8e0rx?=
 =?us-ascii?Q?re1iMr4dg/wmqyxmagkzFRM2KHwId6kIXTPD1pvqaIdQ4ylG12UC6ULX8l6f?=
 =?us-ascii?Q?9XcEnodlR9+cy4clpAfagOTVXxTjG+IKST7A487Ynph5Y4m/eN5ZzSOUk3rk?=
 =?us-ascii?Q?eovDW7vsvPswE4fBf270ZANyCpOcWQLOFZDEB0KJYmWGzlRy7G7NlieSnwUL?=
 =?us-ascii?Q?tIxiWNjBBIci1ai/1M4r1CHShbCfpKQrJ6LZ0jaUF8JXe2V30XJe3LIf+b0c?=
 =?us-ascii?Q?YtyseoZGwmaDivEkWmTtXYyaEW/4Ywx5Cwy8HllEYXRTdTQwTmHnssbkF0/5?=
 =?us-ascii?Q?MbvedRzpLZPmw6f0M48Oj2vZbMbbwTIdQbk7pTiJcX5s8UtGDpQr2GMkgyMN?=
 =?us-ascii?Q?J63J/lJYTCctsFSNdJSJzKfP4CfFl+4yKDzBTrmCXTAFKgSfPZKIRLohw6cy?=
 =?us-ascii?Q?iwhlL6jvYwjf8juNvbkkTvRNZ8x3VKERrhZsa0NG2oJQZfcRXeLYlwlUdvJy?=
 =?us-ascii?Q?866Zo3dqTqCQYHMSWMT9qyj0MBwONdJbqxH5i5U1+Lu6C0NstnzilHYE9He+?=
 =?us-ascii?Q?NCctR3FB5paZ2ie3zl35ujPQsT23YVt9xL/CKZRk0GJkpYZpMnkRjWvwyg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(36860700013)(35042699022)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 16:48:50.2888
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 651021a2-cc3a-43d4-b9f8-08dd7918bc5f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7603

Hi all,

This patch series adds support for 64-bit and poll register accessors in
the Panthor DRM driver and performs a cleanup of the 64-bit register
definitions.

The first patch introduces new accessor functions to simplify and
standardize 64-bit and polling register operations. The second patch
refactors the existing 64-bit register definitions for improved clarity
and consistency.

v3:
- Picked up Rb tags from Boris.
- Link to v2: https://lore.kernel.org/dri-devel/20250411151140.1815435-1-karunika.choo@arm.com/
v2:
- Updated padding of the poll functions as requested
- Removed *_HI register definitions and renamed *_LO registers
- Link to v1: https://lore.kernel.org/dri-devel/20250410163546.919749-1-karunika.choo@arm.com/

Kind regards,
Karunika Choo

Karunika Choo (2):
  drm/panthor: Add 64-bit and poll register accessors
  drm/panthor: Clean up 64-bit register definitions

 drivers/gpu/drm/panthor/panthor_device.h |  71 ++++++++++++
 drivers/gpu/drm/panthor/panthor_fw.c     |   9 +-
 drivers/gpu/drm/panthor/panthor_gpu.c    | 142 ++++++-----------------
 drivers/gpu/drm/panthor/panthor_gpu.h    |  10 +-
 drivers/gpu/drm/panthor/panthor_mmu.c    |  34 ++----
 drivers/gpu/drm/panthor/panthor_regs.h   | 100 ++++++----------
 6 files changed, 162 insertions(+), 204 deletions(-)

-- 
2.47.1

