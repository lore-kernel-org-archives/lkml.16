Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A422E3712;
	Mon,  7 Jul 2025 08:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751878079; cv=fail; b=mo05K6TbTury2tBhKWO1aq8S9PJX0oXELI4n/tC7wOyxNmp4LThhWtT4br1hQrmzrC8+L38HYugIK9mjcTEF57RDTGBH/L+UdIP1tMbyP1DUtCsTTKO/vEJpn/AhV0kXZ4qMrTjzLAio5L/sZL+Jal10olmy8mGCQRb+LBthnys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751878079; c=relaxed/simple;
	bh=7Z/OthZK2yKYynJgoprFE1iAgCiFGtukwddwAe5lH54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aSvnhwctLYH2gcm7R+naF/eEqj5o61Lfy2oajpsT4+F4T3CV1aRpiteqGo0cDVUE6oqo0ecYrwA0mb8Yq2UPWK4T4691JCE08askxj730P8945retLIbtwRMoqakyeFAPptaVX9BHnMGzpihbd7G1TZTXJj4UzYC3komJAQ3vtU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=O56uU6+f; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=WrZ50lBW; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="O56uU6+f";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="WrZ50lBW"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567707lh015160;
	Mon, 7 Jul 2025 03:47:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=9G8Rczujv+w69k0Cg5
	IY+elXvdofmA0vVULEzTtYSgo=; b=O56uU6+fEh6cLcZtY0x8ETwlmY22sy/Re/
	Z+vyNsNV3KtccvsVhFhwVUUXLWX+lEVOzwtHWUNwQH+mhb4VCD0CJ2RNcGEvw0uS
	PDm52tmgQZewxBL4wriRdZaUXzK4vHjIPWIMQx1fK9WMzHEZmNj2fsARBtu51/ZR
	IQ+BEsJnWPJEf3kocvBNlHtgIumnnHZL9SxR81ADfaVSaW+bqikX1UVDkrbXYfVX
	s5iEAqbEpY/vXkzashcxcicFdXAzslZtEPPQ6kd1XhhrJ1hTrH8vMreDKWGPTsDj
	xrHectwelx5/+gRQ/gTjjRlTNwmzzb9BXy5woPhCLOAHoAJHJkrw==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2095.outbound.protection.outlook.com [40.107.93.95])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47q1f3hy9q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 03:47:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AJT2U6HGawQbVCewLtT9TghpOktTZljIXLMRPk40UvX9MXKZ4xhT2LaE4C1IHqmOjMi/v/ASiwjSlB9sysxeFdUqAlpKJHGSwvY4vHLs3yPKuPVsniIoyAgbgvQygnFDhJI9sgVgUSCZe1YTIz82KN7iHbrGqeOUFLEAOFGt53GErA6/BnXE/2q+QOGbVjmgm9Q6OvT//Z4E5QAcSfJ4G+1mAm+a3/PIePpgnO+diKIbfhGa5uTokHDea+rg4AXkqY6J4AA66UJNY8ZhSs38DoQ03lxCBSYV9YNfnbEQkbGO0pDnu3JrJu9OILgnhSHDc2S8mVJOsBymhlqAIvsCvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9G8Rczujv+w69k0Cg5IY+elXvdofmA0vVULEzTtYSgo=;
 b=DVma5rKzo8pf22upy8WQb5CvT72BmnS5tKm9rPUjUVKdHU1zSvEF/aBaX6K4ZkuJuTL6qyh3dcbu/EzlJ2z4rQ4Bd1n9RN/72b+ovtJfR08LYPlIBVORlX4v30tBrG71GdLI/tJn4QGEh5GVOJfBwHrDqx6t10j9bB7nN/ZTpxPiR5c434xHT4fm+D83xcwk/Kr8lF5qxXO3rLmanKDBhM96wc2MhKwsyOD3vJzuK2836cLMUKJCnot1yRRDuwhZDra/kdaQlOxlfBMh3XgE8Edb7bydI1O/CXZuWAVAu8fudtB61mY4lyTp7xtPT4k9s9DJz5nmGAdHa4C6LBO0+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9G8Rczujv+w69k0Cg5IY+elXvdofmA0vVULEzTtYSgo=;
 b=WrZ50lBW0b7xzJ2VJ8xL8yCTG0kd8JMHyvq8Xfv0OPcjjvHGfSqgis2V57LbkVXwXh+J9c/optmayslTyCfgfpS88mGqyFKrOikTR31jnJe1PC3Xgeh7Y99I4bTxsqJLdMiRQyk+kxw0QQPcise8O+VUS0CbWkvuuwTn3S3fz2M=
