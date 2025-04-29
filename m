Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04322472B4
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745945104; cv=fail; b=GM1+LSf2GUFD1KaBDoj7LLsovSGQfekFd/+LurdU9VZoQsmKB15ZM9xzQwu75jLkyTQ88fDrMar2xFaxvT3U7fUTcPA1ABWS6/JiI/eCxNmkkKvFhsqkVxwzfsPreXkUnLADwW2P0I1bM1NESgaiWO4VvxRgYlFGBJiQrsOrYkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745945104; c=relaxed/simple;
	bh=llA22zZmvs5mdHuOgPlT1hqIzXBxY99/8kdMXz7EjVk=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To:MIME-Version; b=a98DtkOx1sjWC0/GkdDmNpmk7UiCZYDRqCZ7GhiF26+yWqFUhDf4Jq7LSYYCnVd4dj2VBbMx1WPraPgxzWkVMJPia8oG8vSKUEaIUQbgl9FBb0Wc/jQVJiFikFOWFvSgH0gycl3e+L3ueh9KU/vcA+ieS+X8PffbFzMflxANmc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ANe35vpt; arc=fail smtp.client-ip=40.107.92.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ANe35vpt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fZns9SgpVRUk688xIlvCwxLhjxYxPwboC5Tt4UlbunqRz5xT7VmyvBnKaIiEc0cLgVT9QZWNTYcoRFcDZDslfDCBwyjLRTs3TTICaGIszVXwSnC9a6TqtiBcE0oZ0FG6cE4CG7Dq4mTjyD22O4qcMweQrokBALnGVguGMqsQOhVmHhAiy8OZWUZkB2iEx3lWL4Ghqf3RbZdqZ95gvNjAbGKphJxdjzFoT0VFjB6EjZ5rMDv1GkuGaEjMwAGHDjhMRgbdWfLyxp6py1qOckr6MLg9F+yFUzl6wKDuXtmCoj3xFv7MfPLGNSA2JeExrmVlels1X9cRnix/QgfZAbmbCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=llA22zZmvs5mdHuOgPlT1hqIzXBxY99/8kdMXz7EjVk=;
 b=sDXpYGA731mVLrJggMbrPxqnmH0zGy0gY31eCpOhUXE4Pzd0Z2pCNO+XVthk9IA29IPxc9RBHccDDkdJ070KAMo4daIBcA2y/9+qQuqkqfvSh1IE6h4B48LyHtZMUXCmBPK81FtUEPyLcF1YnCVNEax5T4d+mX13OmfMCbCTzvhtQMM4skzpzJi0VBH3sQDQXe8vXeVI7O7SQWl4g2CXMUZ+xEYV2eG8xyrnxVQf4rCB5wOj4yyzl/k2Bmqm0Wlpu6qrJHJGdRwqpZbV/0R9mYSPKixHrBECyaiQMOS/ZUTOUJ16vprtJlJn5F4jgm/YiSM5vyS3vCkGjzGfQlzonA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=llA22zZmvs5mdHuOgPlT1hqIzXBxY99/8kdMXz7EjVk=;
 b=ANe35vptNY1btCFY19fN4cRSLdjc5hbSTUExO8YrWPUVsbsleo6lo30v4/oNr0l743q20JIkdnoAiR60t+Z10uEmTbpW5gnys5hFIFzcax/1WCmCLvd4XAsntMPTZx+SOfqkWM3LuY8w2U6FD4ddlw9gmV+x3xjmvooaAa9L1vRh1t6nzCPwI3EhcUcwmJbKr9bIb1SQx3zNHMrgCNJh7e04x98RmeSZ5yX5cnrhSDHAY5nBJTicyckBS/Q26yIWgCQi6WSRtDixTkg8EgRJvVR1hbP7JzGRyaJtXqvnoTB2N42HunQ66YAeMJF9H2Djr6XDnn6bOnlHm92J0s6cow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DS0PR12MB6606.namprd12.prod.outlook.com (2603:10b6:8:d2::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.19; Tue, 29 Apr 2025 16:44:58 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 16:44:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 12:44:56 -0400
Message-Id: <D9J9VSOZ94HI.3RJWIYXWKZQS@nvidia.com>
Subject: Re: [PATCH] mm/compaction: do not break pages whose order is larger
 than target order
Cc: "Andrew Morton" <akpm@linux-foundation.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>
To: "Johannes Weiner" <hannes@cmpxchg.org>, "Wenchao Hao"
 <haowenchao22@gmail.com>, "Baolin Wang" <baolin.wang@linux.alibaba.com>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.20.1-60-g87a3b42daac6-dirty
References: <20250424153815.4003-1-haowenchao22@gmail.com>
 <20250424194200.GD840@cmpxchg.org>
In-Reply-To: <20250424194200.GD840@cmpxchg.org>
X-ClientProxiedBy: BL1PR13CA0254.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::19) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DS0PR12MB6606:EE_
X-MS-Office365-Filtering-Correlation-Id: b0dc36df-bf6c-4e4f-4185-08dd873d2d43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RklGcGNaQXc1Zm1ldHl4WGJWKzlzQ3V0b1UvdkFxR0hVc24yV1VTelZWbjlh?=
 =?utf-8?B?elMxUlE2Sy91akRTMnp1bWlUeHhzeDgxZXFRRmhtdmZlYXVsYUM5ZmZ0WHRh?=
 =?utf-8?B?M05pejBwZ2grbi9rNDJLdFFBN1ZjcGdpdWVBWFpEMUZzOHJBOVFHdTZ3VW54?=
 =?utf-8?B?VDBJZm1hTWpDRmN0SEhGSEpaeXFTbHB6aWRveGIzd01tNmRwYUIwaW5rajhs?=
 =?utf-8?B?NGt0QktQcHVzMzFWRlZweXJIVUV3NWpacGxRUTkvTVRia1ROSHVSbU5mLzFW?=
 =?utf-8?B?bnNkaS9hUHRFUkFnNnl5ZGhNajRpYzJjL0VTZmNwb0hYQ1JwQmxLWHplOUNN?=
 =?utf-8?B?M1JxZ3JLQjZEK3Fma1kwdHV2WnNwSkt1V2pQb3BkdGZCZHBkbTY2VlBOZHJw?=
 =?utf-8?B?aXFSa3dFRytvdUh1SnM5NXdwSUhYTHhMVnBhcjlVNXVHU1ZnSy9mU0Zub05y?=
 =?utf-8?B?VWZMYk8wQVJJajZUVDF5UkxoNXRJZ2V2UFlJTVZUbWVXSVhHMkxGWk1nN1l3?=
 =?utf-8?B?aS9LUVJocDYzdHZ4VDBzOThPUlpSNmk1a1NIWUFCRTlzOUNVaHZRaUtpcU42?=
 =?utf-8?B?NWR4MDQrQUpHckl6QnltYnJRemlIUjRncEtHNGxUQVdBbHorYkp4Zk5JbXJy?=
 =?utf-8?B?UEFCUHJIZllqYXFVQ2JRQXhXRytMMklCdHRTTmVVcmJ1V3VlVkhYc0hqbDky?=
 =?utf-8?B?ZUR1bHJOTHQwbXlNN2tCeCtTM3Rmbm1GSCs4NmxGWTl1OUNpVktyUFFTVVdR?=
 =?utf-8?B?Y0I1TnUvQ1NQSFhJVHJ6VE5WZ0p6eUlYSEppUHYzT2R0Ti93STZDcFRjRGV3?=
 =?utf-8?B?SUdjY0I5ZWEzSFNhSEo4MUlBZFd6UG8relIrYmwzY21GL1RlalkvODZlOWlJ?=
 =?utf-8?B?RituVEFKWUNoL1NKdzZERVBzRTlUS3Z0RERXMkNlUUdJQTNCQ0x2b2wwYzcw?=
 =?utf-8?B?UXpHdHRjcitrNTRtNTcyNWREMkl6N1BmT3U2a0RYMjJwRHdaUStlUXRmNHd2?=
 =?utf-8?B?Nm54N3BOUWdyVGhSQWdvNXErNTJndjVoZ0RCMzVWdDFtdkU0NFNLVkk5NE5r?=
 =?utf-8?B?R2pDck1vNnJrUEwreEhhTk12QW56ZVNXSHBVbktvWldKc1lnd3NMOS9xYW1J?=
 =?utf-8?B?blBydXNlVHN4R1cxVGFoRnhUK2xuN1lScXdBTW9tNVhUejh3NUZpTmJLZW55?=
 =?utf-8?B?TGFqQU9hUHhMQkltVXE4SXFzMTFhRmx4SkpVWXlvK3Y2MEQ3RjJpdXo2cEEr?=
 =?utf-8?B?Qk1RTXZFZ1FCbENOekd0aStXMFNzdU1SdWNkTlFBajlmWDBuekdpMW96dC91?=
 =?utf-8?B?emVndGNwV0o0V3BKK1NxeG1aNWVBK3pCUHU2U3FNNytNUjl6dExkNmlsU3BJ?=
 =?utf-8?B?WmhIdnNTaUtGTDc3M0tKTXdMSkoxNUlFc1FkTVpZbjh0SEVYSytWeUlKRm1K?=
 =?utf-8?B?c1I3bHBnVnVoVW1ZekpucGZ1USsvMDlydkRrRWpWVU15V1NTUFlrQ0kwa1l1?=
 =?utf-8?B?K1FVSXJnZkVlZVVWMTFrY2hzM05tck9jRlhWK2xkUkdaTEpnMlZGRDFjVDhm?=
 =?utf-8?B?SDJZb0J1MUlMTkRrYmMyRlFIYlVkVENPWmZab1FaRWl1V08wak1oc1BiMjFX?=
 =?utf-8?B?MmRqRko4eTFyZS9yQ2xNZDlLRE1QL1dSZE5HZ05XdFJTNDk3ejdKeHFNeFVC?=
 =?utf-8?B?eGlzUWR1d1lDcm9BblhvZ3JLc2xncEhjRHdKT3o2QVR6bGJ2Y3NscCt6eXY5?=
 =?utf-8?B?N3ZDOTg3Q0kxMlkzWDBVTmlyYThRZ2U5ZjZpOU1sKy9ZOHZWWjhoRldrUHZw?=
 =?utf-8?B?ZkZxNVNHdDViUWlTUUVLcmthL1FxSWlOK0xPVWZoOWJPR0ZybDE1TUdFSzBW?=
 =?utf-8?B?RDM2aDhoVDRHR2VtNzh3V0c4L2MrNkpMQVFPRHpPVkJ0SDJNRW80S3I0VlFq?=
 =?utf-8?Q?1ZH+ZCybKWI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkxmT2VaaE9mNHRtSmhCbHU1QkxEQVpxWlQxaUl3TWZsNlgrSkdDakFQUHNv?=
 =?utf-8?B?eFpvN3E3WUd4ZkM2dkJ4QTU5M0VjVEZ4RFNtb05EYlExajM4MTh5bytyWGsr?=
 =?utf-8?B?OTFIVjR2c3VtYml0UW95MCs3Y3R0QTBURytlTk5PSFNXaXA5cnduTTRhSm5B?=
 =?utf-8?B?Umx2QjhPRHNVaVlmb0l6ekhTa0hjYmZobWlXQzU2Z0x2WElHWXcvK2RDMXBs?=
 =?utf-8?B?dERSQ2dFS3NIWHI3bFZxMWs1cm9LTGt6UVd5RWpOSEloaXR4c1E1dk4yNXBC?=
 =?utf-8?B?Y29LY3NMR2lFVnRQckhMUllXOG1ReXBqaEpTMDkwYXcwQ091T29Jc1dxU2pS?=
 =?utf-8?B?MFlOTUJReVpSK1FPTWZteFhrNDBPWDdudFRRMjlzNVhCK0pkbWpWMWF3Und0?=
 =?utf-8?B?S1ZLWnErMGIvT2h0NnpLbnc2Mm5raVFhTDFUSGg3eWRPMExQM1lldWFwL3N0?=
 =?utf-8?B?SlNWUENlMHlNcjVGTloyMFJOMmV2cmFVUHd4K1JwcHhEeUNEZ0dGa0JieGVR?=
 =?utf-8?B?RjVmK2J1V2t5NDNEWjJ5QWhjVmtVbzdEaDhlWVFyR2pzcmlPVFJPc1gyWXk5?=
 =?utf-8?B?ZWpyKzQ1WkdScHNhV01UT3ZaRHRqYm5UVC9qcWpGdU10M1pYTW5ocENuZW14?=
 =?utf-8?B?WVNLWlQvMDNRRUVXT1VwVU5lTExMZFJ3N2hJTU1JWjZGeU9qcER6UUo2OGdT?=
 =?utf-8?B?ckVWRUZtWEkzNkk5QWpYV0t3SVN6NWcyRWdnN3BzSDJZaThRTFJoaWJ6bm52?=
 =?utf-8?B?TnBqK0tjOFRnSjVWWC9aU1htSVRlbWJXK1FVR3RvMW4rMXJLTHNhUno1YjhT?=
 =?utf-8?B?RnkzUmZkUW5XWHFLV2xGems3Nm1LamRkUkIzZmFCZHBjb1Faa3Bhbi80VS9O?=
 =?utf-8?B?R0Y3dkh2RFJaNnd4Y3dHQmtDdHQ3QVNPVFJDUmV6MVZOeEJhSnBYWGxhTXp5?=
 =?utf-8?B?L0tCNEMxKzFuWnRZY2hsdnZEbVBQQXVETVdGY2Q5QjFPTW96RUdwZ2s2WGtM?=
 =?utf-8?B?QVdxZjdvY0p6MHBoNWxZcFNKMFdLMEZscitIK2dKb2grYU9oRGJwZVd4RGs2?=
 =?utf-8?B?cmdjWEEvVE9kSWtPT2MzVWFoV2ZCQklQTnBBSFExYjhVdzQzV1Frbkh0Njgv?=
 =?utf-8?B?VTA5YS8ycG5QQ0dGc29BYWt4VThEbUk1VW13b1FvVmhXTWdEOGhKdUx1ZHV1?=
 =?utf-8?B?cXZ3K055TFVJeTlRU0t3clpVSi9rbUxiNWk5SWZwY0x5dnNtUEwvYkZ5R1l0?=
 =?utf-8?B?Z2orTDZzU2Q5MHovUEZxZXd6K2tyQjdDVUgwaFlHMFRmcUJqejRhaG5QSnh1?=
 =?utf-8?B?aUVQNGxIUHZyWm1DTHlTV05oUXNRMUpRbjgycE5jN1Q1bTh6eVZmWXVYZSsw?=
 =?utf-8?B?ZXZmS1cxN2dmL2d1Z1o3ZVpPa2NlRzdiQTRvN1hPeUhENEt1UENYUUczZTF0?=
 =?utf-8?B?VGwwY2R0K1dneGtUdDM3eEpTam5qOWk0R3NXNmFWMDZNSXY5VXNqeDNnUzQz?=
 =?utf-8?B?cE52WitZM1VNVDNrRVZjM2tDdjlEU05BZHd4TjdudVJoRCtLS0oxT0hFS1Bl?=
 =?utf-8?B?OCtFN3JCNWJNc1R0eXpZM2puQVM0QllzUlVWOGMxYVAwektqOTViRERjMzBr?=
 =?utf-8?B?LzZXbHJkZGl1SEJ5SmgySk1DdDJaRGliUjZRZXl6aVo1bkF1a2U3d0szMHh2?=
 =?utf-8?B?M1M5ZzBYWXZneWRXamxMemU4SUdBUjJBNDNjanQ4MVd3QzNmWkRyMll2b2FZ?=
 =?utf-8?B?VzZGcGNMSXlTNGhPRE81aUN1VDREYmVZSnBSYW0reCt5eFYySk1qYTFnUmxH?=
 =?utf-8?B?UURjQm9TampJMGR0S2tXaG8wbTdxbkxGYVFXLytIcFo5RWl1Qzl5bHQrVmlt?=
 =?utf-8?B?bWNmbUQ0d1ZmMGw3WlpvRjByRE5kOHRSTTdQMWF2cHBCamE4b3c5THZPd2Q5?=
 =?utf-8?B?cWhzUXJYRWJQYjJkSy93K1JXQmRxMGNWSXFrTDFCRXVXWWhLMFNMeFc3QVpL?=
 =?utf-8?B?RjdkWXNNNFhLMUZMZUt6V1YyWnZvUzRXbXF2NHY5cHRKTkp3Vmk3a3ZVeXhu?=
 =?utf-8?B?RTZvZWk3d3REVDZwTVNEcndsekRoRll6NUJydXprQS9wWkRHZTdhRDRXWjZv?=
 =?utf-8?Q?CJ5G4uwwaL8F9VmiT8tRJKL6m?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0dc36df-bf6c-4e4f-4185-08dd873d2d43
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 16:44:58.0360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o59kIZ7kgGTDJo8tKy41xF7EyTSMhI5LDpaj0yyfHqOc1UtKj4ElQOiBg0RRiWW8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6606

