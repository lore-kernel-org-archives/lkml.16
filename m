Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011025.outbound.protection.outlook.com [40.107.130.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6967E29344F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.25
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750152085; cv=fail; b=aRrpGTxUMOEs4LxNiJ8Opu8bjk2omGjzQSFvPAk2xRxTRe149DHxP5XqWbI4qz7vTb6P3XTbFhaHonhHdigZXTvUxpP9wz134uYjqE7Zp7oKIcBLazAstzDfb9lVkBqehCx0gmm7LiuM/FRmK54RwMtFBT2pv5rje/1ruDW29no=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750152085; c=relaxed/simple;
	bh=66Y2uAb+MYaMsE31HdXEluZMNhw5PTDJNEzJmsPcel0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MFHqUkufgs+CaoE7RwPgDUNhQDVh7Zp3MD5/g/Wd9LN8MkDZPooxw0xzGKaUIgX20oi/X7aDDuF4fkT6SNl/4+mH2kTt9ZUdjESoNY0qFZ3GGrSwq3WW+5M3Do2UZXJOV8zXJalpwXbpUuDJVj3L2H05wP2fg3QNGDr4hqsOpns=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Pvc7skXy; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Pvc7skXy; arc=fail smtp.client-ip=40.107.130.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Pvc7skXy";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Pvc7skXy"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=oJIoe/PS18SDfTuzulRRxSpfxpDk10k6U0hTkTTx8XUzZuItEM5D6tDzALE2KgQsCFao17XPj3rH+l6lalh1QUsO35Eay3/t8GhslZjjys3DbI2PYst1KA+VwBJ3anJyqVTe5SbOPVOjUSVE9RQga6QWD/AAJxX+/QR9EvSuj/0aZbxyquEp4VfJIoJ6p57hA0nkUboe3560xWLiwtp4mTX8kLnjwWb16NUx9lEXIxF8lhMHAaAgUDreHtfWYwwqVpQE1i8oiBtYGnVpcMrK/8/PcLFIRBGSdNUQmBwbnKC//mZekmHRI3LV3n0XrLkBzeATlfY8P7QG7A9VwN5GNQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=66Y2uAb+MYaMsE31HdXEluZMNhw5PTDJNEzJmsPcel0=;
 b=CWwYY9T4J46+rVUi67I+eA3ts/z9IjPsDUeuCsyTRgrOYvL9SV49GRqhESJUx+nx5Hb4qlVu99tZuZ93iwprcKwGf7SbyB9uuis3SRLY5wWXssL55g2cEgCBi8p6lJjM91AD4vNsQpkW/+4wXqsDzv7ZlduihewToN03XTmycJb4suLwJf5Q0Y3cO6/OuaFswUSnDBmnXzk02INI2Gb+Luj5aua5XDQdk5Q4NQfyzzu1JawBuFqnhErwG3v+SgpIQ7FYo/0cJQMXwD5HnJHCXgMDH2NWu5mHsMmzmflBQar4Ck8LrafTao0MgZzP9RFNRpU5p1UaQKRoq+fmhEtaRg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=66Y2uAb+MYaMsE31HdXEluZMNhw5PTDJNEzJmsPcel0=;
 b=Pvc7skXy6PbYq6kpSCFYS5brQko7FxUoujqulJo2nhXEH8y3UQ1DpFcweZ8boy+Bs3JMUjqK95e3Y1WXW8Jg4IJUahk5xdvXQIRjxxlDQDaPsrm5HFHWEJAtU8/9rgZaFcWV0eJkshwewj37v607tocC1KR0HnX2tkVbDdeJzFM=
Received: from DU7P195CA0006.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::29)
 by AM9PR08MB6131.eurprd08.prod.outlook.com (2603:10a6:20b:2de::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Tue, 17 Jun
 2025 09:21:18 +0000
Received: from DB5PEPF00014B94.eurprd02.prod.outlook.com
 (2603:10a6:10:54d:cafe::9e) by DU7P195CA0006.outlook.office365.com
 (2603:10a6:10:54d::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.25 via Frontend Transport; Tue,
 17 Jun 2025 09:21:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B94.mail.protection.outlook.com (10.167.8.232) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Tue, 17 Jun 2025 09:21:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hm3ArZvZkqBsCIePY4J/7Lh57PUFZZr/TpvmL+jA7zK928zJG/+uKVQtUzDJEwKDfG96q67T/oH7tc8oG5pjoktB4YXKicnD9woPpVm7hT5ATq4i6TmNKayc2w9FCWkzP3uO+YrkXshfNlBZMxXzbJeq/ESIDK+Lzfp3m6iMr0kWfQWLJNIC5tS2I7Q8HGU3bp+E5wTFOAp5xH/4GG/8nwTasgvh2xVDV88p9whJXfaACe78NWGquxlXa75g1oHvanu90+ax+uBn0Hx94T2eNTyHsWR+J/M4urTTue/1vn6BLhnfa69PH4naJKN9FaznVg8Y/Ktq64UqVYzbCt/OcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=66Y2uAb+MYaMsE31HdXEluZMNhw5PTDJNEzJmsPcel0=;
 b=DqtNiz0qw41osXDALnaudO3MrqimANc3NgN30Ek4tnL4uhBgAGxaBiUvHmU8JR42ZFoAg15k7vdFvGjuf2eO87FftBAq88gp5/ue/OpFwvd/EM/3ftgzr3DAbWCOkfTvp5W5ZB9STT0nWyDf/uyfHr+FvbVZukRIgaDS9FLAacS35+yTyqj9Wzuzht/QDOTqpU2qpJjMyajjDOMsdNaJvz+9/YtuVFMKYXobNb0+ZU38Sed0XSzkfzC6hkjL+p+knFFQFutVhsLW7ccQlGWdeeo5XsNt5/PYSf3L96TSqdZU+7pFESbM9bFNJwMq8HF2ELz9bqYjQ/zJICZAXNgA/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=66Y2uAb+MYaMsE31HdXEluZMNhw5PTDJNEzJmsPcel0=;
 b=Pvc7skXy6PbYq6kpSCFYS5brQko7FxUoujqulJo2nhXEH8y3UQ1DpFcweZ8boy+Bs3JMUjqK95e3Y1WXW8Jg4IJUahk5xdvXQIRjxxlDQDaPsrm5HFHWEJAtU8/9rgZaFcWV0eJkshwewj37v607tocC1KR0HnX2tkVbDdeJzFM=
Received: from AS8PR08MB6806.eurprd08.prod.outlook.com (2603:10a6:20b:39b::12)
 by DU5PR08MB10753.eurprd08.prod.outlook.com (2603:10a6:10:518::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 09:20:46 +0000
Received: from AS8PR08MB6806.eurprd08.prod.outlook.com
 ([fe80::3935:6d9d:93a2:cbf3]) by AS8PR08MB6806.eurprd08.prod.outlook.com
 ([fe80::3935:6d9d:93a2:cbf3%4]) with mapi id 15.20.8835.025; Tue, 17 Jun 2025
 09:20:45 +0000
From: Sami Mujawar <Sami.Mujawar@arm.com>
To: Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
CC: "will@kernel.org" <will@kernel.org>, Catalin Marinas
	<Catalin.Marinas@arm.com>, "aneesh.kumar@kernel.org"
	<aneesh.kumar@kernel.org>, Steven Price <Steven.Price@arm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sudeep Holla
	<Sudeep.Holla@arm.com>
Subject: Re: [PATCH 0/3] arm64: realm: Add support for encrypted data from
 firmware
Thread-Topic: [PATCH 0/3] arm64: realm: Add support for encrypted data from
 firmware
Thread-Index: AQHb3FQI1j4mENvDaE+ZseD7+GP2hrQFp0uAgAGDBYA=
Date: Tue, 17 Jun 2025 09:20:45 +0000
Message-ID: <3827D79E-867A-4B3C-99F7-E5B459D04AEE@arm.com>
References: <20250613111153.1548928-1-suzuki.poulose@arm.com>
 <55346820-fbca-4b23-824e-89483601bf61@arm.com>
In-Reply-To: <55346820-fbca-4b23-824e-89483601bf61@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Microsoft-MacOutlook/16.97.25052611
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB6806:EE_|DU5PR08MB10753:EE_|DB5PEPF00014B94:EE_|AM9PR08MB6131:EE_
X-MS-Office365-Filtering-Correlation-Id: c842d0bd-4a6b-428c-8f42-08ddad8050ea
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?MTllQlRWRDY2bENnRDNiVXNoRmd5UWlmVXV4SncvYytDd0dKR2tyS1E0UUs2?=
 =?utf-8?B?cTNoeFRaa0hyeVdyYU5uS1phOW5rT080N0xld0F2b21vSTlqZFNsTTJGOFJh?=
 =?utf-8?B?eGVic1B2QzZWTks3R0RSTlJGVk8vb2lQWmdpVG1Xd01KSXoxdTZaVDRZcjdT?=
 =?utf-8?B?cWlhK1RXSE85ck01aDBSVlNrU25CdXcrNDg1REFqb3psQWN5dCtYRHl3Z2tp?=
 =?utf-8?B?UWFHdE9vZFhXY2cyOFZISHNzNldDL1JLckF6WnFseWg5aGlKZ01xMmI0bkNp?=
 =?utf-8?B?RjNPSGcwakRCNGhwZWNzTEpSUGUyM2FXcm03LzNpbWJCOG53WGJaRUQwcGFr?=
 =?utf-8?B?ME9sZWFZbXFCVmdtUjE4NVVPdEd6c2wwVWIwUU5iSHJRZW5Wcnh6Ly96VHE2?=
 =?utf-8?B?aUJqOTU5dXRNNGxNcDNHUk5aU1h4K3VyYmxlcWpVMTlXTGNwMzhnTFF1bGlr?=
 =?utf-8?B?V25QSHlBcDIxeFhmOFExc2FlazFHVGt6SUM1eVg5ZXhtci9CSUxQUFJId2Vo?=
 =?utf-8?B?eENrZzdjYTB3TVhjWmVhVHY4L0lOYWptL1hpMUNMTnZsSnBQNEdFVDVWTEFH?=
 =?utf-8?B?OUtDQW5qYy92anhIU2p2RFVNaUJ1MlMxWUtsaEJjS2x5M2xCb01zV3dqOVd0?=
 =?utf-8?B?TUZOdjNIQWVrV0F2S3N2Y3pVcHp5SzFJR3VmZlRCZ2wyWmY2UFlBWDBsVHlY?=
 =?utf-8?B?L09UN1M3SXVvNUFKc0o1ZUFwU3p0NUJXL3hGU0ZyVlZXMEZKZk4rZ1drbUFB?=
 =?utf-8?B?Yy9ML1NFYkdzY3dpRTV1SFpRNDdCbFZLdElVeXQrRkxQdk5FSEpZYjN4OXpl?=
 =?utf-8?B?MnNuMElNL1dEQU9jbnIvZis4emw0cFQzVzFGM0phOXVrU1I1R29HVFpSWHNZ?=
 =?utf-8?B?cXI4VnZQWDJUZG1kYTJ3dGJXL3BzNENGNWs3WUY0L0d2czVRa0cyRUpkY0JJ?=
 =?utf-8?B?clZXdjg4cnlBdDZzRitwUTZuYk55QTEzN3NFQ2tGblFHV0kwYWZ0dGYrU3hB?=
 =?utf-8?B?ek5iYTFlY3Jnc2J2cGlwSWNIRGppN1c2OHBJbnA1UXRDb283Zk44dUNoY0hx?=
 =?utf-8?B?WGRUQWc1VS9kcEVOd2JadmJHYXpmd2xDa1c2RENFOGxMdXZSeURxcTZFeXFK?=
 =?utf-8?B?cWdINmg5c3V4dmZpenNJNzBZQnNjVVFtSHArUVZ1TzJpZFB2U0VTK0phcnJr?=
 =?utf-8?B?SDhlMEdqQXBlMWNWbFdMejMrZVB0K2FVNzFtRzJLWllxbVM4NG1wc1gzTWdR?=
 =?utf-8?B?R2NROWF0akYzc1kwQnY0ZDZVZG52eE1GOURLY2R3SXlRODd5TDFBVkcvZUFK?=
 =?utf-8?B?ZS9qbTBMZGF4aUhZcWNNeTRRS2p5ZThiSkhERVUyclpldHNMMTJsdjNOTUJm?=
 =?utf-8?B?b0tJbG9TcGZKeFRKMzdaeThpNklMQmp0eFBxUDQ2UXNVOTErc25oTVpzUEJm?=
 =?utf-8?B?Zm1TZ3g5Vm1LbDNtTlIwcEJVS3V3bWJHTDdKbFVjWmRyemxDV09qalFGNU0r?=
 =?utf-8?B?d1IvNXBJZS93UzYyU3FKNytrblF4TUh4MU5FRjRPVjkrSXZldW40SFdEejhL?=
 =?utf-8?B?bUNoQUtuOFBCeWJsSUZjWGMzQWpTV0V3VGp6dDhrMUlQWERhRHVEZGJ0WjEw?=
 =?utf-8?B?TGJROU40d0dNRkUrV0hjZkl0bXlZZ0t4TitaWGc1WDIxTUZvOG5WTjI0THRT?=
 =?utf-8?B?VTZ1R1ovMzQxUmZWTk10dHVSdUpiWGM4b0FpQkpFVUsyczZ1em9ESXRHZXp5?=
 =?utf-8?B?aDB1aFdUc25oL09qUjc0K0w4RGlVeGNFUWVRTGFmMFhJNXZYNWFMdGpBTEdn?=
 =?utf-8?B?WG5Ea1FINzF6bmQwTmM3RjVQejRVeEViQmN2WlpkcW5wdjRxOFZQcFBkQ1Bk?=
 =?utf-8?B?ekZBWDF0bEFMNm5oZmhhRlQ5c1h4SDJUQ01LZFFTbXc3OXhOOTlQa2NMVUFK?=
 =?utf-8?B?ZFFibnd5RW4wVE53cDlEc1pndXlxKzFUZUFSK2U5NytEUnkxNUVsV3psSWRZ?=
 =?utf-8?Q?Xo4BLu6JOa4MbwWlhhgQsJsR5o4VYY=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6806.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <932F1D7423582E46969F3A62B4B0BE27@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10753
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B94.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0483eeef-41de-4af7-b3c6-08ddad803da9
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|1800799024|35042699022|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d1NDWmpleXJRcytmdnVTN2g2cUM0MlMvcU9wb203ZS9uTEFndnczQlZiTEVE?=
 =?utf-8?B?VnljQmU0Rk9aUG1TRTdYazJpUjU5WFZLdmVUeU9WZTZTelJYQ1lpMk1ocHgv?=
 =?utf-8?B?WTFSZ2lwRXFXeFlSaTY1YmlCV1BjSGI3Mmk2TXRmOTRHSHhTeVd0N2FuUWNT?=
 =?utf-8?B?Q2dGcG83dlkxMVBIa0p1YmJHL3FDVkN4UysyWG0ydnZsWThCYUxUa1ZCWmtC?=
 =?utf-8?B?ZEZSQnIydWMwcDNjblZOR2MvWHUzQUVHMXlPVGJrVXdMWWVsSVVlQUJjKzE4?=
 =?utf-8?B?ckVyZStEeU5nWlFKeklqenF2RmRzZGs2aWNTZW9vZm1IY3orUWpIT3p1R3A5?=
 =?utf-8?B?ZXZCejdqWGREaVV6eHBMVW1Pc2g2V1I0b1pnTjhKU2ZTQWV2RHJFUjFzQmlG?=
 =?utf-8?B?TUpYOTNDMkNET0grWm4wR0RDMlVhd0l2Q2lZNktKUUdPZVZ1dTl3bWc3MXIw?=
 =?utf-8?B?V201dm5XaVRzYUtwbHF6OFpEOVBYVjBQV2V2aHVGUkdTY0l4YUthbll1SFls?=
 =?utf-8?B?QmRaL2NjTFF5cGExWDVwWmd4clNSVSt0YllpSUl6YUdRN1ZEVjdVeVB1czJL?=
 =?utf-8?B?eGVvNGhLUVNUV0ZQQnZ4SCsySWZSL0NGMk1JSlQxNWc4d2FxS1JUcXFMTEF4?=
 =?utf-8?B?cUYxRmt4TDIvNGQvRkFmTnNFMVluVHc0a1NiZ1FCanZSZFUyblhJdjFhQmhD?=
 =?utf-8?B?ak9DaVErM1hQeXd5SU96OUlUNTJYUUhFaWVzKzl0Vjd4ei9RaW5SVE80aE4x?=
 =?utf-8?B?bFNuWkU5d2UrVWQxbGNsdFU1V0ZwdGpmWWdnL21GNW9qR2FVclFGZHpyaTE5?=
 =?utf-8?B?ZTd4bURjU00veEhDNkdoV1RPYXdNTmEzN0FicXJUWDU2Um9WUnEwSGZTUHN3?=
 =?utf-8?B?Tk5ONHFWaVJBRFRuTUZ3TmVGTFNDdmJ2bi9WYTdubkhUMU8vZzJ0UVJ5Rit3?=
 =?utf-8?B?VzJ4ZWpuSlJ0WFVIM0JqRVk0RFBvYm91WjY4MERqOCtlaHgvdGN0WmRjWVhx?=
 =?utf-8?B?eXJ4Z0gyb3YzOGFYRnJYbTZNaXh0K0xqUjhXREJObDlkcis1Qkc4aHhzOE5i?=
 =?utf-8?B?YVRVdG04QW5hTzVzMnlJeVZPckw4TlV2c1hOcFNIVVFtZDFrV1RCZHRnakZz?=
 =?utf-8?B?ZE11ZzdPaFZiWDZNaGhWMUlGL1UvVUNGUUljcnQ0ZFN1N2JKK2RlT0x3dm1o?=
 =?utf-8?B?N3huZlRWNU5ERFoxRzRYU2RVYlV2MnZoY1V0VVB3My80TWE2b1JKaUxXS2hz?=
 =?utf-8?B?QUkza1FYbThac1VKWUgxc3BJUlNYd2psYmJLcE1YR08zTFQwNDY0VzdwWGZI?=
 =?utf-8?B?K0hxWUVGVmdUaDJjdjJkV05MZEhBdlMzOWVwbzlLYzl5TnpwVCtIVzBZeS94?=
 =?utf-8?B?WXZZSmNaN0EwZEZaYy9WTHp1bVpXRWdWYnh1dEt3aENhR1JiSUphbWQ5eHJ3?=
 =?utf-8?B?RVpsbGljNWIwMlNzS2F5WW5QTkpHWXJSbVlFaGJSZW1MQWkrTmdBKy9yY2xz?=
 =?utf-8?B?RGJWeTFCdmFJclovMDJERjBCQzNNVUtjdVZEUjFKMnJFL2VCTkFCc09jOUQz?=
 =?utf-8?B?Z3J4aDJ4Tkt6cXZ4Tkt5bi8rV014dkNlTzAwUTAybktTalhYc2JzUDI0V3FC?=
 =?utf-8?B?U20xdzhRSE1VZkptSllhNlkvVlNtVmxWTVpLZUZkbU5QSytiaG1GTEYzeXFR?=
 =?utf-8?B?dlhHRjBITUFzMkpyRFJZS25iZGNiSGZEWTQ2ZFdRZ0E5RCtITEtPbW1abGRa?=
 =?utf-8?B?T2FMNnlRSktxS2RTZkdPbm5QUzF6ZXhjZWxkRktyN3V4b0puZVVKYUtWZGxu?=
 =?utf-8?B?ZGdtUHlmSWoyenYyejRLLzRuazE4OTVvTXVkNXNZTThPSXNyMzhkSDdwcDZy?=
 =?utf-8?B?YjRtdnl3ZjZnZ1BZNlQzV0RlWElTdVhKSk42ZlJlSlZMZjJsMnpvM0wrZHVQ?=
 =?utf-8?B?dnRnb2srOWoxanRId0lNeHQyd25LL29SV3N4U2RGRDZvODNyUGplSXdBSFdG?=
 =?utf-8?B?WXFWL01ucmNtVXZmZC9odjFGVks1NC9HKyt4Sy9CRk0xVTNQT0FNNjdoRmpm?=
 =?utf-8?Q?Xf0Mp2?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(1800799024)(35042699022)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 09:21:18.0454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c842d0bd-4a6b-428c-8f42-08ddad8050ea
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B94.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6131

Rm9yIHRoaXMgc2VyaWVzLg0KDQpUZXN0ZWQtYnk6IFNhbWkgTXVqYXdhciA8c2FtaS5tdWphd2Fy
QGFybS5jb20+DQoNClRoYW5rcy4NCg0KUmVnYXJkcywNCg0KU2FtaSBNdWphd2FyDQoNCg0K77u/
T24gMTYvMDYvMjAyNSwgMTI6MTUsICJTdXp1a2kgSyBQb3Vsb3NlIiA8c3V6dWtpLnBvdWxvc2VA
YXJtLmNvbSA8bWFpbHRvOnN1enVraS5wb3Vsb3NlQGFybS5jb20+PiB3cm90ZToNCg0KDQpPbiAx
My8wNi8yMDI1IDEyOjExLCBTdXp1a2kgSyBQb3Vsb3NlIHdyb3RlOg0KPiBDb25maWRlbnRpYWwg
Y29tcHV0ZSBmaXJtd2FyZSBtYXkgcHJvdmlkZSBzZWNyZXQgZGF0YSB2aWEgcmVzZXJ2ZWQgbWVt
b3J5IHJlZ2lvbnMNCj4gKGUuZy4sIEFDUEkgQ0NFTCwgRUZJIENvY28gc2VjcmV0IGFyZWEpLiBU
aGVzZSBtdXN0IGJlIGlvcmVtYXAnZWQoKSBhcyBlbmNyeXB0ZWQuDQo+IEFzIG9mIG5vdywgcmVh
bG0gb25seSBtYXBzICJ0cnVzdGVkIGRldmljZXMiIChSSVBBUyA9IFJTSV9SSVBBU19ERVYpIGFz
IGVuY3J5cHRlZC4NCj4gVGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciBtYXBwaW5nIGFyZWFz
IHRoYXQgYXJlIHByb3RlY3RlZA0KPiAoaS5lLiwgUklQQVMgPSBSU0lfUklQQVNfUkFNKSBhcyBl
bmNyeXB0ZWQuIEFsc28sIGV4dHJhcG9sYXRpbmcgdGhhdCwgd2UgY2FuIG1hcA0KPiBhbnl0aGlu
ZyB0aGF0IGlzIG5vdCBSSVBBU19FTVBUWSBhcyBwcm90ZWN0ZWQsIGFzIGl0IGlzIGd1YXJhbnRl
ZWQgdG8gYmUgInByb3RlY3RlZCIuDQo+IA0KPiBXaXRoIHRoaXMgaW4gcGxhY2UsIHdlIGNhbiBu
YXR1cmFsbHkgbWFwIGFueSBmaXJtd2FyZSBwcm92aWRlZCBhcmVhIGJhc2VkIG9uIHRoZQ0KPiBS
SVBBUyB2YWx1ZS4gSWYgdGhlIGZpcm13YXJlIHByb3ZpZGVzIGEgc2hhcmVkIHJlZ2lvbiAobm90
IHRydXN0ZWQpLCBpdCBtdXN0IGhhdmUNCj4gc2V0IHRoZSBSSVBBUyBhY2NvcmRpbmdseSwgYmVm
b3JlIHBsYWNpbmcgdGhlIGRhdGEsIGFzIHRoZSB0cmFuc2l0aW9uIGlzIGFsd2F5cw0KPiBkZXN0
cnVjdGl2ZS4NCj4gDQo+IEFsc28gZW5hYmxlcyB0aGUgRUZJIENvY28gc2VjcmV0IGFyZWEgc3Vw
cG9ydCBhbmQgQ29uZmlkZW50aWFsIENvbXB1dGUgRXZlbnQNCj4gTG9nIChDQ0VMKSBmb3IgYXJt
NjQuDQo+IA0KDQoNCkEgYnJhbmNoIHdpdGggdGhlIHBhdGNoZXMgaXMgYWxzbyBhdmFpbGFibGUg
aGVyZToNCg0KDQpnaXRAZ2l0LmdpdGxhYi5hcm0uY29tIDxtYWlsdG86Z2l0QGdpdC5naXRsYWIu
YXJtLmNvbT46bGludXgtYXJtL2xpbnV4LWNjYS5naXQgY2NhLWd1ZXN0L2NvY28tc2VjcmV0L3Yx
DQoNCg0KDQoNClN1enVraQ0KDQoNCg0KDQo+IA0KPiBTdXp1a2kgSyBQb3Vsb3NlICgzKToNCj4g
YXJtNjQ6IHJlYWxtOiBpb3JlbWFwOiBBbGxvdyBtYXBwaW5nIG1lbW9yeSBhcyBlbmNyeXB0ZWQN
Cj4gYXJtNjQ6IEVuYWJsZSBFRkkgc2VjcmV0IGFyZWEgU2VjdXJpdHlmcyBzdXBwb3J0DQo+IGFy
bTY0OiBhY3BpOiBFbmFibGUgQUNQSSBDQ0VMIHN1cHBvcnQNCj4gDQo+IGFyY2gvYXJtNjQvaW5j
bHVkZS9hc20vaW8uaCB8IDYgKysrKystDQo+IGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vcnNpLmgg
fCAyICstDQo+IGFyY2gvYXJtNjQva2VybmVsL2FjcGkuYyB8IDUgKysrKysNCj4gYXJjaC9hcm02
NC9rZXJuZWwvcnNpLmMgfCAyNiArKysrKysrKysrKysrKysrKysrKysrLS0tLQ0KPiBkcml2ZXJz
L3ZpcnQvY29jby9lZmlfc2VjcmV0L0tjb25maWcgfCAyICstDQo+IDUgZmlsZXMgY2hhbmdlZCwg
MzQgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4gDQoNCg0KDQoNCg0K
