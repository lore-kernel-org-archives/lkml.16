Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2081.outbound.protection.outlook.com [40.107.236.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3E917BBF
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 00:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743037072; cv=fail; b=dztrGg13Da82HLK7ZfOk6r8iHl5Z2y9kEc24YM0Ongh6OXJ1je95P3yD85y2afsL3nDaBpUGEpjPk5u7XiFiXLV51Y6yfoWFUg/eerdXlSN7cTZk6xmJzTq1eBCS4iYezThKP/K3ayMfQbxFm6ElYjF7K1rmxsncD/rg91DuIB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743037072; c=relaxed/simple;
	bh=Pm7tnRAyZMFN1UnvlYIwylySZ6LcfHB5c6TdQ0kXHoY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IRieRY0spSXF2YEsPz5hgTPGstzDittnQSZPJ1hhw4dd/pXvqEjwb93jEQ3kZ9ccKFcZXitqQc9Xhexfy6ND8z+d5Db1wyrctyEm2d+zQCMeQ4WlQJtjwsboXTQaLvC5ECfFuFkRIWRuMIJQU0z4SZu3mWLQdIpYZkIxLqgcWDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JxX6QXrG; arc=fail smtp.client-ip=40.107.236.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JxX6QXrG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XdzvLqcXWZwqxkrSRXAYryqurdJ93NLRG0sZl0kqubhrhkkGEWJ2+/JGoy6s67h69AsKYN3tX9PTUbmg7KtRq3QhJgOHb7epbwWI6Lzse/qXzRgKUgYt1EfQn1gpZ0e1UPVQIrGWeSdzP5JqE77FrxK7XcDG6nj7ufcfppINiYRQ+0hw1wNTSvHpb/WsMRsrvH1ZeSA1uPyj0tc+4MpokW2L1iL6UimN4pwmQgo8FMDv3/FXMDtP/ezlVDL6sub4R91DsizY/tv/KbszcNU0svWSA8gPGToOMhvFYXAo71gSRDvzocCuLZXFFMyWhGsiCv2Qg5WW9Hc7FgqvMSssVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hM4F6kIopP15SVre58pxw0mx70ciBStzudkKmt3ASYc=;
 b=CGh6TZ18MX4WYC6jr+5NaDeGbUQvKpxh1hegJ4ySnEXN2ADNMmdmapgvU3aUvFmoPhh9pqgxGLZVVH78EIoYYDlyA5MKJ8+w1jeWQLYG1bQ4MVrsqYcu/ZI93YlFelVc60S9xqVEF9Q7bw9CV8REsRnVXNoHi8wl0ttp1qLDzkAhtpybNAld1k3Fo51cRp3jfQQxRD5wNWNvHSLJbSB50J/x+wAmcE6dxxJFufr+TdJ6dEDIMeZz49P5Qf8wHiCoxaOnMp+x8rz+vTGcs1a6onmYkmLXUpODtspz2cSAFxAt5kjbU5RFOxEIFJ6wbX3e6BtLMrdK5xTh3it2T9CDIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hM4F6kIopP15SVre58pxw0mx70ciBStzudkKmt3ASYc=;
 b=JxX6QXrGxkAB5Vn5106G2eKWXM8cz4GcMorulzI4jO40+/eRBjIlPjEmOs+lLIcD3n4Y0rMQsX/zK9S4ofnKT5dIJaIdtRqzCWEIH5H9n6jD4UpB8N+Y6VxdF623Rs36Ps4cJgAcvFEjU51biMtLQtfFta9HxiQhlhc5FJdmEXTV2/zisFOyD5TIPOYyf3dtiS4FSzGHQpgj94TgqTVodP4q9O97xg4GRPAE1ijBTJ9JZCzpHHxHnBhU60YzJGMcFxDnOUDoSVJwq1oU/4DrJWR3CyfOkJ3hLSevgtjlUcl5B8rdgVR3HkPwEPz+8e9wAwQpExHd90HNjdaPEXyzSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB7272.namprd12.prod.outlook.com (2603:10b6:806:2b6::7)
 by SA0PR12MB7462.namprd12.prod.outlook.com (2603:10b6:806:24b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 00:57:47 +0000
Received: from SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868]) by SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868%6]) with mapi id 15.20.8534.031; Thu, 27 Mar 2025
 00:57:47 +0000