On Thu Apr 24, 2025 at 3:42 PM EDT, Johannes Weiner wrote:
> On Thu, Apr 24, 2025 at 11:38:15PM +0800, Wenchao Hao wrote:
>> When scanning free pages for memory compaction, if the compaction target
>> order is explicitly specified, do not split pages in buddy whose order
>> are larger than compaction target order.

If such a free page exist, why is the compaction triggered? I assume
buddy allocator would use the free page for allocation.

I see your email to Baolin mentioning it is about proactive compaction.
In that scenario, the order is -1 and the added code does not apply,
right?

>
> Have you observed this to be an issue in practice?

I wonder the same.

The free pages are kept in cc.freepages list at its order.
compaction_alloc() tries to use a page with the smallest order from the
list to avoid split a large order free page. But if no small free pages
are available, compaction_alloc() will split a large free page to make
compaction going.

But what I do not understand is that if there is a free page with order
greater than cc->order, why didn't buddy allocator use it for
allocation?

>
> compact_finished() would have bailed if such a page had existed.
>
> compaction_capture() would steal such a page upon production.
>
> It could help with blocks freed by chance from somewhere else, where
> you'd preserve it to grab it later from the allocation retry. But if
> that's the target, it might be better to indeed isolate the page, and
> then capture it inside compaction_alloc()?

--=20
Best Regards,
Yan, Zi

