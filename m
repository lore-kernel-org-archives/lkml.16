Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023092.outbound.protection.outlook.com [52.101.127.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8FA22D7BA;
	Thu, 17 Apr 2025 08:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744878289; cv=fail; b=C2SbUNtBvGw/SSZTDEodtKcWXdemXD2XRNd8nk8DZExBsWoA7pyZ115ouhYlcsA2yVYCDun0mrCORGOAqORuIZi7eaf0TFHAPNo1XYlKhsPBeoXyscFG3fnh/Qyrx9Sjsp1NWGcdT3jAo5bWeTGIH0JVMpWqg9x1uormjKrPNxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744878289; c=relaxed/simple;
	bh=dli42XGPqK5fJTP8Mu+ILOHcqClrs0m2TP/uLd+wCMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d+iuxde6S6UF/3MYEOBfi6A9PxUNECGdEeiziC9929lRZGRNSxd1cUJAb8bkM+cS7YIX9wMEoz4U3zqNxQ6znmzIg8k+ziQ8gH0fS1Tktag+gWHmFA9Bv1nsLxVgFKmF/e6tq/+4KzzTmdw0C1ny8glDBRvnz93iEJQbd0cgx6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nHsq+OKE1svzvzcFlg7+yovHYlUbImDCHGyMhvLFpgDzNoZq00w0uSCg5MSeP2fzWvXvfpbjjpfZxruktDzf7wbwHpZlMPVUajAL+Oc0qXZ3FO8CtIfQVk+FK67VouHv8IohXNLkGZ9mv4cFuOryg5n+cRIdQtD8vU+/TwL8Q4J3jsYvk4JQn8nHsYWJ9CN8MMJUwmrIJZa9U6gVcfq1KM89us/j5qa54rPx5RSk6A+xAb8Gb/HvIlr2JZITtXvNAhRtQrxivGfqxbWesdSFi/uAV6+fA8SQk0E51DhdxTKes859CGM9ZX/Fv4+h4OvWIEroQAxHCIMN5MXD/HVPtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0+3axhg6wpwFtwVrZK4tPqjbKFcgPMltM/8+QVmRwk=;
 b=kSbIBdJou/fHppeBHfV1FIEAJvqLLxr+znt2Ku3+OOyGg+6psf+230RpEihvhjx9exf8Wf9MQU/gHXhLIvPcbZdVi3iOY1dKBEN7zKBipPhmo+kjFTPtS4w/z7ih/CY0Ar4OYD3coOmBMjTSQZ6UhGtTJemDKunGjk2dJ4SnPiAXdaHYl0J9rK5aHpitrsSz4Wu/Jz1aWs0LdbIC3Dx/8NDjtrGMV3mdgLXd8JBzfIfGBcUlJgyZvXi52s2PeXuNcy6aszWrXEf68xVQ/2N8ziH+P9UWcgCVYvJb/1uuuhPn5hnXPzZ1HIc5vtjeNu1m0+wvMtYtTnUDaWgPvhp7kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SL2P216CA0205.KORP216.PROD.OUTLOOK.COM (2603:1096:101:19::15)
 by TYSPR06MB7297.apcprd06.prod.outlook.com (2603:1096:405:96::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 08:24:11 +0000
Received: from HK3PEPF0000021A.apcprd03.prod.outlook.com
 (2603:1096:101:19:cafe::7d) by SL2P216CA0205.outlook.office365.com
 (2603:1096:101:19::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Thu,
 17 Apr 2025 08:24:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 HK3PEPF0000021A.mail.protection.outlook.com (10.167.8.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 08:24:10 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 206804160CA0;
	Thu, 17 Apr 2025 16:24:09 +0800 (CST)
Date: Thu, 17 Apr 2025 16:24:08 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	arnd@arndb.de, jassisinghbrar@gmail.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
	maz@kernel.org, kajetan.puchalski@arm.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Fugang Duan <fugang.duan@cixtech.com>,
	Guomin Chen <Guomin.Chen@cixtech.com>,
	Gary Yang <gary.yang@cixtech.com>
Subject: Re: [PATCH v6 09/10] arm64: dts: cix: add initial CIX P1(SKY1) dts
 support
Message-ID: <aAC6qM1LnNZnHrCI@nchen-desktop>
References: <20250415072724.3565533-1-peter.chen@cixtech.com>
 <20250415072724.3565533-10-peter.chen@cixtech.com>
 <74b9fc25-0815-4ece-845a-5f730c87fe78@kernel.org>
 <aAChkWPn4ThMx44A@nchen-desktop>
 <b90c05e9-feb7-4569-b79a-b623e535c1d0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b90c05e9-feb7-4569-b79a-b623e535c1d0@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021A:EE_|TYSPR06MB7297:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fd984ca-5243-4fd4-7cd3-08dd7d893aa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W/nS0gD6qWTNMcUx34FXSjpsO5mvTDHwbcdstuqs+Wd0QQv/du9hztrueHWW?=
 =?us-ascii?Q?NpxpYkyyGHmqZltmMYTDDa4uxR8twlMUiyuCQ/KC/aIM0BAPmrWC9DhkzED1?=
 =?us-ascii?Q?ceTpyemU3wZ+PttaBOOwzs1ekZjkt6pSJOr4FMi61WvKbdhOPJ5IRswTAlCC?=
 =?us-ascii?Q?vB2xWBuIFx+aefDfQ3BYHFqbgnAP7t4wfGXzz3UciKdyNS37S08GM7Xnp4tI?=
 =?us-ascii?Q?T4H1tba/c/YTt/ugWm+NqNsqo8pr6zP6eItjjTmIGhGi4xdmfPY3eqEM6PcU?=
 =?us-ascii?Q?HaG+JbsRcXW/N1Q86tGfWM2URfVFTvF543+c1cdxjmeXqgWdHnwA/vZwj6N+?=
 =?us-ascii?Q?hFjqYefd59XORKmTUf0+LFGU3qsIDoslqoy/u9bpWpdnJNBor4FV4K8DJbDC?=
 =?us-ascii?Q?CuE4lFpsb0WiJNwOuB13cfzIF35BmV+WE0wb7JzbHIgRDQqlYgc+nQ2vq6X3?=
 =?us-ascii?Q?puNDgZ2dUBosU8+qijdXY6q1r+N8LLU7Xs16nk2Odh3an1MdyFS1ojawP7Ce?=
 =?us-ascii?Q?NvFY8yWJkP8cikqrwqZS+QVxlJk4ic0OqT0u7nd1deT0RWUXgFAzTmpJhgkX?=
 =?us-ascii?Q?27I+Pa2om6zLyyZgx8IGkaqBL8oB4Ua5uPXXtqCTawHeSXJ7lCR2PYzFVQdm?=
 =?us-ascii?Q?ZuX2ZRCA/SPU3MZ39RIa5aw/4rWWbTm5lVMAKAFwwVT2C9vnRivtqtUbvPX9?=
 =?us-ascii?Q?nLFO/hRtOSyI3f2dJ5z1W9q5ei+l5zOMDz3G36ora4kTQQy1spyq2jQaVXk7?=
 =?us-ascii?Q?PTFPvSr8sHTlVD+VqLkOUj2Unj6hEiH5IVIpxAizg4jTIQV/IHRx+tTsucyP?=
 =?us-ascii?Q?VrWcltg7NYMqrUBC5WkjLV3NtroWddpLG16LPXEAg5IFQ88AREnobeZvj4Lq?=
 =?us-ascii?Q?2hup36Ctz1+St0Jmlzdgu3qcBdri6q1b0jN2LDkaucBhQL88AtH66zYuAl3k?=
 =?us-ascii?Q?QA7GUaXzjlVes2jchk9f9dn8Ns3MymaXgQC7NcZADTcNOpwo+MItpJBbLfpz?=
 =?us-ascii?Q?XU/iJ/AkEPVW43hTc347ttotWK4r4FTSniZ2JJpWLWqF1g+GIEEJqkjJydOz?=
 =?us-ascii?Q?zbYQ2YnwqkQ9sdaDy/jabvYmyEYxAJxqYk42bcWmIMsHYKJGebzfoxFUaLvU?=
 =?us-ascii?Q?slfZJd0fHpCnxKaa9znEpOshc8nErJRmi6KVpii2Z9h7ds0+hrUU0So3dqn7?=
 =?us-ascii?Q?ZXoOSJHVgTdnnYKmjWEsCVgmQspKGEmF07V55Ix+/aki/PlAP9n/WGAnZwGY?=
 =?us-ascii?Q?NhpjFKyYW0nEXHIDjiyfwhsWwebEW8JeDGAzbuVa7GNdALd+RNqFC/Y4QQac?=
 =?us-ascii?Q?b1wcfTRN8NHIiJGh/uZofUqlbDr15xY6SUJg3kwEJUckGGaY2p5t7/Cj0w0w?=
 =?us-ascii?Q?YS73eK+cFnhU6DAibAG5MgsmV15hwDDJDuN9+0H/nPwRAP94V7EJatw/fAtW?=
 =?us-ascii?Q?y/KsVl9ExxpYfv1Ue3yvjZ2oJ7u4aJKUJ0z0zg59sXSB7kqWWD8l50R1mVdz?=
 =?us-ascii?Q?GsNZcBWy4LiMzUkpnFouIFP2SwLfDJNABx9m?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 08:24:10.0462
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd984ca-5243-4fd4-7cd3-08dd7d893aa7
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: HK3PEPF0000021A.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB7297

> >>
> >> On 15/04/2025 09:27, Peter Chen wrote:
> >>> +
> >>> +             mbox_ap2pm: mailbox@6590080 {
> >>> +                     compatible = "cix,sky1-mbox";
> >>> +                     reg = <0x0 0x06590080 0x0 0xff80>;
> >>> +                     interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH 0>;
> >>> +                     #mbox-cells = <1>;
> >>> +                     cix,mbox-dir = "tx";
> >>> +             };
> >>> +
> >>> +             pm2ap_scmi_mem: pm2ap-shmem@65a0000 {
> >>> +                     compatible = "arm,scmi-shmem";
> >>> +                     #address-cells = <2>;
> >>> +                     #size-cells = <2>;
> >>> +                     reg-io-width = <4>;
> >>> +                     reg = <0x0 0x065a0000 0x0 0x80>;
> >>
> >> Messed order of properties. Keep it consistent (see DTS conding style).
> >> Other nodes also have oddly placed reg.
> >
> > Thanks for your reviewing, Krzysztof.
> >
> > All the nodes mailbox and shmem (in mailbox) are on the same bus, so
> > I keep it by unit address in ascending order like DTS coding sytle
> > says. I think below rules are two options, isn't it?
> 
> You speak about nodes I wrote about properties. I don't understand how
> your question is relevant to my comment.
> 
> 

Sorry, we will update the sequence of properties in node.

-- 

Best regards,
Peter
