Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012050.outbound.protection.outlook.com [52.101.71.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3BB27A12B;
	Wed, 11 Jun 2025 12:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.50
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749644440; cv=fail; b=l6b2rJ/2rlgwCjYXm+IPV4w/mpG/OgBBq/OYQ/O9LiU9NaPnQhmfAeJ50UZsO7HfjwwKmlssYP5DNI1fvNtWcB6OGpwjURoHC/WA/byNIB9vPDzRMq2Sl/SzwouWzqt6/2khYjFFZ9i8rDT5a55fbycM07zbE83ov/Dm1N1lTK4=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749644440; c=relaxed/simple;
	bh=auQlhdUSN3R5JnTLj+sOT/1bGMVou8ACRb6hHRpGbHc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sz+5lZCEiFQ+z0UP3rL1ltAIRVwGjssWDNfjoiliK6uMdTLO2AItD2/0NadlJLQCuUKRs2zv5XgLTQTyiR7vG2/gBzeSYnWuX1+D+q5yzE23u5D5s5lSbcMWh1IcuYxWAyNQrouv/4UJTuhEt67yCCheMJQtGDqv9WpOXE2Rqk0=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=aIHUmUty; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=aIHUmUty; arc=fail smtp.client-ip=52.101.71.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="aIHUmUty";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="aIHUmUty"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=RTyH+l1VOHZKg8OG1ALPZC1O4W89VS3SzSVa5p3CFzQh6NFhfQSLO2QVPC4aLDIklda/Icz8F44zBHYoKfDhnqlyQcW9SUi9UWpOKPYhVK2sxBcUODqkoVUiG/VvK4NPoPuXMh2FQ2EPjWrwQuRo8Iea5Mq1Jkv2zRwiv+hkNkXIzdsZ1BgENt/dPN6/L3nIHZXt+IvHlJrhciM979ZcUN4BTWVn6/PpXgS4yGmtqvXxHVtORnqwaszbD/jozwfAGPCrN/QndceKJ/NXQter1m5IA7bHj2KD3PFsgV3Ygd4T5f5VheEo+aREWc0t4I8QAK1nWRyiOSDaLqWgMkM/Aw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=auQlhdUSN3R5JnTLj+sOT/1bGMVou8ACRb6hHRpGbHc=;
 b=Ua5do53o04WGYMY2xsT53ZzftO/qC6jVu03Zq8R+kin8fRZ5F+rUb5W5O5x/9KUcd5gDA998Bovq6ioBqiXtpRtIfgY+bB3cMA4Xm38o4Vh6Az3y28hel8fkgqi83tW/4fCtHGFGPgluSPz3xaUScZQUSte5SGy3vYldcHs2Vb15/vnugm+2485WmDUTiZQ1Tm51jfhONsefYOB/G+2vtQWu1rpnEMMLIcZY5iT2/u1JR9l3asZ0QYSRQLPGyGJUgGkHcLfqRyiDcvtgKpYEaXuvNfONb1W2fzdEFwan79FpJq1BVUOozke8G7yKRQfuUGJHGPlEPNf2kBK9smvWZA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=auQlhdUSN3R5JnTLj+sOT/1bGMVou8ACRb6hHRpGbHc=;
 b=aIHUmUtyD8H0/gr/Sjo1iZczaRyCfjCD/8TIv6cCTGXomJM2d2lbBc+7T+ArPR6JR68/7ZgQtuyP70+rQotN5uull/6vDtRL+TpXLSVjoyEDlGJ4GhkSSe4EheAz2xPKQ+s/KbHQBi6MorKTiceybSaDcBJrZLa0TwFwD7s+NhU=
Received: from DB8P191CA0015.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::25)
 by DB9PR08MB7891.eurprd08.prod.outlook.com (2603:10a6:10:39e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Wed, 11 Jun
 2025 12:20:31 +0000
Received: from DU2PEPF00028D12.eurprd03.prod.outlook.com
 (2603:10a6:10:130:cafe::2a) by DB8P191CA0015.outlook.office365.com
 (2603:10a6:10:130::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29 via Frontend Transport; Wed,
 11 Jun 2025 12:20:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D12.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Wed, 11 Jun 2025 12:20:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l3D3scvi9t5DbgOQMCW7Uxsp2K92h8ICcxvHx3mD+bhPg28qnplIpP0NqZg3wbN4Jw/Qww3+2VAUWvX6tuCsFKM39Ode9jg3tO5PuLxr+wLnj8Z3byJUS8g6BJMpODR8Aa0JsOWekvGxB1BTVHuKCO3QNS4jQiLhiQTpJbeClDmiDjEZywMQcnO4wPWjPu11eYbNA1NugjqBZjOjIznyw6fufW8eBGh/NI5RPtUwthe7heMfLQTf8VbA+bNolhQJ9brvqAhPCHUSF1EhUZCmaQAONGYi6c5mftrzrO/55EAh2ghs4evkuvDmEA/nCpMggdKJZzECUdEdVQehj4y4dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=auQlhdUSN3R5JnTLj+sOT/1bGMVou8ACRb6hHRpGbHc=;
 b=I9kzSs/gq9AK30mmn7rS0MjPrY1O7sa8L7MiNvbVEAEUcRsUxYiwyZjTJLTBHK1gmG/7nH/qwVHUOpxfQPmr6PBRlF6rW+A04NGzQYFiUUmqVSUq2inDL14BcqdXB2lmRPpZ44KNf0Nm99PkwnW1paJb/nef40mhotUd7t0i5w8nazTkp4zszzmIAvxQktle3bg0B1nrO8JngRrD9xtgtIVMx2LZurDUcGR3w2I5ZDGAHQNxwmpiZKNouPuzq6L3yHyCJJsRqUfuij5LZFOIxFsotCz53bbmVlbs2goKKQJmMuAmIp5UlngZQl98LtYf6lmiWaDC+GWH/sZ6fd862g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=auQlhdUSN3R5JnTLj+sOT/1bGMVou8ACRb6hHRpGbHc=;
 b=aIHUmUtyD8H0/gr/Sjo1iZczaRyCfjCD/8TIv6cCTGXomJM2d2lbBc+7T+ArPR6JR68/7ZgQtuyP70+rQotN5uull/6vDtRL+TpXLSVjoyEDlGJ4GhkSSe4EheAz2xPKQ+s/KbHQBi6MorKTiceybSaDcBJrZLa0TwFwD7s+NhU=
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by PAWPR08MB11065.eurprd08.prod.outlook.com
 (2603:10a6:102:468::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Wed, 11 Jun
 2025 12:19:57 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 12:19:57 +0000
From: Yeo Reum Yun <YeoReum.Yun@arm.com>
To: Mark Brown <broonie@kernel.org>
CC: Catalin Marinas <Catalin.Marinas@arm.com>, "pcc@google.com"
	<pcc@google.com>, "will@kernel.org" <will@kernel.org>, Anshuman Khandual
	<Anshuman.Khandual@arm.com>, Joey Gouly <Joey.Gouly@arm.com>, Yury Khrustalev
	<Yury.Khrustalev@arm.com>, "maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "frederic@kernel.org"
	<frederic@kernel.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "surenb@google.com" <surenb@google.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
Subject: Re: [PATCH v6 2/9] arm64: report address tag when FEAT_MTE_TAGGED_FAR
 is supported
Thread-Topic: [PATCH v6 2/9] arm64: report address tag when
 FEAT_MTE_TAGGED_FAR is supported
Thread-Index: AQHb2rT8xD7AZ+OIxEKWYvnbWvqqP7P91qIAgAAJRrw=
Date: Wed, 11 Jun 2025 12:19:57 +0000
Message-ID:
 <GV1PR08MB105213A44E40741700202F7CFFB75A@GV1PR08MB10521.eurprd08.prod.outlook.com>
References: <20250611094107.928457-1-yeoreum.yun@arm.com>
 <20250611094107.928457-3-yeoreum.yun@arm.com>
 <c0b4dc8a-b37c-4e8e-be2e-bc8906615702@sirena.org.uk>
In-Reply-To: <c0b4dc8a-b37c-4e8e-be2e-bc8906615702@sirena.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	GV1PR08MB10521:EE_|PAWPR08MB11065:EE_|DU2PEPF00028D12:EE_|DB9PR08MB7891:EE_
X-MS-Office365-Filtering-Correlation-Id: 817462d1-5958-4bcd-1c31-08dda8e25bcb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|376014|1800799024|7416014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?BxRGULnwyRG9Dyd9mQJ8ln8AgrxjuVRyeVl151hZj3qFMgx2U73EVtx0Ex?=
 =?iso-8859-1?Q?pU+hc7BpniA1zAzCZ63HZIxxpalcTXoh9ncQC8s4Q1iPvcKZMt5Q+h70fv?=
 =?iso-8859-1?Q?NO8zmCuBV0u5ErajByF7nIXU3P3zxi0hy4Pa5fhEbPJpKFwLENK6SneETt?=
 =?iso-8859-1?Q?UC8H2pN+x99MFyo96oSLdc7J5DyrgRpgOEgUA8AA/Q5LuTxwEqjELNSkVi?=
 =?iso-8859-1?Q?Pvi/0tGhl/+06YfG3FGZ02scKsRMqhAdUEjJQMWzSjd9bhv0M/FJgNS1JI?=
 =?iso-8859-1?Q?R5DcJKseVPEmIP+QyEO4DJXv/90DeE8WlTCjDSsQL/e7g09VPO9BnaEk4m?=
 =?iso-8859-1?Q?8lwXdOfnCV7FqISZPMyXzy5qSfYikJkcNWeLnKFkpEiL/z/LCpFlfIi1lM?=
 =?iso-8859-1?Q?jPSZuH2Y77hwUaYOtHC4gy+YNAvinmniwb7aRxRJRrjnk4f1YYGmkZWP13?=
 =?iso-8859-1?Q?lGnEfe+6ze5w6SIOU9uy44boFZ0Se3KJXViTrTZwQGFiyajkyJoZcQjUOx?=
 =?iso-8859-1?Q?56iNvt+lpewmQ4EhTwWGiUBIWvUroaIAg0Z4SROqIFmV0jmfDcOCMDtr8e?=
 =?iso-8859-1?Q?zqw2mptg7c/Adtb0o8CvfLJBBMpQhQ6K4s86BQokqpmpyHeFRfgz7o0glL?=
 =?iso-8859-1?Q?T3JiHZqjKlFS260S3PQKuz9HHSnf4L/+QrHb7Cr0FokVPrSBgVn/JHvoVi?=
 =?iso-8859-1?Q?NSi5qZghKAusHtHQgAnlcq2tDI7lbWGRkFOSLBNaK3AH9vqhFmao7NCjuQ?=
 =?iso-8859-1?Q?0FJBN/KaTUfLltEEQOdtAfiAwijED6qr3NQPhgwORQuqPaJYdf+yahXJr6?=
 =?iso-8859-1?Q?un4c00ywLyaS62rQVp9LNvcJTWkll+0vbpBn/0shelJ+Rzsk3VA2dIDLcE?=
 =?iso-8859-1?Q?QXPbfMkUuttvdRo6HUh23ySzvtPGiq/T/s4iSONtNEja8/SoaphTNaO7wq?=
 =?iso-8859-1?Q?MQOQd/JrN4Lf15nA3c24SUMP3L3HouSq+5SEmuy87WKX5f364+udY+KH7D?=
 =?iso-8859-1?Q?hKPV1GVfopQnPl7pVbv8oneWnkfDi9ec4nZKUwy39BXFEuH7Eeihk97dxd?=
 =?iso-8859-1?Q?eZbypB39yyQn7FP4gOirtBbXwY8ducUjponWqi3Z/pwYGD34Mag+b7W2Sd?=
 =?iso-8859-1?Q?BGAj3qHkvhjRJiy+dQAfBH3G/nRmJYHOPpuwn12WUk2L15/u5qOUYiymNh?=
 =?iso-8859-1?Q?UINpK9fbl6+vAW9Z+TrUFUIUOUJ84uJXgqfe14TGwSmkwhgqI/7w0Iq57s?=
 =?iso-8859-1?Q?XAZ7mHx0bXYIFvtcbFYkIVK5L+9vuQHcuRqKlo0/nAs9hCnqdXErsqQEYC?=
 =?iso-8859-1?Q?xmKXgbz9WcwlaGvhNKwpcvfWXc5OrRk4q5UQvGvDkWnumyocQxylqcOhpU?=
 =?iso-8859-1?Q?Hh+NpqidJiXsaHdB+OdWAwabbJ754KfjnA7UyhtMHOH65jbq+p0g7Y4T3X?=
 =?iso-8859-1?Q?kEZ9zQXA18UzBLua0o/lVjxaPTodFpUXGWlQtDkcv3I0O/NXlOrcECdqQX?=
 =?iso-8859-1?Q?5+yxm214Pi1+j7c83lTzX7sDm75P5V6HoGGqn67kX1oQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11065
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D12.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5b087dea-8839-4c28-c999-08dda8e24770
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|36860700013|376014|7416014|1800799024|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?bJWqJVCfL6e5Rwq3RTdNkWlalvdcL8gRK2UU92koo5v4tX1jauZSPvgk4c?=
 =?iso-8859-1?Q?gxG3qzvx33crbGWdpr+4QxBpNNsWI6SWY7M9giHkiES/jqfjpPQGGgW5Qm?=
 =?iso-8859-1?Q?xCneYYxDLRDxu2HeOcJ9M1U82Js24BxOdytxusx2Lc6jzXXn8QwpOE3/CP?=
 =?iso-8859-1?Q?HD86RtKoko50cbA74Ib1JBKcow0ul64XOX2zg3Ha8TKxfuHVUeYSiYJsAx?=
 =?iso-8859-1?Q?d50dYz5GJV11WAwtlxDMGmJvsAJCNipwfgrtQT6gA6sDwRrVzcICc3I42n?=
 =?iso-8859-1?Q?Vtjg7MzPQCrUfMvdPxNvY6aHqvYV0Trvm9NRR54NbLA/KBgdcnrp1+2IJw?=
 =?iso-8859-1?Q?1DT3oLLX3iFqgI9IIz3w6fBvSVr76vOEuzf1JMVoCyvkBQoL0z605ZH26Y?=
 =?iso-8859-1?Q?Te61180Ma6NR0kmodZjOgvE8KQJNconssfuvatzfVsBbu8Y8gzVUN6QOAe?=
 =?iso-8859-1?Q?Uw6+Sbeue3LwQ1v1BInsXqfmpGqSA/R5v9pUvB20Znjk3bF556oIm+/35X?=
 =?iso-8859-1?Q?cBNO9TscfyVuxdByxNaFrDNiF3WSBT3nCmMOE+5vxAnqi07VBZPjgBuGDs?=
 =?iso-8859-1?Q?N2vY52MCxop3JV0jcKl4U/NXorQDWs/pzjTNJSq0d189p2VRYfH4WBpWmR?=
 =?iso-8859-1?Q?vEKO5Isk647t9fDKXCX+AthiEJ1Drzv/D2hT7+aIJUw8n4kB0CqwO+4NSr?=
 =?iso-8859-1?Q?b7auXw6gnj8Hn4hDreQF5KT2/NM8+qgRgueVDmT47CgguV0o+qsuK9WSay?=
 =?iso-8859-1?Q?mHLlNOhKffi1sGY/KeIUZTq4WqjR1ACCSzTrgD72f4Oebk362EO5O569fl?=
 =?iso-8859-1?Q?IIgAP0imwI69VaYTD1V3KC91FG/lV4WxPP9NBKwkTWoroOkA5IK86q9WcZ?=
 =?iso-8859-1?Q?f/Vw44arvDgUJIe6gVi9veF0gbHsfxhy9O9lQEEN27lCwjRo5Bv0q+6HpH?=
 =?iso-8859-1?Q?RXEbBpqBm6jndjM38t/Ri3WOmJScUIZ27vrbuRu8alJix/DELWljYStEhw?=
 =?iso-8859-1?Q?w5lird3mcqGSNAXt2+X2cJc1hVsNlN0DKOrj421lsQz45vIfPAyyke2PS6?=
 =?iso-8859-1?Q?9126K/cuqzBd0GSRkMLMowT1mNFYMJywXyv2e6L5I90em+9n4PaEDkOwVJ?=
 =?iso-8859-1?Q?+T0GDXu7XPXXfI8Uf8lubqdDoLsoceD1Bc71OT7A2mnBrypep4rhscNGBa?=
 =?iso-8859-1?Q?BWkw/uPZUKM41QVZhIdOmJtuEPetlunV1qT9rbfLn83KjL+JtWNwQdMMON?=
 =?iso-8859-1?Q?6diqGw4ySGl/H2toE6LBo6SGLVDEtCqqCcGvysRgQdQlh6BRorWmQU5hDi?=
 =?iso-8859-1?Q?SNSHyYD5pXCiicXowzuhZItMFpoQdEuaEIbAObn7mLxsttXsNgIIcqouHl?=
 =?iso-8859-1?Q?NOx9qRLU1B1yoxeFkJp8ruXP5HBo2JxzGluq8WQYqDm7sy+RYOwyKdOuuN?=
 =?iso-8859-1?Q?GXQgVXJcmOUTZAQX+G/2Yq8ZORKFNmtHELn50mfRB3S3xdKeH59JUwdu8j?=
 =?iso-8859-1?Q?QeBalFlduGOp2Pt4q5NB6rVIvUXG+OqE1g9IuoUcfKtHN67Ku7d2x4eksq?=
 =?iso-8859-1?Q?FJzSsJ9vaZZgaY0n1NsG6NKIbF6W?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(36860700013)(376014)(7416014)(1800799024)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 12:20:31.1531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 817462d1-5958-4bcd-1c31-08dda8e25bcb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D12.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7891

Hi Mark,=0A=
=0A=
> > +HWCAP3_MTE_FAR=0A=
>=0A=
> > +=A0=A0=A0 Functionality implied by ID_AA64PFR2_EL1.MTEFAR =3D=3D 0b000=
1.=0A=
> > +Applications should interpret the values of these bits based on=0A=
> > +the support for the 'mte_far' hwcap. If the support is not present,=0A=
> > +the values of these bits should be considered as undefined otherwise v=
alid.=0A=
>=0A=
> The constant is HWCAP3_MTE_FAR and the cpuinfo is mtefar:=0A=
>=0A=
> +=A0=A0=A0=A0 [KERNEL_HWCAP_MTE_FAR]=A0=A0=A0=A0=A0=A0=A0=A0=A0 =3D "mtef=
ar",=0A=
>=0A=
> The reference to the hwcap should probably be one of these, I'd go for=0A=
> HWCAP3_MTE_FAR since it says hwcap.=0A=
=0A=
Just for confirmation. so change to "mtefar" -> "mte_far"=0A=
Am I missing?=0A=
=0A=
=0A=
--=A0=A0=0A=
Sincerely,=0A=
Yeoreum Yun=0A=
=0A=
=0A=
=0A=
=0A=
________________________________________=0A=
From:=A0Mark Brown=0A=
Sent:=A0Wednesday, June 11, 2025 12:43=0A=
To:=A0Yeo Reum Yun=0A=
Cc:=A0Catalin Marinas; pcc@google.com; will@kernel.org; Anshuman Khandual; =
Joey Gouly; Yury Khrustalev; maz@kernel.org; oliver.upton@linux.dev; freder=
ic@kernel.org; akpm@linux-foundation.org; surenb@google.com; linux-arm-kern=
el@lists.infradead.org; linux-kernel@vger.kernel.org; linux-doc@vger.kernel=
.org=0A=
Subject:=A0Re: [PATCH v6 2/9] arm64: report address tag when FEAT_MTE_TAGGE=
D_FAR is supported=0A=
=0A=
=0A=
On Wed, Jun 11, 2025 at 10:41:00AM +0100, Yeoreum Yun wrote:=0A=
=0A=
=0A=
=0A=
> +HWCAP3_MTE_FAR=0A=
=0A=
> +=A0=A0=A0 Functionality implied by ID_AA64PFR2_EL1.MTEFAR =3D=3D 0b0001.=
=0A=
=0A=
=0A=
=0A=
> +Applications should interpret the values of these bits based on=0A=
=0A=
> +the support for the 'mte_far' hwcap. If the support is not present,=0A=
=0A=
> +the values of these bits should be considered as undefined otherwise val=
id.=0A=
=0A=
=0A=
=0A=
The constant is HWCAP3_MTE_FAR and the cpuinfo is mtefar:=0A=
=0A=
=0A=
=0A=
> +=A0=A0=A0=A0 [KERNEL_HWCAP_MTE_FAR]=A0=A0=A0=A0=A0=A0=A0=A0=A0 =3D "mtef=
ar",=0A=
=0A=
=0A=
=0A=
The reference to the hwcap should probably be one of these, I'd go for=0A=
=0A=
HWCAP3_MTE_FAR since it says hwcap.=0A=
=0A=
> >=A0=A0=A0=A0=A0=A0=A0 /*=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 * The architecture specifies that bits 63:60 of=
 FAR_EL1 are UNKNOWN=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 * for tag check faults. Set them to correspondi=
ng bits in the untagged=0A=
> > -=A0=A0=A0=A0=A0 * address.=0A=
> > +=A0=A0=A0=A0=A0 * address if ARM64_MTE_FAR isn't supported.=0A=
> > +=A0=A0=A0=A0=A0 * Otherwise, bits 63:60 of FAR_EL1 are KNOWN.=0A=
> >=0A=
> > Should this say UNKNOWN?=0A=
=0A=
I think KNOWN is corret since this is Otherwise case (when MET_FAR is suppo=
rted).=0A=
=0A=
Thanks.=
