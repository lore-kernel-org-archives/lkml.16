Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11021087.outbound.protection.outlook.com [52.101.129.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6261B87FD;
	Fri, 28 Mar 2025 08:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743151793; cv=fail; b=gZ4phfV6+mc+HyKFVntUvCsowDMxaO74rKk8CTZ4A7EG+yQ4OTLrsEqCbWOy8MlpP/oR4gBearFqBv6Nt3qifUhU7zwFyujhJTVMdNRtBvm/4iXu5Q4Tew7UOce/pbQAeFw4cN1IR+mDdayOlDKLA8fA1M33HR8WtsMKTm2mZ7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743151793; c=relaxed/simple;
	bh=nQBDVjCD2rm85Y8CKiKwjekhbLDNfrJQvyyhcYjno+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IJTGegBXiwgR5SfcyXzz6ULU5ug/TAnIi2zYebhT3JArO3/OVmnZddn0AT6iHc4er6JQJlseF/JDCgJzKZ8el2Wgh4UJ+GZV+DGlj8zJOqyFPNr+67wYB3TNRNBv33nBc/d67HqSfBssntK6+aQ3S71ywuTttGJ0FohF/Ve+d3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.129.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dZxR2RGMlcUHcxZ1rzpIVZNWSKMVr3DME8Vog83H5v69JyEsfDhI64ykBFakbqiZxLIqgBvnO9sQpHtASgFHPU+TpmhWqXG4+DYH7O6iLIwrBRtnqZVcD4B95RoBMYzWUjLaCGVLHQ6lfq1wW7noLrmLSQhscP+4culCcgczy//dXSFdWxrbY3BpOjPYKLAuGBlWvGoX0QXNnFFFf0EIEL1gOh4G6wIcSrW3ljtmqrRTIT0VjnnqT8ibEDOSx/OPQ55+p2AfxJR1906HcDGq6Cn9h2qVn8q60LG0GNWP3fOEN4OzgGVck1yEwmYuMdPg9LC0Sreuc2N/gpbdF6Idrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+hkPwW5chCFvMZOAS6ndTbOvxFLENI/xQRpf5tJLm08=;
 b=SMXU9m3pe5mSD3DeGDIoMYlgAi1mK12KzIlWHvcenYQEPVZ0KwXW9Wh9i4t/wUTWlORMTMAy+C2vbOUL0UaOlRfe7LzC/awdFgfXuc0Jheoe50pfM0eK564TfDLISsJWN2vFgn2pS79nbw361E3CbhK22hWswwwKQpgk2+Z6sCgh3FNBIX52IW5VDGAGsKsI83M1pNscRc6iGdBjZ4gGiN6n3IcJNrJxBUkTQ3v3kOZZxQxttEVmU6yZk4PHtz75VJCjdSyKmqQntHKYa0U780l0DAoZjNLTGzJaEHUtqY9EoYvBRo3EL0aH6ZG8ytB0oDhXjDK1IpUGspqruwdlAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR02CA0015.apcprd02.prod.outlook.com (2603:1096:3:17::27) by
 SG2PR06MB5105.apcprd06.prod.outlook.com (2603:1096:4:1c8::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Fri, 28 Mar 2025 08:49:48 +0000
Received: from SG1PEPF000082E2.apcprd02.prod.outlook.com
 (2603:1096:3:17:cafe::8) by SG2PR02CA0015.outlook.office365.com
 (2603:1096:3:17::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.46 via Frontend Transport; Fri,
 28 Mar 2025 08:49:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E2.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Fri, 28 Mar 2025 08:49:47 +0000
Received: from gchen (unknown [172.20.64.84])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 111F14160CA0;
	Fri, 28 Mar 2025 16:49:47 +0800 (CST)
Date: Fri, 28 Mar 2025 08:49:45 +0000
From: Guomin chen <guomin.chen@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v2 1/2] dt-bindings: mailbox: add cix,sky1-mbox
Message-ID: <Z+ZiqTDhVXoBfjIe@gchen>
References: <20250325101807.2202758-1-guomin.chen@cixtech.com>
 <20250325101807.2202758-2-guomin.chen@cixtech.com>
 <77f94763-5604-484f-93c8-dc018c166b37@kernel.org>
 <Z+YT4XroHJ3OjiBX@gchen>
 <815412a2-8537-4641-b528-30ad564c6dc1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <815412a2-8537-4641-b528-30ad564c6dc1@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E2:EE_|SG2PR06MB5105:EE_
X-MS-Office365-Filtering-Correlation-Id: 12a666b8-590c-4d86-80ff-08dd6dd57edd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Pfucz8DxLv6zYa7CwecTBqAhp5FIx07u2Ri41AIloBwqwSo+v7NYsv9i1Q69?=
 =?us-ascii?Q?oALKeBymgYbz5u4As9Q7EyPMMFw12eGsVMK1R0HkfSjyEt8Y8LEID5Q2lygD?=
 =?us-ascii?Q?9k2VzmSOOPlUwqvWUg4GOSAr/oPe960SnjmZIOFFd5R1e+QlZYXemYr02xke?=
 =?us-ascii?Q?3v6VHKtwuD7ESP3dSgR9WjlMZrd8XFSiJZJilz+4ILOq6z8ZMq8QIkrI9smN?=
 =?us-ascii?Q?llrSZv1jolhYDsrjkkiEzs8P+59o2tdXDCVi5cvrHJnee5xmbPaZSInaAhO+?=
 =?us-ascii?Q?y1GdfFkYxmclybi7KpR16wh+lzaaQIjBwWa8mGsliI99YnZVWFlKiTEMFG7z?=
 =?us-ascii?Q?4G6PtyzYt/lFzaEF724EpD/eE5yw/r9Kv8pA+RlwDg2Nk812VqRPOD8RgE/L?=
 =?us-ascii?Q?oqJCiGggvEueF9iTZXipqFDysQlNSzdXobpvz1LemVJ1tAkYh2My4k9j/w4O?=
 =?us-ascii?Q?FfnqLSPo/k65glCmICs2ouRF3SH1HA5qE6gFY55KogQvoeJnNRiV9G5/dZk7?=
 =?us-ascii?Q?DCrO3iOIYiWDWsmz8YJrxDCT2rFnNL4HLpiVYYmPzCDIMQmCqHkZmUhWzlRN?=
 =?us-ascii?Q?jppsc960sRtsjWGx6ORvP90FkLc0N8JA9aKz6XbTbxoapbnCG3NdCsssKsEI?=
 =?us-ascii?Q?EciZ3IJ+VZeiXJDdTaEsNgDAMDaPYsk67ZPTnV8AcjbnU+eVJF75actlkMLt?=
 =?us-ascii?Q?pUAFFjzRVgisp6+5J4FSIXMvyW9Zslm4RVoF3Uwc4DVzUDbEF6ZKnKZY0QiY?=
 =?us-ascii?Q?sxnO43Q0xIdour79SCxD52UKevs2u+vA/eXDFAI7/iq8a4B3oGNAvdCVPrSy?=
 =?us-ascii?Q?oXF+3Nfj3wAXJS6beuh97N9lHsfeSCli0QIfpYh44aqCL3J+NvTyaCuwMCtm?=
 =?us-ascii?Q?3JRPZVU7EPB7dpBdiySd/IpeVC1gqwOur54kP8Azy8H90eE4NqMek0Mhld7t?=
 =?us-ascii?Q?aWwnf6a8PVceAmjqm5WpkEHlEKEInosfC6xnrMLQn/szMibuse2NelbOx7Tb?=
 =?us-ascii?Q?GCu1Hx4qoPOHQgaDC7oWUwVSyZg3qWXsL9odMLJK7qYmNLxRmzc9QSTXMmWY?=
 =?us-ascii?Q?3pPnk3WLuFLO+lnuZYN5oJNYTW/tJitFIWqJbLc+HZCCk34VFm/Ktr4IBu/N?=
 =?us-ascii?Q?hts0Q233Q8iuNhypScenvyWIpRf0+lJ/BWgNCDXpYeml61k1qO8yYAooqvX7?=
 =?us-ascii?Q?sJw+SzCWHGarq450KxSuENHP0eylOwq5WuLPJaNi1bgJOzm2ZB+yDl96NeEe?=
 =?us-ascii?Q?OXJTHQ9IOOCrruTvSJZ5u1hfLSudNsB5TVzNRlkbsGN+HQ5XFcHPbDqulnrh?=
 =?us-ascii?Q?zTgt0E6fUuncF3V6x0RjR4imeKsw1AemVoKLnu8cx9CKXsPyJg2I+xAa9JXz?=
 =?us-ascii?Q?xdny7WUGgcKNpRiuUDTE0QOSXcvd2ONGORAelVnyc/MKAryqDfEmBKozizX9?=
 =?us-ascii?Q?M2piM+sXXJkaEOlru2RqPt+g4WhKSwWJoJS8uX6vK6Ptd0HtDSOChiDSNxHk?=
 =?us-ascii?Q?s089ga6/VgjNBsU=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 08:49:47.8668
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12a666b8-590c-4d86-80ff-08dd6dd57edd
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E2.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5105

On Fri, Mar 28, 2025 at 08:12:58AM +0100, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL
> 
> On 28/03/2025 04:13, Guomin chen wrote:
> >>> +> +  cix,mbox-dir:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    description: Direction of the mailbox (0:TX or 1:RX)
> >>> +    enum: [0, 1]
> >>
> >> Respond to comments or implement them. Previous discussion was not
> >> resolved - you did not respond. Sending the same with unfinished
> >> discussion is not way to convince maintainer. Opposite: you will get
> >> NAKed because you try to finish discussion and push your patch over the
> >> wall.
> >>
> > Sorry, about your previous comments.
> >
> > As previously mentioned, each Cixtech mailbox controller is unidirectional.
> > Each mailbox supports 11 channels, which differ only in their transmission
> > methods (e.g., FIFO, REG, doorbell). However, the transmission direction of
> > all channels within the same mailbox is fixed and determined by the mailbox
> > controller itself.
> >
> > The Sky1 SoC contains 4 pairs (8 total) mailbox controllers. To identify
> > whether a controller is TX or RX relative to the AP, the driver introduces
> > the 'mbox-dir' property in DTS.
> 
> OK, that's fine, but as pointed in example - use strings 'rx' and 'tx',
> not numbers.
> 
thank you for your suggestion. 
I will use the strings 'rx' and 'tx' instead of numbers.

Best regards,
Guomin Chen
