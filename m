Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011006.outbound.protection.outlook.com [52.101.70.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B9327CCEA;
	Wed, 11 Jun 2025 12:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749644791; cv=fail; b=NLYdMhHehvxjiFJDrs0tOGaFQ1+c2G+w2hi50gj7q7s/RhWHvO+3glyLLXCPqf/BvzNEx5oV6Hnoj4F+4QECzWvM855Weh7xnnyvvaq42+urjmFgQCH4oAHqjROnStSYzyKcCFlRFGaKS23VvFyEFd3ZwoKax0kylP0CUo2B9aI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749644791; c=relaxed/simple;
	bh=gTLewjzll7Y/spO5sq87Z5zWWOsOPTW47DGrAjQfa1M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=D1hnx0p4CciWqqHk/PEJW42jRgfovHXc3BOGjCX1DN4bnjCxx8EsIm9ozZ8Qy33VLKfe+/8emssgsiww+6r8CSTNQuwstRd+fR5rmqtL/iuNkIBOQjhiWso5b9sqmpVITKy1Q6R2JK9MJWAaRGmVlHrTUKArwpytkQ7SLRO2k98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=K15bwDpO; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=K15bwDpO; arc=fail smtp.client-ip=52.101.70.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="K15bwDpO";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="K15bwDpO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OIS1e0JrSIfOlq6RI/O+U4zf0G9IqTGIqzgBC5UO/bI=;
 b=K15bwDpOP9VUwl6UDcCp7IhRV7y+PHfpoO9wht31n1MZ/ueSRp28w0EevSRhmtnQDJAn58q7QVZiTXPajNztCua/zZurUK1ALOBuxW2e0FsR/+k/mIrzSK/38hjzfjogeEhauHEEt65Z5NnqOUMZi03MUkj0JT6QAV9DrTjFfgM=
Received: from DUZPR01CA0082.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::10) by AS8PR08MB5896.eurprd08.prod.outlook.com
 (2603:10a6:20b:294::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Wed, 11 Jun
 2025 12:26:24 +0000
Received: from DB1PEPF000509F8.eurprd02.prod.outlook.com
 (2603:10a6:10:46a:cafe::58) by DUZPR01CA0082.outlook.office365.com
 (2603:10a6:10:46a::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Wed,
 11 Jun 2025 12:26:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F8.mail.protection.outlook.com (10.167.242.154) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Wed, 11 Jun 2025 12:26:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XCdySKLBO2N4ycmKfJsujmHLCEFfXksczdOozmaFlWXmELOdT/bYfLLJNzQ+yYMEThYkPdto0K/m+hqEY40S9+uj4tiruia4MPM3NMVEqLgQbvI5GLKUqB/Yh2dTU8W772lhKtbzT3AL0lvt+xN2iKQH0E1TIIlT+lBLCLn1OThUuzm2P0PUApxj8l+ak3FcJ3i0H0QgIY9q1eW1OzCA9Ea7dGoLZJYQPRfKaTC5f4SvLRkgscrC3wme6SLilN3BFKcsuwK9vx1LjRLTOTn3dCPrqzwlCRyaUNPT+zvRkEB8S7dQYjBfgqxVA7s5k7mkvbcy4hI/T+dfkawqUiVWeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OIS1e0JrSIfOlq6RI/O+U4zf0G9IqTGIqzgBC5UO/bI=;
 b=BZtjspIibOSfJxx0WocIyHHvT77antaLxkZ5o8143J8aLwRwzxSFJHUhX/U77b8B5j3RTz+ktjdjSKPOmn0lKf0l8ns5YzUx7bauMrgjl+ciD+8SgUukb9YOVq1ThtFJG/cAJ2Pk2rXFeIzZaHRYggjTqnWTjbFm74Bj50zpw0IW2hOA1k2TXZaLtjy6qkdBjGiGwXQb0yaGnd+LWgY5EvPbNVqxacddRtycsSWfFHHHr7Cp+eSOLAJD7flLtUNUoD1NRKWCYnLpxrfXT389iZxW0Xo9/pbAdzxwoH46I39G4Y6buOSpsqRV3UoNbQPvgM5WqjeNwyxiNoJpypu7YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OIS1e0JrSIfOlq6RI/O+U4zf0G9IqTGIqzgBC5UO/bI=;
 b=K15bwDpOP9VUwl6UDcCp7IhRV7y+PHfpoO9wht31n1MZ/ueSRp28w0EevSRhmtnQDJAn58q7QVZiTXPajNztCua/zZurUK1ALOBuxW2e0FsR/+k/mIrzSK/38hjzfjogeEhauHEEt65Z5NnqOUMZi03MUkj0JT6QAV9DrTjFfgM=
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by PAWPR08MB10120.eurprd08.prod.outlook.com
 (2603:10a6:102:365::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Wed, 11 Jun
 2025 12:25:50 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 12:25:50 +0000
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
Subject: Re: [PATCH v6 6/9] kselftest/arm64/mte: add address tag related macro
 and function
Thread-Topic: [PATCH v6 6/9] kselftest/arm64/mte: add address tag related
 macro and function
Thread-Index: AQHb2rUEKKhxuysAAkajlrJ4QUN14rP92sIAgAAHJJM=
Date: Wed, 11 Jun 2025 12:25:50 +0000
Message-ID:
 <GV1PR08MB10521E68C886E8E6155AEE49EFB75A@GV1PR08MB10521.eurprd08.prod.outlook.com>
References: <20250611094107.928457-1-yeoreum.yun@arm.com>
 <20250611094107.928457-7-yeoreum.yun@arm.com>
 <5e937cf0-3b71-4c17-838e-8b38595c153c@sirena.org.uk>
In-Reply-To: <5e937cf0-3b71-4c17-838e-8b38595c153c@sirena.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	GV1PR08MB10521:EE_|PAWPR08MB10120:EE_|DB1PEPF000509F8:EE_|AS8PR08MB5896:EE_
X-MS-Office365-Filtering-Correlation-Id: 373dba8a-74a6-4f0b-0993-08dda8e32dee
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|1800799024|366016|10070799003|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?eH6BUL81ZSKQrF6qo+6C3bKYR5Qzhkupn+rfmhEy2WIRkqDo9w1lAObDpT?=
 =?iso-8859-1?Q?vyQ9uHbDVQIBSIVRYmZ3DC0MP3Ou6rapr2dnki8wq1MEK48Uhddi/1F0b1?=
 =?iso-8859-1?Q?jjSR2ePLIPMHeQazbfb4RHM0SMvqfKrFCpP2VCOn9p9+bAcKSI0ce+ARke?=
 =?iso-8859-1?Q?KS1HPSkTXJJT1EchSWPoVNCDreNRdCquPqCCHMU9JuTWLUIQgX+lTspstD?=
 =?iso-8859-1?Q?oMbY8h96cmQU7JEzX5qK6lNmM/MjN77OBWuLr/bbhoXXcK77xLU8BqbFP/?=
 =?iso-8859-1?Q?izaNbBuXJUm2HhWjot3Qhseg+vYS8pN6zSUwXOZ8X2/+q8jNf0qq1lC4Tp?=
 =?iso-8859-1?Q?m5kvVQxXk340TF+pcgxiiU2nMHf35PitOeR/jMPQLvfqmFA2LSiTse/YqH?=
 =?iso-8859-1?Q?pHLqH6o/9RAQXqTPL4BlgiY8qKjJI0STn9/d3OY0DletmAJ5XmY5q7SQwH?=
 =?iso-8859-1?Q?dvvGkADDImVoySOuk8gB+lvxvoaMUZDYni/Hl8ulpjXNbELINl1OJl+5/n?=
 =?iso-8859-1?Q?DCPv93tp6ThydiofS9pHklt258eUrEpEvXWWqVrzIn3wMfqHwn0Yj9dg7q?=
 =?iso-8859-1?Q?e9T7qysQOffL2n8gOJUOBLPU6T2mweBxe+rKvuZVS16l2bf3Q/p9GDlHOe?=
 =?iso-8859-1?Q?0n5vGzIz4yzRqPECiWHq8SKVEoOLIslmMOoTeMnq74/Fyz6MzFD6t9RJrj?=
 =?iso-8859-1?Q?PsaTf9m+FsC972z4eMnDwmJzJy0QEPO50J0UYTMWoccnDC45Ue3TpeoldN?=
 =?iso-8859-1?Q?lgQKPmBSGHezOSLWv0678KwCyYlK+Eda0P5VX8CgL+Sn6CSUBgXtpU3nAl?=
 =?iso-8859-1?Q?gaN6GwwbLhwoHabXjpWqGj3hTWkNr1Glyp4FGR/nbM5OPtQOs4doHeMYJs?=
 =?iso-8859-1?Q?z/IPQ6mPi9+ALPChTg7PexwzQdl1DO23UW2+Ykbn7dG0tzaCR+mqAZVHv3?=
 =?iso-8859-1?Q?FVHH108y4jodX11DIEDGs8zfRYv5qX+hg94rG10SA8yBXJ9cCkTgB99wCA?=
 =?iso-8859-1?Q?EzUwVLZ4eG9kuCDObdTZ65muMtaVltSeymRgROh5gBFQtBcq2oPoUePu0m?=
 =?iso-8859-1?Q?yv+oLQR03ezZANeYHf/PKF+vp8rkMbHOKYvBlsqlVL8y0AzH1YLxg8CpuR?=
 =?iso-8859-1?Q?+z9CjW1hhvvc6Asqmvrs2bQ8OrRNAQeroq83e3aTQvQGcqPGyBLLId/Gsv?=
 =?iso-8859-1?Q?2dIVBtRld9WccFHXtO/TFwV++zvsW1+3urORYUjLiKv2he5Qdh1hgQt19a?=
 =?iso-8859-1?Q?Ctm+gAclH6g5aaaZdsOeJkedurZ/tstiZA6tgXSjcCVhPHs1AwD2kz/4pO?=
 =?iso-8859-1?Q?Bhv2lbaF7zH3PO8IZl1l43+hLZtmAthN0M2Rl7dkEW7NIDhVRyp6CUwI1y?=
 =?iso-8859-1?Q?usyRNed+ORurqEl/AKjffXCDWvagQLBmOnIevLGFHGkYRxiIfu0rqDww6h?=
 =?iso-8859-1?Q?IpDbpobHN6deDyfTNh1Wosuqlhh9CiFQqpejQkiaPnPMtGhfOYTNvLeDVL?=
 =?iso-8859-1?Q?2HP0isdsDBC82R5bqo1Lw2qzWaiNbmwTHSk8m/FlUcZQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(10070799003)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10120
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F8.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3386fe78-2c04-4136-f163-08dda8e319d4
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|14060799003|1800799024|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?42FJVj6RxwbBHah21dBotyxV2Ev0f0TIgFk5O+VYaNFNq7ZJKMKxc68dX6?=
 =?iso-8859-1?Q?n9HOogLZIx4KQ279RrixE2PdQczpdzG08eEbcd7G4XzZCuIgLFKUGvkrfM?=
 =?iso-8859-1?Q?jqTkWrzgxCvFDaBT8bWEkkb3k1acER8yaQj7P2wlhilOftoZKwvKgpDO9M?=
 =?iso-8859-1?Q?MOQy50efMbJPsFykseb3kM36yG6CKs1xkrSZuvrQPvbKGg0JjGnpPor/np?=
 =?iso-8859-1?Q?1ety4zMFspHDUEldzfK9o5bGi3dqRh4VTfJgndhCuCf58vvuvgHIUJiJ1B?=
 =?iso-8859-1?Q?xDa06onnyXZV8HZJyrbqJXSi3HUGcm//XT9WVRHNmaBGoXXpCpIpvqIoXF?=
 =?iso-8859-1?Q?0ft+qWfrrIGPgkTGaKii+CQSQyG4w9Am3eicHzTioWLYndfdc68g1SkVR3?=
 =?iso-8859-1?Q?8P3WfquDgbfWNMR4Lbc3YnIWfJCgMrqhHU4r9fO3L2/zwzIkSzCBodbL31?=
 =?iso-8859-1?Q?RifuhHxsDDl6d18f2/RxuX0Oxk9gVJjvI+eC5T4JoZw3ZbRRUWOHr9Nx8U?=
 =?iso-8859-1?Q?7gR0OdUYlEXeLI+zn3JyO6eBL7cgp1/FeUhGqyOfYfzvQvoksHQwo/6Bjj?=
 =?iso-8859-1?Q?SyUw2QinkLYs++6vDhPapcTBrJNNLhQoAZc+/jLjiYQc80fKZ/q7Jv8yzO?=
 =?iso-8859-1?Q?YEkWC+ZyYWwic+Yk6P0Zb+EtDNEvPy+TvShYH+nacdnPXgiYUYnIHfJsCM?=
 =?iso-8859-1?Q?xPkx421WVIneo64K3xq94FB8QGTrzDd1Bx1WhfhmTAsIVeukXMf2YlrPwd?=
 =?iso-8859-1?Q?ib8iP9dJ1nSGbltmOA0XL9R2m3aPqNJ1vTemOIoU82+A3QiyqBIiwy9EdY?=
 =?iso-8859-1?Q?/TRr0PxTJ6rqCNY0rMK5n4zjOr23b5Vi/C6oh33eFopYT6xU3w2xDhnGFt?=
 =?iso-8859-1?Q?RG3LwtBYB5IaDOlMM8HN9JgsYL76rXYh+HWDAEEabe0i80wFQMjhzpNNLj?=
 =?iso-8859-1?Q?J5+INRatH28FPN7/Wo7OAmNE9QUsFHLNxzzW7ZkgOJKFR3e8FGApcBw6zu?=
 =?iso-8859-1?Q?To1+LBLWNmsMviWftlSBTou60BONR30gUaWDH0YHHUeGjT4egV02ZOPZdL?=
 =?iso-8859-1?Q?dVm4oKmvMZdAmQWgl4orAUAuKcCKIpHp6ci7Ej4x5NIE2Vuv7+vUzqtubG?=
 =?iso-8859-1?Q?oOqXNUobgE6Euv91+YbqpuKwXqLmm5+l7SbPoX8mzTjiLcB3N9wcqsgzMr?=
 =?iso-8859-1?Q?BC6EGaLOwd5uOq7SNsfI9dcOS7QOz0gcXknTnDXhsOI/kh5weKG2Dtnvls?=
 =?iso-8859-1?Q?1s9+LwBHdAfDx4zkZruxUFs8OTPywaLza8/MduHTzOqIhtVYoSvSKPtyLc?=
 =?iso-8859-1?Q?3yvN2zBXCbKqy1MzQz9zzbpQU8IB1pB+uah0F4z/nK4PJBczaUgbnHsyZB?=
 =?iso-8859-1?Q?rWxrebstlLt8FLEOfzZdwE7kDfleaPP0CaJSF8MwmGbzHNEzvrIpZOT4fR?=
 =?iso-8859-1?Q?fPdxxsXdjiQQaVVqXdZMkWMxfEGQGAkpb4QDXm/ud8k7RF5YkpPko1WZLH?=
 =?iso-8859-1?Q?TfwcILZJ9mW9yvUtj2ihkbCzaCoY4sAdboCAnD5nUMvzbLma5X89p9KJPq?=
 =?iso-8859-1?Q?1M101iqWws/stxtksx9Fr3+mHHgJ?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(14060799003)(1800799024)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 12:26:23.6941
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 373dba8a-74a6-4f0b-0993-08dda8e32dee
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F8.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5896

Hi Mark,=0A=
=0A=
> Ah, this is where the time.h inclusion came from - it just got split=0A=
> into the wrong patch.=A0 I would move that srandom() into the main()=0A=
> function, we don't need to reset the RNG every time we generate a tag=0A=
>  and since time() has a resolution of a second depending on how fast the=
=0A=
> machine is we might manage to end up setting exactly the same value for=
=0A=
> every tag insertion the program does which would seem to defeat the=0A=
> point of using a RNG here.=0A=
=0A=
You're right. but what I calling the every main() with srandom()=0A=
seems weird for me.=0A=
=0A=
I think it would be better to call srandom() in mte_default_setup()=0A=
which is called only one time in testcase...=0A=
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
Sent:=A0Wednesday, June 11, 2025 12:58=0A=
To:=A0Yeo Reum Yun=0A=
Cc:=A0Catalin Marinas; pcc@google.com; will@kernel.org; Anshuman Khandual; =
Joey Gouly; Yury Khrustalev; maz@kernel.org; oliver.upton@linux.dev; freder=
ic@kernel.org; akpm@linux-foundation.org; surenb@google.com; linux-arm-kern=
el@lists.infradead.org; linux-kernel@vger.kernel.org; linux-doc@vger.kernel=
.org=0A=
Subject:=A0Re: [PATCH v6 6/9] kselftest/arm64/mte: add address tag related =
macro and function=0A=
=0A=
=0A=
On Wed, Jun 11, 2025 at 10:41:04AM +0100, Yeoreum Yun wrote:=0A=
=0A=
> Add address tag related macro and function to test MTE_FAR feature.=0A=
=0A=
=0A=
=0A=
> +void *mte_insert_atag(void *ptr)=0A=
=0A=
> +{=0A=
=0A=
> +=A0=A0=A0=A0 unsigned char atag;=0A=
=0A=
> +=0A=
=0A=
> +=A0=A0=A0=A0 srandom(time(NULL));=0A=
=0A=
> +=A0=A0=A0=A0 atag =3D=A0 mtefar_support ? (random() % MT_ATAG_MASK) + 1 =
: 0;=0A=
=0A=
> +=A0=A0=A0=A0 return (void *)MT_SET_ATAG((unsigned long)ptr, atag);=0A=
=0A=
> +}=0A=
=0A=
=0A=
=0A=
Ah, this is where the time.h inclusion came from - it just got split=0A=
=0A=
into the wrong patch.=A0 I would move that srandom() into the main()=0A=
=0A=
function, we don't need to reset the RNG every time we generate a tag=0A=
=0A=
and since time() has a resolution of a second depending on how fast the=0A=
=0A=
machine is we might manage to end up setting exactly the same value for=0A=
=0A=
every tag insertion the program does which would seem to defeat the=0A=
=0A=
point of using a RNG here.=0A=
=0A=
