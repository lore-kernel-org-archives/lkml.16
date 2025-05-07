Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012003.outbound.protection.outlook.com [52.101.71.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0036204090
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 10:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.3
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746614950; cv=fail; b=kKvDgSU6vqbsebvmz/+QurI5YYO9emihJpS7WYKqagDZgbG0jYv0o/uowlGJ3PVYvb62PmbcRuxfCEvqH8Ez2+TOqyJpDveK17TvCLhMAgqR8LVazSEsF6UnM2qbfEie3p47Ru1fUESuwlByNlIyjdDWUxSUVZ9m/mGhXIyIUDU=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746614950; c=relaxed/simple;
	bh=HQDDs4U4hjDr3aMUoKc55Urx7iv0dcDEnid/tgGvfNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gt6tGjC+uKCEtpOLhtvpspVtKzXZq+k8YUcPC9HVLF+Dg0PPKsRpVXjE29r3YLv0NDj5e0alssjazfB1pND3GXQFhnFnOZnY4XO2YMICAryG/eqfWYHvWyZWFWDmPbJHHDrlk8EYjkiZh1To8AL0oqJizCEXiz2azRp75EFVMCo=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=jiVZdBI3; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=jiVZdBI3; arc=fail smtp.client-ip=52.101.71.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jiVZdBI3";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jiVZdBI3"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=JDGUQeUZUsj7oDVAswjbaN4/whVaQhBnyivmLEmO9MMtsECUc7BDgNj7Hhfg1Q07e1VR41aRFNgNVrW18cbHmFyHXlbYTzqho9NGheFisQXoCf0FgmdZl+J4tiqYe/ehgmILQVA7gsd/5graaQgOLKmSaIcyi5cYybpBV5oJmik1R2Ehvg+UUy3b2YkpTXNhGRJNXES9j4YtNjlOHO2jn/lU2/7NZfiGFEkbbtdyzBS4ulgemmz3dnjj8ojIIvqrqlDhhaRudOM3xwPsuXBzWJ4M4IBtI6YC+bz4x68QBXdEOeYtrajENwiWqCuGFJLgXv/DWQ8VPCNSftTtxqAHgA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=37DP2UloCSFSOWrJcULfdly5wwTRiMsE4m5CtsshhO4=;
 b=ApotpU/r7E/jlOKN19eKTeyBNCUNP7Jqi5h9p/qhqQVCT86Pvx5RevbgHGxbW+gIHgdW3uk/GOBVmsFSfTOJLHjRpOEbewzB6yB20B347IjF5+9m4Crg4FGsAcHc/ASYQn18ffU01w9q31A3djOnTwYKpAdkI+h0GAYJGEOcod3LEGNo+hA+f88KA0SQ/sQYkPeFn2VtOP3IGBls2h3kQODS1stXgeuevz69k8pj6rvjpr4PZHsEfDB5Th9iJwZA4Z5fQTvuwIPN6J8Lc65gLy6kwZv+UXK8w2k7AwTVm4TgCKY9BFwzpocPnG28+ENVHARMFRowHnxcccGTXtSiNg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37DP2UloCSFSOWrJcULfdly5wwTRiMsE4m5CtsshhO4=;
 b=jiVZdBI3WXVnmzEyr6XZH39gtmkKmAX+9Lw5HMphV0azxsuJxUEagYkfabupSSPRu0aiaYa6x1ylilJR6uOTKnX9UUS7OpYavPNzn0zr4QGM9ROQZelW8eltPzH/nE8gVKZC2gRPJ/JoB92Y3E2le6vN2wjYGnKIVFJrX3auVos=
Received: from PR1P264CA0007.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::12)
 by PA4PR08MB6301.eurprd08.prod.outlook.com (2603:10a6:102:e9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Wed, 7 May
 2025 10:49:01 +0000
Received: from AMS1EPF0000004E.eurprd04.prod.outlook.com
 (2603:10a6:102:19e:cafe::5c) by PR1P264CA0007.outlook.office365.com
 (2603:10a6:102:19e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.21 via Frontend Transport; Wed,
 7 May 2025 10:49:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000004E.mail.protection.outlook.com (10.167.16.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Wed, 7 May 2025 10:49:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ua7WW+spo9oLEwhOrBSpzjYyHeoUkXlKD/gBFI1gcH6YFbrxz10ljjdh5h0la8srZAdNNLzrmDzVgCq0JlcvlFZq2hTYBjEIFGyzvkPEMtzYWFM8beU7BYH6xT1hvYod2xhc+MqvOzwe4Jk9dvXlwuAyWIO8gKQODehuPWN4NtARwERfjvDSpwFcrUMjCMJIiS6hqC4DVFWssNL8QLSiitCcMerzJQoXrgSZl1YQZMHh6x826125/9b++q0NFGZz7qqvj+mVpDjI7ekPowvey3xW7pHORvmj7MygreuEVsmucN8n9HqiIIn8/7phQ8lUse48k20myu70WQ13SbiPag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=37DP2UloCSFSOWrJcULfdly5wwTRiMsE4m5CtsshhO4=;
 b=mEkF3cYMyt82a/t1NOwAxg2G45EgEzcGBrN94g6SMLQ8HyqVqp30jMmgvEjMR2wE0aEC5PwjvPYmFZA+hQgRvevSZQzqklLlGYznS6zMqKlqhEOxwPRa7iSso2wnwX4+AnFvJSGqL4LyBJ7vMm4Ej8JDkmyS950SCnm6oc4P4CukBhhlwpCAqdaMOBU/Imzzygx2o/JSoANOyRgQNvGvGDrHN1xdR/P4dp+Lc2S4IpGN7ckolWv0+s6M0J66xo8UqmowbGBN7/VKm7jPJWmzAMl2GtrRVGb+Yf9tU6Qq0lUsyY4/Z/CgLVC/tNTUfxWYghrLWYSdIMZIuGntqP2vYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37DP2UloCSFSOWrJcULfdly5wwTRiMsE4m5CtsshhO4=;
 b=jiVZdBI3WXVnmzEyr6XZH39gtmkKmAX+9Lw5HMphV0azxsuJxUEagYkfabupSSPRu0aiaYa6x1ylilJR6uOTKnX9UUS7OpYavPNzn0zr4QGM9ROQZelW8eltPzH/nE8gVKZC2gRPJ/JoB92Y3E2le6vN2wjYGnKIVFJrX3auVos=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AM8PR08MB6595.eurprd08.prod.outlook.com
 (2603:10a6:20b:365::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 10:48:28 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%4]) with mapi id 15.20.8699.024; Wed, 7 May 2025
 10:48:28 +0000
Date: Wed, 7 May 2025 11:48:25 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: will@kernel.org, broonie@kernel.org, anshuman.khandual@arm.com,
	joey.gouly@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, james.morse@arm.com,
	hardevsinh.palaniya@siliconsignals.io,
	shameerali.kolothum.thodi@huawei.com, huangxiaojia2@huawei.com,
	mark.rutland@arm.com, samuel.holland@sifive.com,
	palmer@rivosinc.com, charlie@rivosinc.com,
	thiago.bauermann@linaro.org, bgray@linux.ibm.com,
	tglx@linutronix.de, puranjay@kernel.org, david@redhat.com,
	yang@os.amperecomputing.com, mbenes@suse.cz,
	joel.granados@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, nd@arm.com,
	Peter Collingbourne <pcc@google.com>
Subject: Re: [PATCH v3 1/4] arm64/feature: add MTE_STORE_ONLY feature
Message-ID: <aBs6ediY9khoHmU7@e129823.arm.com>
References: <20250410080723.953525-1-yeoreum.yun@arm.com>
 <20250410080723.953525-2-yeoreum.yun@arm.com>
 <aBT_4xNOL436-jJR@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBT_4xNOL436-jJR@arm.com>
X-ClientProxiedBy: LO4P265CA0121.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::9) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|AM8PR08MB6595:EE_|AMS1EPF0000004E:EE_|PA4PR08MB6301:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dc23c30-8e9f-4082-ce5a-08dd8d54c699
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?vJsgl6WJwu5Lmf0aGgploezsvVcnV08IH09ZKhTrrW161bITIGqS5VZn5yO1?=
 =?us-ascii?Q?wdBOiADQBXtFV9oehplO9XYzTWxdkTw9BUqNGHrfUbXB3GSK6h2mI3jO6hMA?=
 =?us-ascii?Q?oOr9Hjy5je8a4ajHYR66frGpR6UhjokMujdgb8tWjpZ11LOgvhyOPlNLtrUb?=
 =?us-ascii?Q?Yva2IndIbsZjSVQwZbA36CulTxgYxuan92rcgY950cuDhuNysMENt4u97MPU?=
 =?us-ascii?Q?/eXhvdC70THBqDVgzRSerioLw/J6DlD+bzT2z8QFVupNaa12IjImXnHyJkfR?=
 =?us-ascii?Q?G+/QIECr4qNkNDzG00eCCfh3f+CMVrkyEcl43hB3PVJGvqXIa+VvGEwmh1bf?=
 =?us-ascii?Q?QFYjdpiBckAl/H38j+gtOXB/ltthgUUqBoIYCSxDXHtrKfGsRj22pfBtAScq?=
 =?us-ascii?Q?52TNd4s6GefgixCrpeuVPbk641vpy5fHdepv7H+OqscFYIesqFp9cvx6Fu4H?=
 =?us-ascii?Q?/6RO/9+/gbEQsj2m/d/gIv4DK/VJbjn0TafesqyS65T2nFPWXc3kdUqi34kV?=
 =?us-ascii?Q?ACWpgYdCiXSRx9XC+AiVW6d8aB/e4M+r5gNnt5SWnFRv0AwaE4nr/+VPlm/d?=
 =?us-ascii?Q?Fag7DTb7aC+PvV2XRL0kQud1KOzpWVLB1SKnSzeex9a4n65veJvtB0Ch+uVc?=
 =?us-ascii?Q?9QhJPBTB48SKVLkwpqRq9St9+13MqpRXNHYdIE05aZGvNiPZLoEBca0TQ4E0?=
 =?us-ascii?Q?bBrMcrTQS4m+PEVxNgY1nkxxW3kNjTeycGFnQxFxQhoJ3MZKD//7xwzhNuri?=
 =?us-ascii?Q?Y1eUaSx1efE35o+R3P5LqOIEzlt8zmOlqd3FYcespid5TrP+3kwaBTQBNA6g?=
 =?us-ascii?Q?7SrKtTd9w382FORxDWslaLOTe1nhuAkCSjOqo9GMnrb1YBc7dx1sBzUyCwc9?=
 =?us-ascii?Q?jADYlV79eRMdpmwY5zuocBDNgcJU/+iPevWH57fQnyM/GkwmbkSEUoubqyZ2?=
 =?us-ascii?Q?pI3WAihbYwWEBnZFi8YRJSymEjEMh2pFv3yb72D99UIFMg7atVUCHibvebOT?=
 =?us-ascii?Q?qNmSREheLP0kWFK9H+0mup76pQsRB9I/pMD8bc7MU2FosFduxZQtO9nrrS1B?=
 =?us-ascii?Q?ryoMenHKQMaG+FV3kOphPpvDMOoAsbqn+1VFYeebhNPs7BbaHxqUAqvoBdIe?=
 =?us-ascii?Q?RfAYZvqWCf3KrsFdE+AqIxi/omxahx/TjY8wRYmT4pjKJEGEcnc5VJKxzt0p?=
 =?us-ascii?Q?q7eoPDf4jD5nCOobsCWM2dqq0k4XuWVUnDjPVnrBZ6VakSVOH5KUXJcQFoPN?=
 =?us-ascii?Q?ytKgjDXaog2bGK8ul/V44ki9qvsndqHmHJUfSGDI0lRvXUkl8LVDwtVIiSBF?=
 =?us-ascii?Q?nHJlVcHv7u3Yj/Qx8TB4w5a9yjDO3wT4op+cS8sCGBZ7ZSeixE5b/TC5wpNU?=
 =?us-ascii?Q?g/7q7bI8U92aQtBX6Qtm7MqLecLPlQmoX8HC0khnN5O1BwhrZHwmovOXBfXk?=
 =?us-ascii?Q?XFn6+OEb3wI=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6595
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000004E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3933e49d-1431-4aa2-ad7f-08dd8d54b367
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|36860700013|35042699022|376014|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?04tHJruWefzi9m74YMa8jqNrKoeTH0PzD6npUTZ/2NVCq9CZYESsfOCWF3af?=
 =?us-ascii?Q?Ps3XZUFYerdOM7mgZCeV3NkvCzeYPk+U8vxHHefN27aqD2nQBRKfc9nz7HhX?=
 =?us-ascii?Q?p2crOW1KsgMTh1PJs/g83MLEhde1J0mxmoKvW5RoXQBtrluUPK+Q04IbvKa7?=
 =?us-ascii?Q?+Rf1O03GofySVDtCyxziavCyxUH0be5rYd5pPc1ywUx7oxwcZyoDhv6G7NoJ?=
 =?us-ascii?Q?WcJJmVLA+QppYv+a7BmpT7fZTONn8xnjK+MNezRqVn62jCjmCKZ8MAQj7bnO?=
 =?us-ascii?Q?SXdnDw47ir4UyMBld5p0WGArA5efq28fM6/X3GoEiotBjGOlvJs+UmwrHrq3?=
 =?us-ascii?Q?OqpaNkoJRTDzX8ECe44KS7+YojY5LqObDAlLGOeznZTBW1HRxuURJNmiJsbV?=
 =?us-ascii?Q?zY4tIPeomJ2zDwkoPCL+yL46mSy69+24psF/LvAr2vACEoUlVVPLMg9hO6aO?=
 =?us-ascii?Q?SnjDuqFXc0MMECJyjLwp6/TKVNKgd4emWA8pGmFy8WXIcqqY71uT/PnWa7L4?=
 =?us-ascii?Q?JdpKYPvQb3SeQJgKeaaDPJBsTLEcfrr5Lkqx12C+mi7DX/5myfBjZ+oev9EP?=
 =?us-ascii?Q?Cy29Sz+DVvUQv/wYNGdZSMtWLosqEKEMz8vStTqdX9h8K52JWxR1t4VbkKE+?=
 =?us-ascii?Q?5IDk65lLU0YfTAxsmGgDZJxdgmCvJ/R8LbLsMFuIbjvRY0cCCuLuRCKkJrHt?=
 =?us-ascii?Q?5YtHrL9LMzEDFOd7x6FQC/SdRjtX0/6Wvn5obYCQyPEEDzosGSm741l/d6cl?=
 =?us-ascii?Q?rh3ikAWW8UoWucsWVPLbbWMsoGWOGXifhUulwa5TsPiR+bFKlahGxZuGmluO?=
 =?us-ascii?Q?2oh5UGAQhUJZMfX7W4taJ5o01N6QO2vZ90S+t/xuFNWKsZiBZgs1cEeoUV/z?=
 =?us-ascii?Q?CjGCyHGDpn8tNj0Xaslabcg45Motr9qM7vHaDhgurzx+sWVPKKSRNt54KZ1v?=
 =?us-ascii?Q?WcfJE+Nq2LRTdxogh0fw8Wt9C9DUpJ5h11Pt9BonuDgWyTplIRr/5HOyvkxZ?=
 =?us-ascii?Q?ztZhsqNDhd3+OHLm5UFT9gcgybFFEthwnl/oO7hHjryhOqtjcl0A27Lx5wIW?=
 =?us-ascii?Q?42w+DwRzxvI7BP8WcjwrjlHp27LWa5vOV6WHn8M2t0hex79ec31FF3OEh69j?=
 =?us-ascii?Q?Y0mceU3fbcOjhB0O5IWFSZzgdEBDzMOYw8n+HQUSdJoGhFWHj8Agvsxc0Fms?=
 =?us-ascii?Q?FZZ24FTVYfl9xIGNkMihEZGz4ujMMZXrCgY8MLDJghIpP4oWlMpynuM43i8w?=
 =?us-ascii?Q?ryhrtGf+DLHne0sIPGtoPE7yafeaG61YKmFEHsFMjICzXAqv5G7MowbfuMWk?=
 =?us-ascii?Q?GN5Qde7pu5uvXSToB6Ur6KmcHZc1vhu7KFwui+V+UPSK7PAwlClP6qrMsnhB?=
 =?us-ascii?Q?tqgo9bNPLdHxp+KduRQuaT7lbIuN0gQp9KlWuToxcf0zOD+xO1YKQodbAmHk?=
 =?us-ascii?Q?iJ6+yTpBiFInZPTMAdTDXoY3QXpFsfnO4CCHdIMX/lUDg7thJCgaG/VJGYFA?=
 =?us-ascii?Q?DFBSl6Cl4YWbI3rE53aidjwRwHCwawvsFIXm?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(36860700013)(35042699022)(376014)(82310400026)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 10:49:00.4375
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dc23c30-8e9f-4082-ce5a-08dd8d54c699
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6301

Hi Catalin,

> (adding Peter C again, please keep him on cc for future versions; and
> you can probably avoid others that don't have an interest in MTE ;))
>
> On Thu, Apr 10, 2025 at 09:07:20AM +0100, Yeoreum Yun wrote:
> > add MTE_STORE_ONLY feature and HWCAP.
> >
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
>
> Please briefly describe what the feature is in the commit log.

Okay. I'll add short brief.

> > diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
> > index e2b13454e38a..40f85ec01fe4 100644
> > --- a/arch/arm64/kernel/cpuinfo.c
> > +++ b/arch/arm64/kernel/cpuinfo.c
> > @@ -161,6 +161,7 @@ static const char *const hwcap_str[] = {
> >  	[KERNEL_HWCAP_SME_STMOP]	= "smestmop",
> >  	[KERNEL_HWCAP_SME_SMOP4]	= "smesmop4",
> >  	[KERNEL_HWCAP_MTE_FAR]		= "mte_far",
> > +	[KERNEL_HWCAP_MTE_STORE_ONLY]	= "mte_store_only",
>
> Nit: "mtestoreonly"

Thanks. I'll fix.
--
Sincerely,
Yeoreum Yun
