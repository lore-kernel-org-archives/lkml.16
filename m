Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2841AC884
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 21:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738271101; cv=fail; b=NW50l9LqBYD/JAeXYcldZpgjFobsTxuiZ9EFXhWnefesMv4jm+16cUW3k+QaSHS4U4NfSa3d1LR+wupeGffw10AVlOzP5Fsln5/5wMDole6XJNd+HRlptzMLW4EN4FWgG6t9ZjptEUx8lP5FOQ+senBrJxLZmS4lr8qJ3QAZffU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738271101; c=relaxed/simple;
	bh=WMEjaC7U0dJF8SzKpH4FYyBcjQCEvMCboz+ALdF+A68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=t2pgZeE1edbP0kOJjQ7eyrwgmE8qMUdyzT3uPVPAysKpcKmEVyQ7HKzI5nqc9JltCfAYhGfX060J3a11csGBr+XFRkfFO/pQ2XJSGthuhJsGZYFb0s19YtHJwCwxzocZy5GBJ8h2mTXkGrdVB9iPdX4a2v/iRmq3RyC2bFpy/2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=S8cGsxqC; arc=fail smtp.client-ip=40.107.237.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="S8cGsxqC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kniby4vg9KEk+8lCFacdBM17BglUQmPwpCgvkrrkIBtfLwm8/Yn+9FIT4bkGCTSZeK+G8PMqdsdN4WFHSTkdDBuGh4M1fCGWf9tXYWJnr+hL8qyzwhAmZD0Dw3jB1OJzCzy0MNbgdd6tMP2Bgz8HxbYskOC7OWYF/FhWXqEf19VHxiMBk3KyWpSYYP1xgVhYknWsZqKK9cvACMgMgES40wicqMeeSjhMAYtbw9lgcvLOtc2hxFhIV986QC7PEOi+YrSNaD8llEtF/oCqrvABQ7JvGjbF4Xeke0QJwojc/f9SJ3Lb3JZz5gPZVlMKl6fNxeb9EJkGDWnOECMg8nO4jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bENlfjLu6c4VLehzfX2C/voaiRhMINFrWPrwOOd6mLY=;
 b=DMINyDqdpIhgIu+IxHSoPZ+eCvR0O7jDpGMd9aI8F08BF1AE1Nmlm1VllTKEvyth4JmyfNnlQN/DsYwTYpDouRyWOsnsQBK4pPYFqnPCxF9pFm2twbDJeIOH0YZhrFIztnV0bMU8MiKVkP18+1kqy41wEwY7kfzeIXhGY0NT7lBGKfRMhO/6f538hMdxSRO3kexaYPq4Q1SquMwf5tb/gai51oTly4HHwvyV4doRCOm/8XgEZcUP63xhhv7i7maxVSv2if3T34KzpGzgYU8CZp6loSGRfISDWZrlkKPOFUi13KaEJqR+eCs0kizjSYsdsMoncZOA0MLC122pwyahOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bENlfjLu6c4VLehzfX2C/voaiRhMINFrWPrwOOd6mLY=;
 b=S8cGsxqCOMGIrHBEVEuMVT/08YhnfjLBhtXJgG5XeVIKr/jp+7XsgLSek/PyUVLGHDUQjWqMhakZy8O7dIdjnikDF+lhRLMpBUc4f/kfhd6ucxORSRSGO1LIaDRMRY9oIpxzI7VaSQprZ6PfG4oVbBlyIeRjFNj2Aa+DRFvyS54=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6373.namprd12.prod.outlook.com (2603:10b6:8:a4::7) by
 PH7PR12MB6609.namprd12.prod.outlook.com (2603:10b6:510:213::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.28; Thu, 30 Jan
 2025 21:04:56 +0000
Received: from DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::12f7:eff:380b:589f]) by DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::12f7:eff:380b:589f%5]) with mapi id 15.20.8377.021; Thu, 30 Jan 2025
 21:04:56 +0000
Date: Thu, 30 Jan 2025 16:04:53 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] b4: Include git notes when generating patches
Message-ID: <20250130210453.GA615204@yaz-khff2.amd.com>
References: <20250130201331.73584-1-yazen.ghannam@amd.com>
 <20250130-rich-orangutan-from-eldorado-04f621@lemur>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250130-rich-orangutan-from-eldorado-04f621@lemur>
