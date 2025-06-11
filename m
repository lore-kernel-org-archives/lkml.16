Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011001.outbound.protection.outlook.com [52.101.70.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F901235C1E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 17:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.1
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749664585; cv=fail; b=IhzbBnorDfOjdmDyiEc1FLhT0Uq1QjMsFa/RBv6c9TEENKGHhXIKmJLEabX24kgPCcEFglhZk+HeWX5YGumAG3IQmCu5HxVOybe67ByRtUvJdg3TruYKbiEiSVZpxxG3FWOJ4ELp6bgoqnJ3NUkeZ5aEYERhgUsV1HxUaGTIR+E=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749664585; c=relaxed/simple;
	bh=HXDu08obpU/CWVNHOBM1SDbqk+rnuKD0ljZ1386+ucw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rBQR11JVQqhX8nJOWnIQlMJuZK+CMBgUyPeAczMFCk4GkQwDJPGNTYH3ExbLnlefhPoX80WMMoOUKia2+XwuDYfSCb9RBKNN5i6+rgC/9A8Ung6zfUY4R6xLRClY891JJ4dxezAHRDLifGAjD1ppAvmkVw0rOXzyido6DneEtlE=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=cwSUzNkK; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=cwSUzNkK; arc=fail smtp.client-ip=52.101.70.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="cwSUzNkK";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="cwSUzNkK"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=xqy9+E0UCp944pZfp7IdV6rN3ODeutItY5k3EtRnNKLxgS6PRJBJ24NTIXtZkpleLg0u4AxCGeFFG4p4S6cJDHlBq0o2j+nOyv/+ywYDNBnUIqSDJJGFSPrAExwzd/1sYeNvv2A9TDtf6bOcz8IG4bP41/abWilIcqpkJzw0vCa8dsB9Noxtg7TjBw+zi0SWrMgBDQVfDhSEi78XWi+eMnVtsN/kHi7bhKRlaHehpjJSC3mi+0tbW/u+q5fDfEhPK4tws9MB289PzVoDtyWH3iX5fv5KYYaUzrQWU+IHzXydbkMsHLFxJ6R1j5YxDYEseCb/EBzUTqSbv0jdsjiLDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RxVUWsDw2OKtTwj4Xo6UYmKZ9NdOCiJe7RAdKve8ly8=;
 b=ed3a54No8FJS72bJPit9RtWqXfvLbT8WZdZzGK47+cLvHTD+UNHOc6Szaq2wiwclzl89yeLXdl+tGvZwZKWQCo8Ix1n3D0ZFgKRdr9p9+H3vi+GpjIryTVlro+lsRNmumTuacpZRUkWRsTJkFHWq6IclonmuL6q5jcfP5VZXXq0VavHs3v7Mv5QUS4wz8vETDHGMk5G29io3BU+/CFL3fMX/Rixkh+KDJb8xzpFNLWzS6VmlTTaEcztnGrPHerhmo0p2kNhFrR/hJFK46A+nuKTghzmJHURUOAQJLPH7uXznWB8JhhnNJF0KVaGqRZsEKhqIjM0vGEMb5xWTMxeXIQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RxVUWsDw2OKtTwj4Xo6UYmKZ9NdOCiJe7RAdKve8ly8=;
 b=cwSUzNkKe+gDXbCm9ek31I+92g1Yb7DlTnuGqcDXsLI77S8IdlS7pjPr880GHA+FEckkB/hrfMshEHDGTfhj8cLEH42uf/XKLpMvXTBylkBmjnHjCVyn6fVsd0qNu2NeBWOcngX7Xo+l4Pr9kKNKunzws6N+nUZMcD18k2AYpdw=
Received: from DB9PR05CA0029.eurprd05.prod.outlook.com (2603:10a6:10:1da::34)
 by VE1PR08MB5757.eurprd08.prod.outlook.com (2603:10a6:800:1a4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 11 Jun
 2025 17:56:18 +0000
Received: from DB1PEPF000509EF.eurprd03.prod.outlook.com (2603:10a6:10:1da::4)
 by DB9PR05CA0029.outlook.office365.com (2603:10a6:10:1da::34) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35
 via Frontend Transport; Wed, 11 Jun 2025 17:56:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509EF.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Wed, 11 Jun 2025 17:56:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GgRVsFadti7aiZ1LISg6Hc52HNKtLFoUULh6Bja9i/KWS/1+Isv0UfFrpJwzotv5Cl4+h6Oag6SKqC2w3VFIBOpBxaJW/xPRoyo18QkuaaVzzkxkRoO7lNn7RlKkoUXLRNhy7QG+V5tDw86NVZqLs6+PAZOJZ7a8gk7wFR1eAQvkrXc/QPShuI0UZHMlap0D84RU6U6XSia3EpuepTvUXeyvTp8GP3x0Tlj2owgYEZkOGllhaISQYdGzef47fHs9ZJfW9lbRGQ0JkUg2Cn89eWqkgz5KH3V+mKrJo4ebAAQk6YCWfKiExB5E2RpcCPVjJEppQnhfyRmzjckF1ys2vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RxVUWsDw2OKtTwj4Xo6UYmKZ9NdOCiJe7RAdKve8ly8=;
 b=whmPgfY0xKOUmEJkdzE11l72K+bGI+p1rADG4HOXwwFxzvQiyL5AlOQQ6yd9ceOJAOEz1wk9vUcybmYNegK/D1DhwC+jwayatwUy7roPmBNxkMwninu8nyEcdkgBUSjXUthPMXdCyGJ1ZlJie0uDRw1aLMmDgAOqmc2FB2sHszcRJh0J+eRAhK9usi/CQ5kxYM9jzvWe4sdwhvTXLDu26HpmQaSMGuapUcpdKw/CZfeIZQVl11OHeLaZarzHr0bAO4YbA2yq/s4rjhh7e4BT5CROyzwt6j17w+u6maPsxG0A6EHsVwSNz2jNYyvJyRfEsnK2jwc8tpc6ZySzbh6dbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RxVUWsDw2OKtTwj4Xo6UYmKZ9NdOCiJe7RAdKve8ly8=;
 b=cwSUzNkKe+gDXbCm9ek31I+92g1Yb7DlTnuGqcDXsLI77S8IdlS7pjPr880GHA+FEckkB/hrfMshEHDGTfhj8cLEH42uf/XKLpMvXTBylkBmjnHjCVyn6fVsd0qNu2NeBWOcngX7Xo+l4Pr9kKNKunzws6N+nUZMcD18k2AYpdw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DB9PR08MB7676.eurprd08.prod.outlook.com
 (2603:10a6:10:37f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.28; Wed, 11 Jun
 2025 17:55:44 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 17:55:44 +0000
Date: Wed, 11 Jun 2025 18:55:41 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, broonie@kernel.org,
	oliver.upton@linux.dev, ardb@kernel.org, frederic@kernel.org,
	james.morse@arm.com, joey.gouly@arm.com,
	scott@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] arm64: cpufeature: add FEAT_LSUI
Message-ID: <aEnDHerp45syb8iO@e129823.arm.com>
References: <20250611104916.10636-1-yeoreum.yun@arm.com>
 <20250611104916.10636-2-yeoreum.yun@arm.com>
 <861prqe2bp.wl-maz@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <861prqe2bp.wl-maz@kernel.org>
X-ClientProxiedBy: LO4P123CA0353.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::16) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|DB9PR08MB7676:EE_|DB1PEPF000509EF:EE_|VE1PR08MB5757:EE_
X-MS-Office365-Filtering-Correlation-Id: 44c61caa-cd98-48d7-15d7-08dda911438f
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?C8OCP0aZiAuTzbPKTUBGfhT5y+4pVr0a5e4e/hLRxI7+6ATdU9hp7fZtw0xN?=
 =?us-ascii?Q?D6fkuSpFgKR/vtkiXYmNqFnKEjsLqaIlpcSTEUnZrK1uNBSoLFupMU3ZHoVy?=
 =?us-ascii?Q?vyZCGl0YheJFoW/UAH8+6l+aJ9s86ZUz8wRZTNu7/g3Y4Vq27KW1/PbMZ31E?=
 =?us-ascii?Q?oXFZThe0QV2z3dOgQaidYWkjiDcL0sPaElbomQ8KGRYZHjMsTfUauYC4lfRH?=
 =?us-ascii?Q?Q61eVzv0iBJZ1aLpDjdKofemIJmg4fY6LmTeLN+VV4mWOK84nuNLlxs/Oc++?=
 =?us-ascii?Q?T+lL6aCpSq6mmkOu9EfmZmSwCwxExmbTY3fc08EbcW5Mj7dkG1+oKZSqDwVE?=
 =?us-ascii?Q?9134cN5N6tyKm/9M0l34tT8OzSdyW0QlgVtKvHCM+61uH1iO13M+B6Mc72V1?=
 =?us-ascii?Q?M36wvLN4wSyxLCewRlUoQMQwuu3E2P3Gg2ReNAN0sO6hvM7OPqzfAA0J2eRW?=
 =?us-ascii?Q?oSCOCgXPGlvd72d1hvQ0upL+5nycu3K4f+WI4Q1ctt98u1Xy2/aRIn2nB3NR?=
 =?us-ascii?Q?xOzRsth9xZJpE/kRDHpj9WAcgONDgcRkCXL/kCbHMLEih34Aa5Zo9K+UnNNr?=
 =?us-ascii?Q?9BCRl9VycqC43PtHkcwf81yjyP07kuYq0M5U7pSDxDlohSSmkPXzboE7OOUK?=
 =?us-ascii?Q?BUVysQf7bC+vd2NyRUsJ2mLcrK/omElVmymHZEaQ83EmHzf9lM3hRGyt9Foc?=
 =?us-ascii?Q?OCpihJSUzZTAqR3eD3j+oEc4fg17bgpTYYWCSCxZSBg0AWG3PvSkvLTp7HN3?=
 =?us-ascii?Q?H5bZRabRyg1Z6SyKQoGCcUxBqaKsaqD6pilbSasGatkr9XIRMK52si+rOA5Q?=
 =?us-ascii?Q?yHsBnwV9NCeB9Y7yLbn+xYAj5C8/RjttRYl3sDfBlsY9WM5s5rGe3zEIduxr?=
 =?us-ascii?Q?js82yn1JklSv1DsW0ADGoLA0ezYLIpdD366D4f7hjtuzZrXUvJH1AnPkUUos?=
 =?us-ascii?Q?tsYxNzV2JhiyMJUp+oQQpp87SGpcbcF9SkxaXvUbQyOM0v3e2YbNPxkcOd40?=
 =?us-ascii?Q?/aASdckMY2+JsfYjU5CL3dcVqwkQW7Nf6XlFxUJuXz82+V2aPDQUepugH+Im?=
 =?us-ascii?Q?HiDWHMEQiYxykbxX04RTZDcUp7Sv8v9AI/d6siqa+BWl9NOTW6bKTPOmzYdq?=
 =?us-ascii?Q?UfB/4AEANe0lUpetL6f7P68qxicS705p+jqx+Dph7bSy1Tohz9IOnFe8lDMQ?=
 =?us-ascii?Q?0duEoVXgVB81xsWjpFRn/D1gnFFTi7FXJIISB/+HXeTWB32BjK9MbjwOGHYn?=
 =?us-ascii?Q?TW2aWipKzneK/ouudV7D/PqA88qeb4cAkcUx5IEk2bvGxEvvPU1H3kKw6V6b?=
 =?us-ascii?Q?KjL8mGBpotWBwA5EHiKU8yz4X98+hhOzaBFPA/fNmcZaVXUCA14s4++HDw5m?=
 =?us-ascii?Q?SHDKtk0bfzRzaM501oEbc/y3rEYHlfddeWsmkhdMj2JsypuzKcMDEXjMgz8q?=
 =?us-ascii?Q?Xup8cwSi4/s=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7676
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0d8e8987-7e7d-426d-5338-08dda9113010
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|36860700013|1800799024|35042699022|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yOj82K9sstc8f9C278SotlW0DEKGFDhvVKwwLgf2laEvAjwuIFh+b/xUy9AR?=
 =?us-ascii?Q?9QYP5oF+gQ/QF3FUi/A6v5HrLbJdczRAM5m6PuEPGf687m/j/Bc5geSErnwB?=
 =?us-ascii?Q?Vp0nu+D0IwFGDa6sMY2rU8/hFXRb1VeHzJKctWjv7vW0C7alhT2XhFnv0BvG?=
 =?us-ascii?Q?eMPS1FA+h4QXO7gcM9w8pJMXVt9SMIVmct+aj4hkT4NAedLd7qCDkITHdKed?=
 =?us-ascii?Q?s/sznokKFBQo2UH9/RMMurKbGOoY62l8EdGvSFbWw0HGZOzl8n68pZ7AZy94?=
 =?us-ascii?Q?i8Y5tn0DQPPNi6iyvx0DFza1lN4c09D7AgQeHigzVzNckfGobWgf+aGf/vNl?=
 =?us-ascii?Q?B9ugeoPEhSsF04XvVqYuSOuYtgC2YzQeT8lqindVfrTw73Sua3KNht3z+l1+?=
 =?us-ascii?Q?nx6Up0JehPBcshSB3NHFFlzxK4iZ1YNM22sIwioSWDQEBMIU6M9zlSqiOlRc?=
 =?us-ascii?Q?jRkEgOn78Td4vzQO9fCJuhDEVP//fnePlXjebVck2B5mhE2BPmkyZjEhLDhR?=
 =?us-ascii?Q?UexyqTNvf9GBnfB8zCfNdat0z31bkhAowEvxn2sVGRpN3NR0wJ+e2w/dXXaa?=
 =?us-ascii?Q?QAEMkws5dtuxifmgU/itPBtdzENg/GdJl4A4yPlp7zmxmtH9ETnLS8sAd8Q/?=
 =?us-ascii?Q?0M20eDzD42uG/f3zw2jagOBujr0UsihtU1bzg2BCSfzVLDQm/l1ZfuJYstNZ?=
 =?us-ascii?Q?7msohisMvls4nqyrUh/vzgEubUOge08bdH8k4c+X+kfWI0KzBvZ1ysieHTIj?=
 =?us-ascii?Q?oh/PL5WzBtZjPL3ITLPup061UZfB5zcr0mxGHDszk3j5Dj9lhBNqzY4KrrSg?=
 =?us-ascii?Q?/hDU4CUMBEhdIv/9dxKggsm4q5jQPT/jTclKYWK2iI/OaEWOubgfGnsRfJOY?=
 =?us-ascii?Q?m078vfbVDIFGsb4rzeNjvUhpnZy7U+lVW59iPHwowphpm1JpuyLZmNlDlXym?=
 =?us-ascii?Q?l1Cq3dM5i5XfImVoCeRzJ5DW9Jf4aKTS8cubhYEo7gLRAi9BMj2t0SUt7pxS?=
 =?us-ascii?Q?7DjAXv6qOLCi4C9mkVQOO9Noy2ji5pqY3RZZ+ZqG+OrTC1qYL4IFoh/POm6+?=
 =?us-ascii?Q?D8oqok4Q2jhrXo8InXHg7loANMKZ8Jhv87fApt5bnjRt0oDFkgV9Dd5N5xh2?=
 =?us-ascii?Q?z/qXi7pV6aicp1psyP0RU2tfVVdQZzwtVRgi3gnZinyHT1C5oZJn7aBcxyMf?=
 =?us-ascii?Q?4ffGUjnis4gLMewQ7GdTdEFOpW4eHKeg+/FYmMDZvlPcsNRX5FbjFZR8fihx?=
 =?us-ascii?Q?ihIVpWDkraUzyZQwArdx4t08IzjvvA1RBv6nObJXujrp3QuUgHW1296rbNsF?=
 =?us-ascii?Q?sOqVqSxOp9nx6TfvcE4L/5x75OBqIk1gXEthyb6RVFs3TXDrlDSVd5C6O0lm?=
 =?us-ascii?Q?EoWlIfPzjEXPEuiGbdVPcj0LitxosbJjDUQjbgChBSaPLtYPk7SFomokON/H?=
 =?us-ascii?Q?B81x1BOIlId8mlhzBOD0yDNlQX2UCgWoEKE4ZQXK4VHnJ77NGJnH35d+mAbg?=
 =?us-ascii?Q?/5j4aNwIEtBiXT0eq1LeXvEHeM5ARn66BtO0?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(36860700013)(1800799024)(35042699022)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 17:56:16.8441
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c61caa-cd98-48d7-15d7-08dda911438f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5757

Hi Marc,

> On Wed, 11 Jun 2025 11:49:11 +0100,
> Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> >
> > Since Armv9.6, FEAT_LSUI supplies load/store instructions
> > for privileged level to access user memory without clearing PSTATE.PAN bit.
> >
> > Add LSUI feature so that the unprevilieged load/store instrcutions
>
> nit: instructions

Thanks.

> > could be used when kernel accesses user memory without clearing PSTATE.PAN bit.
> >
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >  arch/arm64/kernel/cpufeature.c | 8 ++++++++
> >  arch/arm64/tools/cpucaps       | 1 +
> >  2 files changed, 9 insertions(+)
> >
> > diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> > index b34044e20128..d914982c7cee 100644
> > --- a/arch/arm64/kernel/cpufeature.c
> > +++ b/arch/arm64/kernel/cpufeature.c
> > @@ -278,6 +278,7 @@ static const struct arm64_ftr_bits ftr_id_aa64isar2[] = {
> >
> >  static const struct arm64_ftr_bits ftr_id_aa64isar3[] = {
> >  	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64ISAR3_EL1_FPRCVT_SHIFT, 4, 0),
> > +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64ISAR3_EL1_LSUI_SHIFT, 4, ID_AA64ISAR3_EL1_LSUI_NI),
> >  	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64ISAR3_EL1_FAMINMAX_SHIFT, 4, 0),
> >  	ARM64_FTR_END,
> >  };
>
> Please enable the equivalent bits in KVM so that the feature can be
> exposed to a guest.

Okay. I'll add in next round.

Thanks!

--
Sincerely,
Yeoreum Yun