Message-ID: <09473909-4909-40b1-b3ad-1202b136e5a2@nvidia.com>
Date: Thu, 27 Mar 2025 11:57:42 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: commit 7ffb791423c7 breaks steam game
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Bert Karwatzki <spasswolf@web.de>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Ingo Molnar <mingo@kernel.org>, Kees Cook <kees@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Andy Lutomirski <luto@kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org
References: <20250325101424.4478-1-spasswolf@web.de>
 <64945196-f05f-478e-a2b5-f0bd58345136@amd.com>
 <c66e2c03648370d5e5c0745f32ebd58367bbe48b.camel@web.de>
 <CAHk-=wh5Suzp0z7AnK0NgSKfEAWQJw7Dgv5eku=rzBuM1ugQDg@mail.gmail.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <CAHk-=wh5Suzp0z7AnK0NgSKfEAWQJw7Dgv5eku=rzBuM1ugQDg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR04CA0034.namprd04.prod.outlook.com
 (2603:10b6:a03:40::47) To SA1PR12MB7272.namprd12.prod.outlook.com
 (2603:10b6:806:2b6::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB7272:EE_|SA0PR12MB7462:EE_
X-MS-Office365-Filtering-Correlation-Id: 3edf4461-5bae-4562-0420-08dd6cca63b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cmN0NDFzZ1pvc21JSTd0Q0J2TGxtVUpoOFdkak82Qm9QdVpqOWlsQ2tpUTA4?=
 =?utf-8?B?RHdtSVRoSjlMc3JXWUkwdDljMUZoODg5c2VOajRpME5rSHIrM08xOXpRaVR1?=
 =?utf-8?B?S0VHNnZHTTN2bGlnWjg2dDlWY2lBakpPRlUrUXBUUkZEWWZCRDFvSmZMVGJx?=
 =?utf-8?B?ZHp2RnNQakc3RXJoWHlJOURZcXBaTDJRb25uUGtUQUV2Q0dDSEJKZWc4Tm9M?=
 =?utf-8?B?ejhHUDJsSExLbkd2N2hiMENmMVljWDhiTndjZkVNOGZMQldxZHFtSUl5d05H?=
 =?utf-8?B?OCt0MzBKYURkUzE0RWYzZEN2WUlZM0xUYzNHZ0RzS2cwN204d0VrY1ZpV2o4?=
 =?utf-8?B?UFMwRkQ1MlRKcE13eHVCRDMzRzJxa0VGSS9GS3lXMVdScytzZlZLK1FDODBV?=
 =?utf-8?B?cE9Cdm5ZVkNUVTdTeU9yN0FRNUUvZWRCUkZoNXMwUzBzNU1XZVpyK21MUlJn?=
 =?utf-8?B?UjlYUEo5eVRyNW1aMVJGTUh6Mm0rL3daTlhvSjY1WDhGbnNIODFib0Vwd2dR?=
 =?utf-8?B?QS85ZjdhM3MvcUVNcmJFZ3JoQm9HLzFWYVNaTzQ5RE1Rd3NIZStDcTZZNXB1?=
 =?utf-8?B?d0dIaTF1ak9uL0NKb3lTcUdkODVtNWZsNE1pdzkyTmZ3d0J3a2pLajM0eCth?=
 =?utf-8?B?ZUY4TzBQZmRVL0RncXEzUm9idENCc0NVemcxNThXdmdHZjVaVXJwM3JOWWhE?=
 =?utf-8?B?Y0kvWXlheThtRUlBbUlvWXVVdWM2NE9tMG90ZjZmM3ZKOG8wQi9yeTNHM3dO?=
 =?utf-8?B?em93emJSY0h3T1VXTWo1MmxGdjhXdU8rNU1mZGN3TDlxWHpsWWxhekJBdW96?=
 =?utf-8?B?cmlwWG84cFgvQ3U4eDJGU2tTZUpXYUtvK1RkK3RnSWhTOWhMSlRLbGRLbHlw?=
 =?utf-8?B?YU55N1d1VFZFanVUMHJtaVRaWTUwaWI3bi9WajI3Vk9XMER6OFU0ZnNCWGpv?=
 =?utf-8?B?VnJ0dklUR1dzVTJDNkJKcks2THNXNSswN0t3UHFWQ2hXZkMxSWY1VVgzS2Fk?=
 =?utf-8?B?RjdMUjBEcTdNTU1tQjAzdHpzcDcwZ0dGTTlrL29hc0pwOVJZWWtzR0dVakN6?=
 =?utf-8?B?YndqSkVjTkNzTVQvczZ3dDNZVGdudzN5NHEwRStBbFVpVCt5NXp4WHMySkFx?=
 =?utf-8?B?dlAwTGFLbUc2M2VYV3pUL2duZU4yTzRTaGt2MWZHTlBVRFh1Y1gxKzhnTlQ3?=
 =?utf-8?B?Nm5mR1BkMWExbXRQQUFDSTRjZkdScFdQQ0Z3YUNEd1RVcFJtM3pqRGx4aG1z?=
 =?utf-8?B?V0dxTSsvc1Y5azFZNVYxM0krb3FqaklWNGtpU0hGSTFwZlFrcFRxYTRpNVVI?=
 =?utf-8?B?NDhkU0psd09EdXRBY0h5Zmtja1dSQWIzVGFOM2ZLczFreEhUOTBPbWtwSXdR?=
 =?utf-8?B?SENrWUlncHYyU2xQWEZrY2xtQWxxdkJwU3RQeERkVEluTnlYL0x0a0ZaVnh6?=
 =?utf-8?B?em54MG1qTEI1aGNxYnBFKzAxZDJ0UjU2blVVWVMxNUExVU1OYk8wMWhvWFF1?=
 =?utf-8?B?UVlVKytMZHcyWWFhMkluUWUxeVY1WVFVK0pKdE9uV29TdHIrSUJ0NVU3OStB?=
 =?utf-8?B?TERDL0gyNTZkMytiZkdTTnJ2Rnpxbm8yWG55dUljY1ppU2JjTVphRzdBODBs?=
 =?utf-8?B?NFc0T2p5NHBsWFZGZGw4SGsxay8yeHdMcWlsTjVVaEtHVmhBd1g4bVhXMTZn?=
 =?utf-8?B?allGL2RlbDFGeTJUd2I3WGJYYURQNTlJby93TUhtM0g2STNscWlZMjUwNGhl?=
 =?utf-8?B?OVprL2VsYjlnNis2VDN2LzJMeHBncXE3dkxZTDFHMmMwNGVWYUxJMGlPbGNs?=
 =?utf-8?B?NCt5TU1rUDE4WWZZem5Hc1BRbVZpTC9vTHN3dEU5RFlZU25oWUJVb21zcDlH?=
 =?utf-8?Q?pgueIzilF70Ry?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB7272.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2ViRDBrckgxRXZyTzZkdG9LbHAzZ0d2R2M4bWpUYnB2bkh6aXhoUEdZbllS?=
 =?utf-8?B?MTNUTzR1US95RW1ORGpNSENtbTc2T0g1QnFSajI1Tm1kRUtWa2hSRERBYVNh?=
 =?utf-8?B?ZTFPRkQxS3crRXc3NUs1WTNsMnVxeW9FQXVLY3VWekI0UCszcEdwMHI5NUh6?=
 =?utf-8?B?SUR5Mk5hamYrdFRzSTdZMFBwQk5TdVBGalkreVR2eTdjS0J6WE42OHJkd3dm?=
 =?utf-8?B?bHM3dXM4VEFIUFJqVjc5TmpNTGlCUmhXa0hmK0JUcmxVWmRhNXFqUVZpTHIv?=
 =?utf-8?B?SEpwNEpndGl4NFZ2OXFtT0wwRGxpVG9KL0puWGptZyswL1BUQ3d4ZVAwM2Jh?=
 =?utf-8?B?NU5wZ0FOSXVVeTBqenV2aFdGM3pBNXFRWDNVYklUMlg3SHFuckhEcUxlQ0pn?=
 =?utf-8?B?dXJDdGU0cENjcXdwbzYxODFkT0dQODgySVFiTGZEMzBWQTA0UWROKzY1NDNR?=
 =?utf-8?B?NnFtMHhyd0k0RWJrWHFuOFRKR1Fva0ZpNWM2Q2ExaVZxNGJDc0RFWWhOR2xV?=
 =?utf-8?B?UGl6eDg5bGlraExTRzNkYUFnOGRVRmpRL2JVMFF0OEZjb2JmaGo1aXNHdTBY?=
 =?utf-8?B?b1g1KzVtZTVEODdySWJaSGE3cmhrdCtMajZTTld3c2VNOHZvaVRIbEsyVSt1?=
 =?utf-8?B?M2VTa21ldUc4QzBzNU92VUdwVmFRcnhPTXVObmZjeDhzS1k5NXJPRmJzd1k2?=
 =?utf-8?B?M3pJbFN1UHU2d1dlM0RlOFVMRFJOcXZpMGVzYlByMmJwMW1wU08rbnA0VlRu?=
 =?utf-8?B?MmlkeEd2RFNRM3l2QWZzelY5eU1xTjVSU0k5ZjErZ0NwY3JwTk54dHRHMkxh?=
 =?utf-8?B?QXNEbjRXemE5d1pId3A1eVFNUDArbU1Ia3NkNW0xeFE0bEN1ZmZkZlVwNjJV?=
 =?utf-8?B?SFcxM3VEUE41OXR1eUVkUUNuTU9MN21paHMwaEhKNU0zQTV6ZGl3VHJiRGxH?=
 =?utf-8?B?YjZ2MFlCVmpTdnR3dEQ2UUJqNmk1dDM4aHV1bEFDT0lSekExOHpQS2NIU2gz?=
 =?utf-8?B?d1BrME1qbld0NVY4TDJLNjZFbEhwYVBSMS9uOXczaEMweS9HU2ErNktiTm5w?=
 =?utf-8?B?VndJVVIzejRsaUxNbDVoZktrdWFJZk1mOEJhTlpXQWJHVEtZd1dzaEc0UmlE?=
 =?utf-8?B?d25mY1F2MnJ1NGRnL29ZSzFQeUdEUHIwV2ptdnlzaEhhdUxRdVA4UVZLYW11?=
 =?utf-8?B?STZmTDZwK0RDUFBwR21qWmJMTzFKQVR0YTZQc0ZrV2Y3TVpmK1Z6WDdvR3R6?=
 =?utf-8?B?aXAxOVc0L0dzVnF5VXp6WFpNM25nVVJxdUNWZjVlT1BHd3FENjJPUUYvb2Nt?=
 =?utf-8?B?MGtoOUh2N1ExWWJEUTV6anBkTU9wYzFQR0tzYUxQVWk2bzF2WmR5UzF3cG12?=
 =?utf-8?B?UzhMMjJjc2NkWmNZU2FyZDAvYnBIUURIUmE2ZUNORm9KYXZoZnA3cVZxM3B5?=
 =?utf-8?B?dXhHSThqcDF5NFBVd2c0czZxSzJRZTY1S3JmQXZzcXl3VHNvbzZQSXdpYkZy?=
 =?utf-8?B?U3A3bkQyNE1SL1R0bWYySDJxVG1kUmJRaVlVbWg4NFdxSUNuNGpkd3MxbitD?=
 =?utf-8?B?c0l2S3AzWWZnMDcyeDE5VTM4cW1XMmRiMkFZYXhUV1kxYng2eWhOZmVvUGty?=
 =?utf-8?B?dy9kT0NvcW5WbGtGRGhVTTU4OW1sOXZIa25UNUNnTkUwRzFNNWpuYjc3a09D?=
 =?utf-8?B?ZHltWENOdWZwdkRzNVZUNGtsN1NnSXoyc1NKeFdFMGZoSkFLSTQvRVQxdUZY?=
 =?utf-8?B?bDQ0d3E3S2NQVXpTT2RQNGpNNkVLc0lDRUR5Vk1SUjNNZzVzbW5WZENWM29L?=
 =?utf-8?B?U1Ntdk1wY3NGUzV2dFlzcVVycWEyVVBsMTVqQlRmejRJSWFlUncyZktOVUlX?=
 =?utf-8?B?WTkwZmpjc3A2NXBnRmU2MXFMUkxZVzgzL1pJUjVUMHdxUlVGZndNMUViOVJs?=
 =?utf-8?B?SHRxVEtCNVhpaGFrTENxUU1UTm0vcWp4QWtJVmtqOURxRG05VHM1S01xdjg2?=
 =?utf-8?B?Yy8wTXUvSkwvWHJzOEp4RFBOKzFQenQ3cjBkbUhKNzRHVUFOb0RXekVYUndO?=
 =?utf-8?B?emV2MG4rN3BUazhvbS85UDVCSG1EWW1lWVhCQ2d2MER6ZWhwbWZNQ3lYMWdN?=
 =?utf-8?Q?wIURtJjZj2G8b/fZHvu33fGeB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3edf4461-5bae-4562-0420-08dd6cca63b6
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7272.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 00:57:47.0584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X2bl5U3QPu61R00kuo6abkTQXPNoF4ulIAkJltTzRSviMQengsEGFYpZ1Phlvs1M7lperJdcCfK6og7BPas6Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7462

On 3/27/25 09:58, Linus Torvalds wrote:
> On Wed, 26 Mar 2025 at 15:00, Bert Karwatzki <spasswolf@web.de> wrote:
>>
>> As Balbir Singh found out this memory comes from amdkfd
>> (kgd2kfd_init_zone_device()) with CONFIG_HSA_AMD_SVM=y. The memory gets placed
>> by devm_request_free_mem_region() which places the memory at the end of the
>> physical address space (DIRECT_MAP_PHYSMEM_END). DIRECT_MAP_PHYSMEM_END changes
>> when using nokaslr and so the memory shifts.
> 
> So I just want to say that having followed the thread as a spectator,
> big kudos to everybody involved in this thing. Particularly to you,
> Bart, for all your debugging and testing, and to Balbir for following
> up and figuring it out.
> 
> Because this was a strange one.
> 

Thanks!

>>  One can work around this by removing the GFR_DESCENDING flag from
>> devm_request_free_mem_region() so the memory gets placed right after the other
>> resources:
> 
> I worry that there might be other machines where that completely breaks things.
> 
> There are various historical reasons why we look for addresses in high
> regions, ie on machines where there are various hidden IO regions that
> aren't enumerated by e280 and aren't found by our usual PCI BAR
> discovery because they are special hidden ones.
> 
> So then users of [devm_]request_free_mem_region() might end up getting
> allocated a region that has some magic system resource in it.
> 
> And no, this shouldn't happen on any normal machine, but it has
> definitely been a thing in the past.
> 
> So I'm very happy that you guys figured out what ended up happening,
> but I'm not convinced that the devm_request_free_mem_region()
> workaround is tenable.
> 
> So I think it needs to be more targeted to the HSA_AMD_SVM case than
> touch the devm_request_free_mem_region() logic for everybody.
> 

I agree with your assessment, I was looking at whether bumping up
max_pfn for DEVICE_PRIVATE memory mappings via add_pages() is the
right thing to do, but I have not yet completed my code search.

From my understanding, max_pfn should be used as the end of system
RAM and direct_map_physmem_end as end of addressable memory. I proposed
not updating max_pfn for zone device based add_pages() on x86 via a test
patch that worked for Bert. This allows HSA_AMD_SVM, nokaslr, PCI_P2PDMA
to all co-exist, but I need to audit all of the max_pfn usage and assumptions.

Balbir Singh