X-ClientProxiedBy: BN9P223CA0008.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:408:10b::13) To DM4PR12MB6373.namprd12.prod.outlook.com
 (2603:10b6:8:a4::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6373:EE_|PH7PR12MB6609:EE_
X-MS-Office365-Filtering-Correlation-Id: 13e6b48c-0483-43c6-a5e8-08dd4171bfe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5IwOaLi8J9ttqtQtxHwH0SxvzjL2msFWu+ZzO6csVFfgWWW6LpitMf284BNu?=
 =?us-ascii?Q?D9P6wc3cSehvd25oFxrf/1Jgt/tHCWoriCY0w6QxDLqNs47VBmS/YQqvj0QT?=
 =?us-ascii?Q?cQDQI9G3w8LbJZeaJiZipNC2FqyBeRrUVcsyDl0hrEYoCAy50gz8tSUXy/xf?=
 =?us-ascii?Q?NgPlqLOH7qhU8785fd+BxuhZ4w5uQSuE+BG4vG8BxT79sSlE4M2gussBHZRO?=
 =?us-ascii?Q?HhkGMtKuTX6GC15EUlrghFl1Q2U7jk4iYYMaspubuudlba5DpNuKM9CeTs4U?=
 =?us-ascii?Q?5JqZ2+RjLSRwG94wSeHthmU7CB9BMV85B0HkT8o03HtUgLvvyCVpRPnfEiqc?=
 =?us-ascii?Q?IOHJ6XF2pjYLNWp4qlkvXx8RUdtcQkzLrxHPTT9DiCZd8maEGP+IRS8PAMqR?=
 =?us-ascii?Q?5Gbb5yO4VdZxd+g1PdlyGfN4Iuk1Tc6nnyrDdMj5Iz61npBgeQJn29W3Z/gN?=
 =?us-ascii?Q?cciv7qdvkAF5LSMPlThHgtGg62T3/FFMp7Vvx/gTDjiMJhxjQJH0iD0LTdwK?=
 =?us-ascii?Q?rAJI+M/yOW0CzV3kWc0+OmDj1802gOctPNfQNygDKhM4VM+00aUkeyQKosl0?=
 =?us-ascii?Q?OGdnVAS8Ad1dnXZOpWVvGug42SHKAvYZdAEHSxK+ybqF9Ao2I4OPMCGJKaKc?=
 =?us-ascii?Q?v1zvWfdp4B3d1GiiZQv+U1x/W8RAQlsxfHLLVMypbXYmOhg3O7vx4Xe3BUOM?=
 =?us-ascii?Q?FRaekVsAK1Fe46+FSMp/SKr4eNO2a5kcdwR9QD4fBwHn7QSWq1STa1rrxywv?=
 =?us-ascii?Q?5tMrM/loHUj/dLjrKq+aCY3PZOgIEXXkDRTZw6e7/EP/62FY/8lFmIBefFmX?=
 =?us-ascii?Q?H1LXCHPtfHVx+UHdrQoYQya5f5rZ/9CK/bvY8/v7FHUadqb1LmwBLF7so3D3?=
 =?us-ascii?Q?ClnSnOPrUj1znbjCy4zWuWH0qXYZgvhXLL6VxeEICMhrJcFa2pG6AU/ez5r0?=
 =?us-ascii?Q?uwszUiZELHwusooiPPuNdRR+3YcuLdI1Fl04Q9YpUmi89QvD7BxqP1Mv5q08?=
 =?us-ascii?Q?uwFKNodRXQW6Do2eGz3B4rnSwv9RVBszcwcSm+mRR5GOnLMvus5SE2/ERrUT?=
 =?us-ascii?Q?P4dKHGah3i47huSFmoOKGeZpbkg329rX7xmndWDRfwXhYf/I3SOutfbnritE?=
 =?us-ascii?Q?WCLWQEL0I0wmNDIV16R2y3iZjAYZiCnlAlM9szyC42i68bgAC5LZxXYy7Npo?=
 =?us-ascii?Q?RMZWFowENTQ+jIgEXPmM5hk8z6JG8JeQqlZUsBHk09YLcNxGFIshc0BOrl6w?=
 =?us-ascii?Q?5u7kyoD7NNwrPmTFv9+EJgTy3Mx1fGrIW3U2pmSQoXJHOGxL/loeFchIMlub?=
 =?us-ascii?Q?2gbs8QjIRw2Nc51acXU0kmk3vBa3vSbCGTIG/DBFZ7DAReUb7Is98wL2A2vu?=
 =?us-ascii?Q?ptTvDvD9tYfipjJziXy0Gxfz1qP0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6373.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wldgEdOm6ikdhYrJ/Ko8qvKCyE7FsRbudWPMSIYFVyfW3s2/T+u87/USpLdN?=
 =?us-ascii?Q?5MyFrrzDATKF+MX1hpplT5ayE/DBrkh/lZJCY9Uk+NkW6qASdMHJ973Io44z?=
 =?us-ascii?Q?mgUzuWfOoQAiX7+PPg1zFc2ZHOBMQn/c5m4vDBWnpzgq39F+x1vf5RCn6WbS?=
 =?us-ascii?Q?FmDvHiSRKOepjiFeqBt5PF5HsJsAAqUjCID/bfxT1rori2Yn6BZh5U0qdSW7?=
 =?us-ascii?Q?TLwgyV6X0FoS/0xHyJ6F7HilWIqee/L/pZaCWlDgp5nuKLfTUgw8mIeEFrNb?=
 =?us-ascii?Q?WacB1BhnEUE3O3AWvYPh8jWn3KS9FoY0pZ1DpVlL0ezt81QOrCePJ1Of/vH/?=
 =?us-ascii?Q?vhFRy3pwx2g/UM5Ndtxo915G8+1qqAcg9LhuN8VCV3VHEMXrrFlJ3vRFfiBC?=
 =?us-ascii?Q?ldvYljeq2/GXQ7sKwqp8H9Z4gURZl8teZJYFW4JZKh6DXThgCGFBO9AQsAZo?=
 =?us-ascii?Q?JLcXS3KTsvBmCUeqTZAi16jxOmfagDBkc8L9bK0/BTuEQjL+lrsCFbrnyIgY?=
 =?us-ascii?Q?t/0LnogA3ZcRWiMAxyNWueZDev2qFYt5JhvHZKcJMZndGEybzkDAcNauBKkr?=
 =?us-ascii?Q?x6Cp2Wm2oWh3YFynH4wmVFxckvacv7UHDD+Qt6zEFWP94k3rOD0cLIwM1DBF?=
 =?us-ascii?Q?+Bww4tLGbznU7n+kiL+C3k2fj4+m92WQmBxVGTsIqbIbGQO71Y5ts9ZFpMHT?=
 =?us-ascii?Q?QLdpwiuI0IowflTVs1C7B3S1lto0O8ONcDzCrulVjKEEXNEDk5PJnD/CqlOT?=
 =?us-ascii?Q?j9zbjfPWQxLZqZ6rQW/yjGu34EeWmOHYy48hKzLlhBuKkmcavJ2hEvVH4eJX?=
 =?us-ascii?Q?4U/iyZRws2SHOOiNb9VQUGEU6OpEY3TnDL1KjFG1qYMVQdeJqylGClljwMEL?=
 =?us-ascii?Q?PYacM570HgjRbVS1FWtjstxjwyuyQTgOHSSDb9PIi1776gtJqdbchXVW76D0?=
 =?us-ascii?Q?2XrFj1K3DnJn8j0Wolw5vnftzKRlzU4+oPEKjOdbj676LqiIxsc4Z4HDv+70?=
 =?us-ascii?Q?3rjgbvgXRG7tej4nMMkyk2n8deQxXtv32/sfRp2xmZrszOJSatr3Hejoc85j?=
 =?us-ascii?Q?dB7xEDGYo9zDEQ64elC+2WO2TzkgBrCOcz/u90JOiA5C7TbG006hMvcvmxxy?=
 =?us-ascii?Q?fWe3CBzsbmaNzBhqHd4TGvJ2AmKdL+INAkxbgPDV1BIiD1MHlyttvfw5woO6?=
 =?us-ascii?Q?KIZstXOmKVHv+OasqqefOjn1tb40IHSYhF8xRuPddLzylcSN+W38mTwLp2ok?=
 =?us-ascii?Q?3G4OzP6Vv5QURniypuzrvWS9wdzL+8NMZFdT7IWsNIHniT870rWaZliW9z8O?=
 =?us-ascii?Q?g+Z4HqGLLrTbaeWBxVf2bSCiltxq+LRHy2YNakuRR+ipEdiCLmDsa0Kv0pkS?=
 =?us-ascii?Q?qYk3zJgQSLC7W183jQ5XwEPp6tMGYs6u5vIrLrlFp6Is+NvGep2o10TeXjzr?=
 =?us-ascii?Q?9l7sT1YGteomouHaVoqCZ0qsOnj2y0wAMFws10AdwqHX8FIeT3kaOR+trHg5?=
 =?us-ascii?Q?pjUBYUy/B0BSFfSaKxmxqksrfDO6jCQdTLlpcTmemYYbiaPsWudDNaWx8Toj?=
 =?us-ascii?Q?VBkUyPaY/vsXDng3XW5oByW5JCCbIQZI96NrpVNf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e6b48c-0483-43c6-a5e8-08dd4171bfe4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6373.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 21:04:56.4334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lcOHAqF2De/koiH8beGX3vKgLIsn4F6hy3wgpbW5x4KxzP/Hzmi3T4vikwN3WiSMc4TdbJ6kJLcicjvvl/Opuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6609

On Thu, Jan 30, 2025 at 03:30:59PM -0500, Konstantin Ryabitsev wrote:
> On Thu, Jan 30, 2025 at 08:13:31PM +0000, Yazen Ghannam wrote:
> > By default, 'git show' will include git notes in its output. However,
> > this is not the case if '--format', or related flags, are given.
> > 
> > Include the '--notes' flag to include git notes in the generated patch.
> 
> I'd love to do that, but git-filter-repo currently doesn't do the right thing
> with notes, so anyone who starts to rely on notes will find that they are
> easily lost with most common b4 operations. There's a long-standing RFE to
> support notes with git-filter-repo:
> 
> https://github.com/newren/git-filter-repo/issues/22
> 
> Until that happens, I really don't want to pretend that we support notes,
> because this will result in bad experiences for most who try it.
> 

Right, I've encountered issues myself. I've found that the 'tip-commit'
cover letter strategy works, since git-filter-repo will only operate on
the final commit.

Could we document some tips for this topic? Or just leave it for now?

Thanks,
Yazen