Received: from CY8PR19CA0003.namprd19.prod.outlook.com (2603:10b6:930:44::12)
 by BLAPR19MB4161.namprd19.prod.outlook.com (2603:10b6:208:279::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 08:47:40 +0000
Received: from CY4PEPF0000EE3F.namprd03.prod.outlook.com
 (2603:10b6:930:44:cafe::ce) by CY8PR19CA0003.outlook.office365.com
 (2603:10b6:930:44::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.27 via Frontend Transport; Mon,
 7 Jul 2025 08:47:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EE3F.mail.protection.outlook.com (10.167.242.17) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Mon, 7 Jul 2025 08:47:37 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6E109406541;
	Mon,  7 Jul 2025 08:47:36 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 57F24820249;
	Mon,  7 Jul 2025 08:47:36 +0000 (UTC)
Date: Mon, 7 Jul 2025 09:47:35 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>,
        James Ogletree <jogletre@opensource.cirrus.com>,
        Fred Treven <fred.treven@cirrus.com>,
        Ben Bright <ben.bright@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH 42/80] mfd: Remove redundant pm_runtime_mark_last_busy()
 calls
Message-ID: <aGuJp46/SqZgEPm5@opensource.cirrus.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075432.3220321-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704075432.3220321-1-sakari.ailus@linux.intel.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3F:EE_|BLAPR19MB4161:EE_
X-MS-Office365-Filtering-Correlation-Id: 47c72584-3f73-4c2d-18de-08ddbd32ed2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SoIdj+zz7wtgxB+A3opETcBn5kj1NR9OM9W1Os8wJC9k6PQ1A+oZQdbnvlJZ?=
 =?us-ascii?Q?4TSRsDlLxKtOk5h2pwAbA94ckZAwiJ1bLDAVb0QmDT+RYWy9i2pFBLx5vHWu?=
 =?us-ascii?Q?jYTiAs6FUORjKMnyWANsCp8c6KSCZtbMXINslGx2roykAsfGc9pcwf+zKQyg?=
 =?us-ascii?Q?8kIu6eqRmm9lgYtiWt7t9q6m8tocE1vpVDDv8EoTbtKMLN69GTSzjezAlXl7?=
 =?us-ascii?Q?WZ2O1PrvGPLmQv2nJMHJ96033V9n0XO7y9dyZ7vXfa13W+BNTiNlqIdVC8xg?=
 =?us-ascii?Q?PPnRA/n/IK/0zLJI8G9mXNpU2UCAZjHDaE/qdRG+fEt61QXYJlYBCHlWPpn7?=
 =?us-ascii?Q?i+WSF2Cw0MxRp2jEioZoD4F/6QJZMbtZL+faXNTrj1PvO/jSZ3iz1itVeSVd?=
 =?us-ascii?Q?PBVMiGkVcrPBxYI6ESm7QlKp6xanlTAbH3CRrIkG69wJJUpN4+w0prWK6YHb?=
 =?us-ascii?Q?eIYHjxTSV5F2V72+pvbwUdKv+fgvoQcO3PzRBRe/dpYOd5rP6oeA/Icj4wBG?=
 =?us-ascii?Q?+siYmM6dHPSKYbKcYmHeIJsUKwxKNA9NZUqywy0iOVgP6JJcbc9I9i1blOFe?=
 =?us-ascii?Q?hR3XscFc/NXKU7TEXC3xzkhiV1kojwKPzeaR8Suv45tq07cQLOWJUz/QeyXJ?=
 =?us-ascii?Q?QDrqVkUl+o2qLLhyh0sTGe6vDZ8enUXMK2dmQYMMum9yezqRHtshuSCWqY+J?=
 =?us-ascii?Q?2iFx5hDKcH6lneAyOC7gH0Dj/R32s7mbLeOAPFXhGH1DBH5nD3YZJpOJHL1i?=
 =?us-ascii?Q?Twhc74ploO2qBrpVtGpW/jojd91UsR7JLUU0fc1ovmXGK7Xl1UeaB4OWIqzo?=
 =?us-ascii?Q?W3svVvWKBm7zUjovLXSGjcXk/Zfb4/MxoVwt55P8IWopsdi02K99cqRYazNZ?=
 =?us-ascii?Q?2lFPsStSopRuyvoEPuVVrRHb6tBffn6svjaNXAmEalORhGy3fz+MRw9LEkwz?=
 =?us-ascii?Q?vnHwrm3gYZvE0tUddZsEHSb0RXUf3XFUEj+CsNw2eD30vk9KMjZOcQ/Hjh/Z?=
 =?us-ascii?Q?uTuZIMomSjdgtK47osP34YlK9CWXHa76LjzjdR/eUDJsU0vonyaFuDwXXEJ5?=
 =?us-ascii?Q?WoVLqcTQGZL3c25kcwsa9oMpPKN+W7uB4m3HyhZnkGrj8l8K/nQpIfbIqmpj?=
 =?us-ascii?Q?rukMAZPfTOrVgoeg6kPDsgYBb2OX8ig2umL7o3aty+IOEu9fcsdg00m2zmja?=
 =?us-ascii?Q?GDPPwkKe/n7DYEAF8dkUB0NpVWtrZAIJLNFrgvneWfAhVwtEcbhrGMdzgduF?=
 =?us-ascii?Q?eiCU0jYI8AGmSog6eoSkCRAIWA2m/wWjBK3jD4YIf2mFZKd4luLET+IgWARj?=
 =?us-ascii?Q?lw7V7+Dbsv0YP9GrGkeuH4ST3J8r9YS8fv+mRR07S5/UBRpTMz+KTNijd0oO?=
 =?us-ascii?Q?D/4sveZ3lg6Tjj9gecmG/fbRMqcbGgg6lB1EnMyQdkHCymesNQv5bkreieSY?=
 =?us-ascii?Q?75OzUMoG1HHmxRiNB6i0eWL9mE/UPHsPfYbQlBFenWt1Zlc/nL8c9ICSqgQr?=
 =?us-ascii?Q?nXlZbvMCMmfw47E7/AWwABoTTVhK5yZdkodh?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 08:47:37.8479
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47c72584-3f73-4c2d-18de-08ddbd32ed2a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR19MB4161
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA1MCBTYWx0ZWRfX4DMliFATaeb5 ovx6R0iGZl+kSvek6VoTDgadnR9Nq0cyjgieYNZu3GyNEa9Cl1Zx/6/Uvld5/vC6I4bkemRpYwE lPxYutOhe16Yah7PE/c99gUESUJIad1RZxM6GT3eLMHGSDfX3vCHTtNlBb9FnVEqhT5yxr+GpBs
 yMTgp8R9w87CtivytvY5X0EwKfbc3IaYCzzHl8xgZAR8oz199C0rv/qkrCMpn5u23+wA9u8kmLb oPUP12npME3XFossjnTIHI9tA567Dx+cURKa1NIDh0qB7cvvFO0RZBhDa0ofNAkFwXvs6eHjuGA RmxUPioK0SpEJfq+8hHaF4Zo5xPnLwocgrN+X97YPgnfDY44Y2v/wBMY847r1mWuC1Im3f1KHK9
 o9hJGhT9euK8aLGhbY2zHqWs5k1jkNx0b9vpGyilQMmxIw3W6mjz8/9chWRIOes8q1Mxx/Ch
X-Proofpoint-GUID: zVf9EXzjgU7IApvVzSo-EqdQ_P4YMCa2
X-Proofpoint-ORIG-GUID: zVf9EXzjgU7IApvVzSo-EqdQ_P4YMCa2
X-Authority-Analysis: v=2.4 cv=YNafyQGx c=1 sm=1 tr=0 ts=686b89b2 cx=c_pps a=DIZmGg09oD0WH6Bj2PzylQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=RWc_ulEos4gA:10 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=1o9rHTwwO8bpjw7w45cA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Fri, Jul 04, 2025 at 10:54:32AM +0300, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
