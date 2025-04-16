Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2121.outbound.protection.outlook.com [40.107.117.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A455F18C03F;
	Wed, 16 Apr 2025 08:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744793330; cv=fail; b=cox75yZyO6nzaFbe4jfp219PO/LEXVqCMXKiBpdU78lSZ6x1BvCWmT5H0qHP7IOFLz4EWBvqkrx0U2Rrnl9qev4ZopcYR0kje3tJkUXz+SNDrMNGmiooP+MS26CHxHeDkviNRKGIIpwPU21jRih50w1MhPCsg2EEx2g5CN6KVyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744793330; c=relaxed/simple;
	bh=Y6ymt80yPmqlLCJG+LGFyYzulAdaAv8zS3I1xw5m0s0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=akraJWsfDadubTxQN+HIyw/cdmtHDu0ttXiMzJvx7vcV5rQrwDTmKjGHd/3Sjz70bVVqREMVHbaaUewZf9E8yRBz4whj977JHjAqMX/Q8U7ZHVkMJkZl7tqqW6DCdCjz3qDjRibFhyxGfz15rsjP04h2UaBlOOSNZ9420TTVPbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.117.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QlN+MhYTWofwXWshDS6Rlg0196mXzK/ikFIaQbGjNNPlxbZczhh0rcteXpsBD4KxakYzPZXSz38tuH6n01iiyh48XRA3mTBsOyyccNC6xh01B7HQ6Ed3JrPGOUzBgJnNA0vCjXKd+DJtQl2zEeNl6Bj/pi2Q3AoJDQJPAa0kpgSsS+5cGz59QsNmEirZ7XMI49D0E9y2io8iy6SOYfkySCk8Pq2iNiNrADJU9hyCqNhySWBLGVg9YvnIpxt0CvASuT/I6zQcesvFgB9P+wbQoTNHuXkaaVMGoBrK0rRqU0wJDOLUmYfVf87P4u05s3YdZY70I/8cmjaECibl8dB7sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YxHiQ/6rELLytBcC4EM9lgb+6R9rAAbcjj79G7BFtF4=;
 b=aKY9ZxwWHmc86G3QytoxyFavfpNwQdu+gXfzXmFK6sGYsJ4FY7ZpqcmVqqU9+ePELyLk2qQsTZ6W34TsrrffjhqzT4y/beqEkT837W2zmAsxw/fjiN7vPi71LlWcr22xKTIkp6k9bedxwzvnssQDZ2U8z6JmtLrC4QzVI88+TOQIR8z/q8oFU2SCalCP5VA7iBng4TziwjNGRXhNQatNzd3a6JsaPyimH5IHi4izqgGaRC6OFVnfTzkFlRieEqRAS9T044nqeN/eWgQ1T8rBoUaRf3CgWjnWadbL4vvSGw5wEmk5AM/UtLekYgeNxc8wVOh91QDYUh1Shvk1Wb+vBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TP0P295CA0050.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:3::6) by
 KL1PR06MB5883.apcprd06.prod.outlook.com (2603:1096:820:dc::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.22; Wed, 16 Apr 2025 08:48:39 +0000
Received: from HK3PEPF0000021E.apcprd03.prod.outlook.com
 (2603:1096:910:3:cafe::be) by TP0P295CA0050.outlook.office365.com
 (2603:1096:910:3::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.15 via Frontend Transport; Wed,
 16 Apr 2025 08:48:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 HK3PEPF0000021E.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Wed, 16 Apr 2025 08:48:38 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 305E5410F606;
	Wed, 16 Apr 2025 16:48:37 +0800 (CST)
Date: Wed, 16 Apr 2025 16:48:31 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	arnd@arndb.de, jassisinghbrar@gmail.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
	maz@kernel.org, kajetan.puchalski@arm.com,
	Guomin Chen <Guomin.Chen@cixtech.com>,
	Lihua Liu <Lihua.Liu@cixtech.com>
Subject: Re: [PATCH v6 05/10] dt-bindings: mailbox: add cix,sky1-mbox
Message-ID: <Z_9u3_jsQFfWWg8i@nchen-desktop>
References: <20250415072724.3565533-1-peter.chen@cixtech.com>
 <20250415072724.3565533-6-peter.chen@cixtech.com>
 <47583cb5-d211-407c-8b7e-d79934a90b28@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47583cb5-d211-407c-8b7e-d79934a90b28@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021E:EE_|KL1PR06MB5883:EE_
X-MS-Office365-Filtering-Correlation-Id: ce8b43ba-abf8-422d-23ce-08dd7cc37b30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Wo38v7HLJFGmBBOJV59ch1SdOuoIZpgkn8CPhyF8q2/bXtuAcwU0xKPD6xY/?=
 =?us-ascii?Q?EeNO3gImkdUHiLgWHPEo1EQ/MWqp7h+TzPimE7fe8Kfv+xQI2TWc45kyn6/E?=
 =?us-ascii?Q?aoKOFKN2vBQuVqhcpT7O46Sv0cNzrhVryMMfaO2CHqxGyZvizF+2T7eBf8ev?=
 =?us-ascii?Q?VkZUXAMZ5cySRwgaiF/9StMbxzUTP6dzCFhLvMmku5lOseVv8vt+DvWHSAWQ?=
 =?us-ascii?Q?Dn85jxgq+K9i598S5Yvr4nCyk5MiNBMvEkFNPiEbZBkdX/vYwjofLAwlI/BL?=
 =?us-ascii?Q?emdTDYHyygfBBJRraNdE9Bmwrz1R5/Z5WQoZ6vcZdo7pG8y60NR/XHcQdeWR?=
 =?us-ascii?Q?uXxPx3UYwpipk7bxZnxRHS88P5nNCf1QM06ogNr1tQZuWw8SZdkMwyvN5rvi?=
 =?us-ascii?Q?F5gJcdfQPHzNnYjLMw5kc9Q3OBAF5I1DkpFJL57PDzKbVXp5dr/VtOuBej5/?=
 =?us-ascii?Q?NGqr3Is+94mzVf9phWtbOl0GgE12Jr+9el6vR5C7JvIkq1VC4IgIoSDJI7dt?=
 =?us-ascii?Q?iihuUVzO6clD/gewB86uvIh+24EOD9s7ZxomvfQNY4cuyyikdgtObtR+Hel6?=
 =?us-ascii?Q?moV37hs0fnBtyZCeY0k2S26FOP6U3t4L1cEJYMDCVMGX7yyOxuT4pmWzteYf?=
 =?us-ascii?Q?iIeHrthkZgprYFqaAcDQVZQSp3GQMtRYMbktOtl45ohyGrbkjAenVcheC2Ln?=
 =?us-ascii?Q?akjAYs9OCrZCf3apb9EftaItEMq6m2WQ313iEuF6k8Zzkxsk51aGJq1sI94i?=
 =?us-ascii?Q?paHyngnHaFSGwm6UatMfLFBAM8avMFndswKgPzwNfOxUdYQJGyQCgTVH0SMz?=
 =?us-ascii?Q?OwguIBBK7ySU6RG/xB5QrhRj7xg5gcNqRJeTI5uy929IbQZlufSzvGMUoCJU?=
 =?us-ascii?Q?Rf6+rzI+EI+ZLG3mHesiyD/vt0R6QC0349qhe6bagsRejeF/zv1at39qQXRS?=
 =?us-ascii?Q?Cr5Z5wGTxlcwqvYuXHTJJEEKOPzA33JX8kRZpAE6zZH3E4FgxqHTdGfI4zzR?=
 =?us-ascii?Q?/zhyormviA/WGbB195m2HDfPCVZEXTBlW3OJcHRlJP5r7SKEDNzMICN3v39K?=
 =?us-ascii?Q?H5D6hCWnkbnfEfNnIMelWUgUprQ3nUQCG39BZoZKWnKjkjDOcop7yFF6HHpy?=
 =?us-ascii?Q?vofpsn6o8jS+CQEsI/8ZgoVnUFcOMMttvGpavVs6fvpRk7UA12wVqu/jD18M?=
 =?us-ascii?Q?07ZLaeCuHd4mMAbxTmvQz8C2WUfSs4SNsEq1P5VpmiZ1YSmdvTRdl4788wbG?=
 =?us-ascii?Q?jTx4Fm1hHwvMniku2frWBEeqaeK9E7QCvXGP5J7o426KJPX3b0BtQviwQzVV?=
 =?us-ascii?Q?ta24qhvqvdc/i32bxBJZmS1tGTKIBCXtVZdzxg9UcIZUY2PLcPbH5ZJZiTZd?=
 =?us-ascii?Q?iOBzOhuTdlDmehsywyCDym7f2iy0?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 08:48:38.1353
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce8b43ba-abf8-422d-23ce-08dd7cc37b30
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: HK3PEPF0000021E.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB5883

On 25-04-16 08:34:32, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL
> 
> On 15/04/2025 09:27, Peter Chen wrote:
> > From: Guomin Chen <Guomin.Chen@cixtech.com>
> >
> > Add a dt-binding for the Cixtech Mailbox Controller.
> >
> > Reviewed-by: Peter Chen <peter.chen@cixtech.com>
> > Signed-off-by: Lihua Liu <Lihua.Liu@cixtech.com>
> > Signed-off-by: Guomin Chen <Guomin.Chen@cixtech.com>
> 
> You send patches to soc@ AFTER you get community review, not during.
> Look again at document I linked some time ago. New files are not sent to
> review to soc@.

Okay, will delete @soc.
> 
> > ---
> > Changes for v3:
> > - Replace the direction attribute of the mailbox with the strings "rx" and "tx"
> >
> >  .../bindings/mailbox/cix,sky1-mbox.yaml       | 71 +++++++++++++++++++
> >  1 file changed, 71 insertions(+)
> 
> That's a completely new file? If you add new patches, mention in the
> changelog.
> 
> And keep the changelog from the other patchset. What changed here? were
> my comments resolved or not?

Yes, this mailbox patch-set has reviewed at [1], and added in this
patch-set due to satisfy minimum new SoC patch-set requirement.
I think Guomin has already addressed your comments.

[1] https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250325101807.2202758-2-guomin.chen@cixtech.com/#3486864

-- 

Best regards,
Peter
