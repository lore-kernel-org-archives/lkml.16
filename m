Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2081.outbound.protection.outlook.com [40.107.244.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8D92EFDB6
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750191182; cv=fail; b=JtIq9VO2mIogYadaMUl8eX1UfeMHFMIatJ4MeMN3P2GwXCrZFEr//UX3LSNGnsVRdmQmdz9FQjrkkv6EGtqM2STk8WWDfTQMxuEdo6r9XW+G2lzpJOLNGXBV6aRIf0nmznlSNW5DBvauY+t321yqnh5r5XcBxdXFG2gXYjPymr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750191182; c=relaxed/simple;
	bh=8ipF1fSzOxYLi/+uKVhZeX2CE+htMdNRAzz919k5HjY=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BfJUVyBJSRwgPZsPdU71CefnrP8hUMpTlFQFvLw6di09s4hO7GvwtSREy+Ysxte+ewHswa/DaFMZla9aK3zfk2ldXARC4HziM5SgyERNy1IcaoY4Idc47nu0nZ+YMZnyxwIFCuUVpN1w7Z4swTw+HhP8Rbfl+tIEd50UkL1OkMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Rz2pq/V3; arc=fail smtp.client-ip=40.107.244.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Rz2pq/V3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FRuhZ21MWX0shmP+SyCi86J0mlxuJo6mR20GnN+QpofnSYRY+2leZ+OevfEixCUkeyXg05HVaEqGjIxLRexS/kMDYcuLHbeEmIAr7Ra3AKgx27SSsWO/+Ku1PTlYw/4VmQFWJ2ulYfWSeGn11MMmnTqC17Ra27iEGtCU4f1tvcm5MIFSYbE+O6OKTSouoMCTkH5TaDD7C5T3pqfS51zGBTJbJbl5yJAi53NYKc/MPapEbEqErwYJmRBwqlAyuf/9N3sFjziNgZag2Kj/SW9WIj0q7g4wBVKZhWCXyUNcpa1zHzMJYmmonCom3mZslpX5epJjYVy5bZS3adadQgXw6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TD8eXH1+9tzh7qVGv/r4/y2RLIvpdkUlBgWkk545lP8=;
 b=YSqaGXA6hVg28tgZUNUl+ANBe6mA2KEg758UCkgYFV6Mu9e/yHh2Y31NP0oDLoPHl2SLAwuW4h2advSPdu1EQ+EobeOzWoZ9D5WIiwvQlZbryonPallmTOlqH2GQHd6O7xCZLNt0F3H6vZMYYOIHxB+oI3FPRj3Pgc3GZXXIShYMciyiQ2s583MBv7mcKzQcpA/y0sWLf1BWryMSrRNWLC8wHIfe/LWmLYVrm8ca8Qf7DYCWFDgTTFkukd94xtLHhp7FYVAY9EQpqlPGrMyBIjfc+GGn2xT7QQVKab2qmyX/qKr0gvmL2yBusbhijSY9uHHbDN75KnOSV7yU6hMizQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TD8eXH1+9tzh7qVGv/r4/y2RLIvpdkUlBgWkk545lP8=;
 b=Rz2pq/V3Eok1GUwx0yAZpkHN6tgs07pI28fUdryLK8Ck2+XUyp9MPN86czxFNpTo5uLg8FR4l4ivpOXUJuynohIRb2oDH5Vg3B/88fXlZS4blwyqmaG7GdziyLJnzpuHFf2NbL3m8HdJBOsgd7lT3jW+B8MpeqXLn8u9h5HfLcOdMfu62MhB+Xfpirv9zSVFkIiFYbnJ06/fe7IRJfkljVpSA3z6q3IKcfhsXQuJLMTMZVRVpMT1t9khtVZx03kK1i7roUcczPRZ0qf3nsdV8PFWCMp7oieuO0X/DkQsqPItRd4MAr+yLX33hW21MgXZ4tPUThcrS3Qfnj0FlVZJqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by BL4PR12MB9723.namprd12.prod.outlook.com (2603:10b6:208:4ed::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 20:12:58 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 20:12:58 +0000
Message-ID: <143dae14-8e6c-4bfa-9754-35013411fca4@nvidia.com>
Date: Tue, 17 Jun 2025 16:12:56 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/15] Remove the ext server BW before changing tasks
 to FAIR
To: linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
 Changwoo Min <changwoo@igalia.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>
References: <20250617200523.1261231-1-joelagnelf@nvidia.com>
 <20250617200523.1261231-15-joelagnelf@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20250617200523.1261231-15-joelagnelf@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR0102CA0042.prod.exchangelabs.com
 (2603:10b6:208:25::19) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|BL4PR12MB9723:EE_
X-MS-Office365-Filtering-Correlation-Id: 83d23ca9-98bd-4fbc-8fe7-08ddaddb5a9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cTRlQTJKL1NJc0RrbThEeWNaYkFuS0VPb29MNUF1SFQzdlNGN3N5ZWQvUzZn?=
 =?utf-8?B?MldRVDdPWU10M1hsQm55cVFqZ2Ftb09OaFhaVVlWUnFOSnFvOFljMUc3T0Zq?=
 =?utf-8?B?bDFyL01nUUpjdkk0QXBTN1JWR2VqelpxLzR4bzNWZDdST29NMmRkc0lBTWxK?=
 =?utf-8?B?dGZhL2VoeGlwaHdxc2ppUkpSR25vYnpPbElYam41S0szUlNOZjBRclVtNW1Y?=
 =?utf-8?B?N2Y3SlZaQjdVMkZYZ0N4SmNEWmdzRTZwa0RQQ3JJelFab2lqOHdBZU82bTRK?=
 =?utf-8?B?Yzk5eGFvZmFvb3FBeS9oZmFOcFdrb2hnWitESEE2NkkvaERncVN2NUZnSUdk?=
 =?utf-8?B?RVNqWngyZUhoT1RwYUc4WlkzdGtwZ043QzIzR3dHOVFSY2twLzdhRDZLZHU3?=
 =?utf-8?B?dUhWYXRyb0M4RUJVK1dtajJ6am9BSjR1RDYybGhvM21qTmkyVWc2UjFzUTht?=
 =?utf-8?B?MWVNSHNEcHdyZUM1M2w4RTlkUzlXa2J4V0FkcEtDREYzM3RuQzM2NXMyTThV?=
 =?utf-8?B?ekRTNUVuMHp1N3QzYWp6a1ZmcFlrRHFka1hvSlpVakxna1dqTFZrd25ObFVn?=
 =?utf-8?B?anNaMlBZb3lFVlB3L1duT3lPdE1Ed3hzaU91NFdsZ21SZUhvb2FFelBnQUtK?=
 =?utf-8?B?ZE1wRjMwQ1oycHNuTENiUlVxaWZWM2w0WTEwMFdPZUNkcEdxcHBFNjVldWIw?=
 =?utf-8?B?WWJnbWFWSmc3d0ZlOGNDaURYQUFqN1hWclhNOVFPL1FFRmdRbnhjNVUxdERX?=
 =?utf-8?B?dEE5SkNKQTBDSDhsaEtGOEFiTXJ2YnJtZ1pUeTE2eW9BNzgydG0vVUZlcSsx?=
 =?utf-8?B?V1p1cDNaTEdXY1FPaDdLK1RxZjdmSVRITmNnRm95TFV6S0ZzdGcxV3Uxd3pp?=
 =?utf-8?B?QXVnU05mMmxneWF6bmx3NU9IRHArV3pMY0hOVThCWFBsUFZBUlZYTHhLM0F1?=
 =?utf-8?B?dUIrWXFDTE5hWU5CUE9ITnd3ck5XdkxUa0MxMlZGaVdvQTFoaDUydjAzSFBl?=
 =?utf-8?B?MG5nRW1rbXhOM3p4cUxkc3YrUEdlbTQ0STZaQVIyWGhIakFwbFo4dkNDWXRG?=
 =?utf-8?B?VmhTYmNOTU03bHJ6WUtzTS9ObG03LzRMV2ZOWE1lTEpLc1hUb3hiTlloNzly?=
 =?utf-8?B?aFowSkwvaEMvUkN2L3AvM1M2eFV3TXVLTTdlQXRIZWRBaTU0cEI0YmRaMHU0?=
 =?utf-8?B?ZUtwbytYQXFYNzdHNTZjbWZpUXhpSldpcWhBdUtSMVBoNEo3djFqd01PbnFW?=
 =?utf-8?B?YWo5Mm1TNG10d241WG5OdkF4VDBQejU4Zkp4YU45U0J5cHd3ZDExQ3hTQ3pR?=
 =?utf-8?B?Yml0bStCRThSSkZjZjNNUVZYSDU5V1lIOSsvcVViMVRzT1oxUXB5RVE5cUFY?=
 =?utf-8?B?UGRsVnQyczRwSVdLRzk1YjBnTVJteEVmVEJ0aFFQQTNQRnZPY3BlclBPcGVY?=
 =?utf-8?B?Q0gxNVVoNExCS2hHN1J6WGlqTlZkYm80OHRSVFUvN21BWm84MXhmQkhNVEo0?=
 =?utf-8?B?aUpiMnpZMGRlMVN2K0JHWDF1WFBCTzUydWpYc3BBN3hWS1JQSTdkMmJ3dU0z?=
 =?utf-8?B?U2Z4S0ZPcUFNTmc0Y0VIRHh6ellmY0FzaDhxWXFnTmlPREhVZG9LR0tiNnpD?=
 =?utf-8?B?bXNQRWhiV2x6R1pIZndUVXJhcnh6MVU1aHJiVThFTGFJcUVVMEpPMlhjWWhi?=
 =?utf-8?B?VnBJTENiWUllQUNVUUtBblcwTjhOMDBIQ1podDB2Ui82L3pzbThCcXd3c2JZ?=
 =?utf-8?B?Zzc3RjNHNDQ2ZU0xZ2prM1V0cllHeWFqL0hhZDAra0svQU5kQ2IrRkN3QzUw?=
 =?utf-8?B?WTkrdjVMTWNUcm51QW9yRFp4Q2ZOb25NUmFFcTBSMkc0akFxaHFFZkEyQW45?=
 =?utf-8?B?QU54TFdUS0tvbEU3RkFMOWpUTWZZbnUzcnlSeVlockNBMUVYclJteHI1eFNw?=
 =?utf-8?B?YVNvZlVlUmFDZ1oyYStud0x3UDBHK1daRCthRmt3bUYzdW1sVk9PN1FOVUxj?=
 =?utf-8?B?QnhFWnYxbWl3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXF0SnM1dC9iR0Y5L2VJUnF0N1pHellsV2VCWGdKb3lYRGpQV1BYUmRKSEJT?=
 =?utf-8?B?NmZ5aWRaNFdLWGlYd0VGaWg3V2xCS2tNdCtHYmZ0M3RLUm9IMWROdllIdTBn?=
 =?utf-8?B?dktCejZVZmE1Nm1YVm4yc1RDVURGZmRkdGxac2piVENINFlZZi9pV0U4MmFn?=
 =?utf-8?B?Y3N5czZYYzVoOW9zaVJUaEVvNS9UN1VIdXc1em1oRTI4dzRWb0lGS3NtRDZ5?=
 =?utf-8?B?VUprYTBENmNWQ2RuMkl3bmhwUlF1NmRCS0RLOXgvU0RGaXdOWGRmMDNUdU9X?=
 =?utf-8?B?alN1blRwZ1FsZzVZQnJLK2ZKL216YmFxbDZ5YVE5ZHRRMkRYVDY5N2YvVU1l?=
 =?utf-8?B?cXdyalFpTlZhZ0hhbVhXbXhyNXFLVEduWkw5NjhydE1uY0FRYkpqNlJaanJN?=
 =?utf-8?B?a0NobW43MWxLYmVTbXYyZ3NSYmhkSm0zQk5HcWUvR3V2R2grQnA1RkwyUUs5?=
 =?utf-8?B?WVhBU25RTUJhYUVsbDd6dzFORDRiZEh6K2creUdiYzN5VUxpeDJML0NZUFRH?=
 =?utf-8?B?SnppQ0JSOVVGNzNNQTZ1QnVXckh5SW1hMFBxQVQ1MjFjL2hnR1ptOEl1MVJl?=
 =?utf-8?B?d1NFNXA1QTlhdXcxMTVvUzRwQ2o5RWJLbXNNZU9Qa1JpZ1lKeFVjMHEzYkJy?=
 =?utf-8?B?emVKWW83QlNoYTd5djFkd0htZk5FTXFsa3BSa0RHYXJnOTRPbTN1WW5WVnRk?=
 =?utf-8?B?ME9oZ0xEZkdsa2dNYy9DRTlMdTNIb1Z0T1dnU0ZqcWFkMmpjbzhQZUtkeU1h?=
 =?utf-8?B?Y1hpb0lkOUJrRGF2Z24yM1oraEduZjVScUhMbGlYTUZWWmhkdUZuZmppZ05y?=
 =?utf-8?B?djZsb0MvM1k3NDUzbytZaU9tbERlMkIvc1J2Sm1GZmNRZFpCaDBIeFZjY2JV?=
 =?utf-8?B?UzNsQmJiWWdqMXFLMUJ5V3BjQyt5cjg2cEZEUElOS1Y2eFhuQXNCSGJMRkdF?=
 =?utf-8?B?cDIrc0NOU1AxT1hROUpyMjA5UDlyK2NMT216ZnpJNk9aZTIwZXN6RVdvUmlH?=
 =?utf-8?B?VDcvNXdCT2M4WnQ4NHhabjhBSkxuQTVUR2dZdERiaTNvWVYxT0ZIZ3FEMlpz?=
 =?utf-8?B?Sk84RzY3VFlkSkV0VXhJanhQZmpvOVNxdWo4TmdQL0dDdFRObVZ5dFVUaE5z?=
 =?utf-8?B?SHBPa2xUZk1zb01BQlcrUWFzMHRHWnc4UldaYmphNzFlTDFWb25mRjJUNlRH?=
 =?utf-8?B?VXNHM1BhWXZuT3h3WUx3M0JCZ1hFdUJwUDRCSTY3TldBRENkSmQ5ZDJWSDNW?=
 =?utf-8?B?RTZjMHo4RTZERkJRSmJjN05RVnNNSVdRd0cxKzcwYVZ2OWt2aStQMWRLNHlL?=
 =?utf-8?B?cUIyZjV0QVYzTkhObGdxTVBLTGw4SHJacEd2ZWloeEUwWVV6TVRtQzdtV2RV?=
 =?utf-8?B?OXhDMVUyS2J5L2ZRcnhJY25Xb3UwQmJ3SThwZzJUYXBQUEpwTjMvdjZJQVhY?=
 =?utf-8?B?T21QR2p0ZzM5VTdqdXROM1lYQjF3enMyYTFScEQrbGhnQjZ0RmN6MHdWSDdY?=
 =?utf-8?B?RFBMcFNRWHE2UXh5Nm1zZ1E4SUdCRDE3RjRuL0p4UzZuWTNOSlpwVVRZdmpJ?=
 =?utf-8?B?QlE4bVhTcUdPbDlOUG5WVlBIdG5qZzVKNGRqVUs3WTg0RDdwZE9LYmVtZHkz?=
 =?utf-8?B?b0wvMlpvVlYzSEhXekkvY2lzUHlQdlgxNzhJck41c3hwMFRtSWJXR0dkbHpC?=
 =?utf-8?B?djk2L0tJYmw1Z0FrSHhibm1Mb2JweHNTZyt2OTlSNENjUDgyUy9qN1N4emVV?=
 =?utf-8?B?NVlYejE0R3hGR1h3ejk1S0JIYUo4elFEVVlETm0yNkg1NUNnd1lkV21teEhm?=
 =?utf-8?B?dUxHRG9uR2FON0NZT0VHSStSRzl6ajZBREV4Qk1scC9BUXlsVFdmZk92VEp2?=
 =?utf-8?B?SHh6MTM3bmZsdmRxNFB1UzdhQ1ExMFZqOFBabmwwWlpGZWo4OEZKRFhvbUtB?=
 =?utf-8?B?S0wyUTNTVXBhUUpzbEphSXdHSy9vaHV6a2VQM3d1Q1hMdXlEQnc2NUxUT2tV?=
 =?utf-8?B?bkdlZTBTempGMnZwbzdMeGlmcWdkZ09vYWVqRlE5NlJpeW1KTFZJMllDdUdX?=
 =?utf-8?B?Nkp4QWVoc3E1VDI3ZUk2U1ZyS3hZSTFqdktUUVg4MVErUlVqdnJYUU1PRDFI?=
 =?utf-8?Q?Dg2dxRBiOk0y0PaZd8Cor0uoF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d23ca9-98bd-4fbc-8fe7-08ddaddb5a9e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 20:12:58.7574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pyfKvSloVnyvpuXMnMU+CyjORnzrxLeTratC78Ox5ApmK2q11IwFDxpSDie5L8xkkS/59FzPCYiA+IqkVYdLOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9723

Sigh, this patch was supposed to be squashed into the "Relinquish DL server
reservations when not needed".

I have updated it in my tree and also squashed the rq_clock patch into the same
to prevent conflicts.

https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/log/?h=sched/scx-dlserver-boost-rebase

But its a minor thing, and we can review the v4 I sent.

thanks,

 - Joel

On 6/17/2025 4:05 PM, Joel Fernandes wrote:
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  kernel/sched/ext.c | 39 +++++++++++++++++++++++++--------------
>  1 file changed, 25 insertions(+), 14 deletions(-)
> 
> diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
> index 84ccab8cb838..23e5711bc4fc 100644
> --- a/kernel/sched/ext.c
> +++ b/kernel/sched/ext.c
> @@ -4960,6 +4960,31 @@ static void scx_disable_workfn(struct kthread_work *work)
>  
>  	scx_init_task_enabled = false;
>  
> +	for_each_possible_cpu(cpu) {
> +		struct rq *rq = cpu_rq(cpu);
> +		struct rq_flags rf;
> +
> +		/*
> +		 * Invalidate all the rq clocks to prevent getting outdated
> +		 * rq clocks from a previous scx scheduler.
> +		 */
> +		scx_rq_clock_invalidate(rq);
> +
> +		/*
> +		 * We are unloading the sched_ext scheduler, we do not need its
> +		 * DL server bandwidth anymore, remove it for all CPUs. Whenever
> +		 * the first SCX task is enqueued (when scx is re-loaded), its DL
> +		 * server bandwidth will be re-initialized.
> +		 */
> +		rq_lock_irqsave(rq, &rf);
> +		update_rq_clock(rq);
> +		if (dl_server_active(&rq->ext_server))
> +			dl_server_stop(&rq->ext_server);
> +		dl_server_remove_params(&rq->ext_server);
> +		rq_unlock_irqrestore(rq, &rf);
> +	}
> +
> +
>  	scx_task_iter_start(&sti);
>  	while ((p = scx_task_iter_next_locked(&sti))) {
>  		const struct sched_class *old_class = p->sched_class;
> @@ -4985,26 +5010,12 @@ static void scx_disable_workfn(struct kthread_work *work)
>  
>  	for_each_possible_cpu(cpu) {
>  		struct rq *rq = cpu_rq(cpu);
> -		struct rq_flags rf;
>  
>  		/*
>  		 * Invalidate all the rq clocks to prevent getting outdated
>  		 * rq clocks from a previous scx scheduler.
>  		 */
>  		scx_rq_clock_invalidate(rq);
> -
> -		/*
> -		 * We are unloading the sched_ext scheduler, we do not need its
> -		 * DL server bandwidth anymore, remove it for all CPUs. Whenever
> -		 * the first SCX task is enqueued (when scx is re-loaded), its DL
> -		 * server bandwidth will be re-initialized.
> -		 */
> -		rq_lock_irqsave(rq, &rf);
> -		update_rq_clock(rq);
> -		if (dl_server_active(&rq->ext_server))
> -			dl_server_stop(&rq->ext_server);
> -		dl_server_remove_params(&rq->ext_server);
> -		rq_unlock_irqrestore(rq, &rf);
>  	}
>  
>  	/* no task is on scx, turn off all the switches and flush in-progress calls */

