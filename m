Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2076.outbound.protection.outlook.com [40.107.236.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5FF1F92E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 10:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749724928; cv=fail; b=Z76RTIiec+DS61S+KxbYIa270v53/H5cz97ifyV4IrfoDZfIH9PDN1NJVY0TDdzFi7j1Kj9SCIWnnvtyOUupaJk29Q9/qweCaiptAP46F9QuQZFGjPpRR1LInr64lF324Sq2cJkQiDo3DIC5h5/d69bmoE8EgZCSp9xubyw1D9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749724928; c=relaxed/simple;
	bh=rMWwMOO+3xcez4SlNZgnj3zIVsNOZTxycYZauym+JW4=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qhC7kXlqUFksVCh6Uw7i0nifsv8EiJCUjUgZ0QdCTq4UfJBmXvyKG+/hUJZDi9PvnPZlZgXBFL2rr+OvRISbI+DYJmME+ByaMC8pJI6ImphdDDtzUBoEQsQF/wIm0m65JOONTqf0WswKphYm7V+XA7X+0eh4xyreP+2uTe54Y1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pB2y1u2F; arc=fail smtp.client-ip=40.107.236.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pB2y1u2F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PaO/O9vOd1uZFAMRWUbhHqTxbAc6/i0/7eqdzU8+UjNEQwq9mRe1h8iZcVerI/989y79yPgUwWr4WdPJ4knceg3k+uEB0QWmcw7ShwIXqD0E0ScGlHwt8veicynWTZWGawCUjM3Mf2r/h/nDnme2VhGDaWA/9vt7UxtseN//VTgyzF2czGQL48Iie07hhqLC3v3UyOZ+qt2m+H4HKdjUypc0xyJNBKe8Lmvw+3DZL6cj50ovDfMBIXekSZlaND8MXl/XwTYc5VkmmYBg5178pgO9prPg/smQ3DlCMTtu3rs+gtxPPaDw/lm5YKhM79IFE6wJ7QsWGi9o3wJ4TXuL5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+puy9SV2JW0tuH/n6jC1eou9ElwgD2zQrItXS1eV6CU=;
 b=e2y/h7yiAMJlo56/Fv2RCk8XjDOokIghsw9o02BU5SdYtfy1zyGJhDqS+pBxz/TWjS3e28bhv0fFwCCPAAgl3IQmlWVtsYy45GmOVGrJDIb7eoSBV95OF5lHL9s2eF+WpCC0jVOc2Jws39vdmT4uEKcHUQiSHbEP2bara1jyyzUawY9WMlYVRuqfSX3XYtveGIirMyJHIPrQsIRHaOqHvgpGkx3k/6DpKl9xGXc+mxdrnnzj5XoQrlU2RrJ/tOW/3/TtH0J3X5w973HqjThAATbCcj9WQ0TV20/4o2WORJstF0qJ6f35f8K4FEeYBwN8SYWwBGMsq6Gj4k3rgVOOcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+puy9SV2JW0tuH/n6jC1eou9ElwgD2zQrItXS1eV6CU=;
 b=pB2y1u2FcfaVTW9LTbEe+YZPZyLGnNwjM/mnaXY/IOkvWiLtxPP6eusYsiC7lq2RIwcVNmAiFD+3Ez3u0s+1n7723uXoC0esE2s9GO1EZRlgsZh207uFQmAUwUysA8GbBPwp53Fv2U0t8Ck6JpENkCFSi66QQM19oIOCaSEKWOc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by CH3PR12MB8903.namprd12.prod.outlook.com (2603:10b6:610:17a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.37; Thu, 12 Jun
 2025 10:42:03 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%7]) with mapi id 15.20.8792.040; Thu, 12 Jun 2025
 10:42:02 +0000
Message-ID: <223b16a5-8532-4f5b-b34a-c7a0448f2454@amd.com>
Date: Thu, 12 Jun 2025 16:11:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] sched/topology: improve topology_span_sane speed
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Steve Wahl <steve.wahl@hpe.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 linux-kernel@vger.kernel.org, Vishal Chourasia <vishalc@linux.ibm.com>,
 samir <samir@linux.ibm.com>, Naman Jain <namjain@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@linux.microsoft.com>, srivatsa@csail.mit.edu,
 Michael Kelley <mhklinux@outlook.com>, Russ Anderson <rja@hpe.com>,
 Dimitri Sivanich <sivanich@hpe.com>
References: <20250304160844.75373-1-steve.wahl@hpe.com>
 <20250304160844.75373-2-steve.wahl@hpe.com> <20250610110701.GA256154@unreal>
 <a5da2e4d-c042-4d01-bfc3-f50ca674247b@amd.com>
 <20250610123618.GB10669@unreal>
 <4110e533-6cab-4845-bd11-11279ebc9150@app.fastmail.com>
 <aEiKCqoaEWnZvlCI@swahl-home.5wahls.com> <20250611060607.GM10669@unreal>
 <f5fad97d-f880-49a4-9595-ca3f5b41d9bb@amd.com>
 <20250612074157.GO10669@unreal>
 <5a673979-e96c-4dc2-b84b-849c6c8084ae@amd.com>
Content-Language: en-US
In-Reply-To: <5a673979-e96c-4dc2-b84b-849c6c8084ae@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXPR01CA0094.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::34) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|CH3PR12MB8903:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e0a125e-5187-495f-50ec-08dda99dc3fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MDdOOHZ2eE04b3VZTGs2aUFGQ213VkdVN3pKK3h3eEpMVEdTbE01d1Y3NGJx?=
 =?utf-8?B?VEpSb0Q0VWJrVnQvU0VOV1hVMDQwVmpWOW05dHdDdWZBOVBEeDdJVFZOa0k5?=
 =?utf-8?B?Zzc4cEJtbmxuc1RiL1BIbENEUitVSnZOVDh6S1FCZTVDZG85OGxXeXcySkRB?=
 =?utf-8?B?RDNKWStJWU83U0h3WDlYdFAwWnEyZ0gvQWFXZzJvQTNCdXlOdlFFMnBZU1J3?=
 =?utf-8?B?SmFXK2YyYnc0UVQrT0s3VmNVcStnS2JHM3k1UDhRcENQVE8zQUc3aG5tUW5J?=
 =?utf-8?B?VWpDdVNvZXg3Snc5ZERDTUdhcUd3NlRBejlzRW1KQytPQ3N0dFNUaHZtYUNN?=
 =?utf-8?B?eG9OK2VKeEJlbGtNQ2lDV0cycm9uU0ZaWFRVcUxTRlNYWmZIK3RoYVVpbjZS?=
 =?utf-8?B?d2kvZ3JQTjNyMDB2U0RNeDlnMEs1T0c1M1hkNExVZGtENy9FUEtVYmkrSVFY?=
 =?utf-8?B?ME5sbFpWcHZPZWdra3VzTytVbnU5RVNzajFSc2gzSXBRZUo0RUxJL1I1R0E4?=
 =?utf-8?B?dlpPK2ViNzA3RFpTQ3FuZXdIMno2TWNDMHZKQlRmTHh2b1BSYmxHcHV1cnJK?=
 =?utf-8?B?VFg0OThKb2V0Znc4RzFzVjB2SFRLR0VWYitCeU5WNDRFWStrUlhIRU5zc2JH?=
 =?utf-8?B?cFd4T1VEUGJwaDNLaVBnb0NZUkVIU2p3UnpvM3k1RGxwektsTnNaMjBEaTEy?=
 =?utf-8?B?UGxjdFZkSWJEM3RNSStNSGQ2SHRhNFhTQjRBaU9ESW9Wd3pBWnpvRWRYczdM?=
 =?utf-8?B?elZEeVQ1NkxRbzB2R1MwNXBuVHphSWhQdXlwemlyMU9zQjI4WjFSQXNXVGpX?=
 =?utf-8?B?ZUk1SGlzR092VWxST05BdUJvZmVnUTM3TzdjeGVZZlh2WWpkZzBrNC9uMjU0?=
 =?utf-8?B?WFRCeGVUMzFodEZiTFU2MnM1VmZ6b2NYY3hGZFd3Z3gzR1h0ZnFIY3JqL0NR?=
 =?utf-8?B?cXNqY1Bqd2NGMGJUclFFZ3loMk1RaU40UDRpUnU1Q3JQT2x2Tmc4STJ4UTU2?=
 =?utf-8?B?eUU4QndYYk51cnMwdi9oMm9YTldOUzZwRDh0cWhlVkVIWnd3TDg2eXd0TXRM?=
 =?utf-8?B?SElUSmlMNENrVnhEbkJXNTRIb3Z5a0o5cFJUWHpVOXRELzB2YlVhRDQ4L0hO?=
 =?utf-8?B?eURHODl1SlVRQzYya3JUZ3hUeW1ncm11YUUwQ0lQb1QvaVEvMkNnWGI5TVdw?=
 =?utf-8?B?SENkY09MdXdhZ3YybDhoRkx3SnJ2bEQwRURjVGlvTDRyYlhyN1BIM0RsblJQ?=
 =?utf-8?B?WDZ5NmMrVFBkY0NlMk56a0hmK3ZWTXdnWXEwVU5JYU56QnZkMkQ3RHc5WThw?=
 =?utf-8?B?ZkVvb0JHSy9SUmxQTEJiWXJXL3BPM0J2ZmEyeXdBeGhXUjVSUnNJZk1iQits?=
 =?utf-8?B?SkpZa0JhZ3NraTMwMHptYk9RcGovUGJlNXlaUGNOTER1b2lDY0w3TGgvNTB6?=
 =?utf-8?B?ZjVIODFQYk5nTzBDWEg5ODIzcGxNSWcwb3ZZOHJBdlN1M0pUR1ViNkxIVXVF?=
 =?utf-8?B?a1VNcXUwYitHSm5BQTU1a3ZMS2ZVZlJ0a0ZwTjBPVTg5ejNlRVBBVG1nQzc4?=
 =?utf-8?B?cW9ETkx6Y0UzREZaY1NPT3VjUWtvN2tLcTlyazQrK1ZQeG5peW10NFJ2UWpp?=
 =?utf-8?B?OUtINUR0MkVyazYxTDNRdWJ6QmV2Yksya2g0R3h4UEg2RUFUeElsVTlMVFU3?=
 =?utf-8?B?NkJHRGZkSmIza3FSWkxIOE9JVTcvZVhRd0ljbk1iU05CTzJwODBhRjh0eElh?=
 =?utf-8?B?d21QWHYrRldlOTdyTlJycDlzRHBLZ3lTYmVEajYvVU9EREV0MkVRUld0RVJv?=
 =?utf-8?B?aTFhUmdkSXgxUmVUWXZwd0U1MTJZcnFkV29DcDl4ZWpraU9JbTlld09DQnRP?=
 =?utf-8?B?Y1JLcVlSK0pGZTRYd3p5SlFadnZzTGNJUzdNbmtEZGJiM3ppdEcwWFc1Zm9U?=
 =?utf-8?Q?2M2B3KDW6no=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlNUaENVZDlucmRoUFhyaHlaYWhvTzd3OWNqUXBWNXZhUytadFZFNGlXb0Fi?=
 =?utf-8?B?YkI1Y0RRd2tRbXVoL0Z3T3FoQkZ4VEh1dDhhbnlPOENTMCtvSTUwZGZqbjJX?=
 =?utf-8?B?VnhGc3QrLzJqNWJMR0ozeGhVOVdyalNISG92VjE2bXZRYVRna3FxcGFCcGQv?=
 =?utf-8?B?YStjZUFQRlN3ejBIcTdmTTdDVDJLZUhIQ2wvN3lzVVpWbWVTY2taWVhyVmxx?=
 =?utf-8?B?dlRpa3VGOEdCVUJFc1g3bHJQUTFWZWdCMlpTM0NqcWwxVWdHSXZoU1FERE1p?=
 =?utf-8?B?cnlmbyszRUNUUXpuRDdDSlZ5OWlUYUtzeUJvK2RIcGRMZ2dBU1JMaFRvN0Fw?=
 =?utf-8?B?SUJBL0tpRk5GbmxqZy9GejVCRmtFZ3NsWnlSU1l4eDB1VmF0WU1WUldNalFV?=
 =?utf-8?B?VlZINVF0QUc2QXg5OXNGQkpBbFZBTDdnc2pSRG01MnY1SGs3cFBMUzgrRTFZ?=
 =?utf-8?B?U0NISDZLakJaYmRUVWM2a3FGMlN5UUpTRnEzZEpNbkhlU3BqNFhyY2J0b25D?=
 =?utf-8?B?OGNuR1RuZGFnT2F5aEpPN3p5RDBDanZBT3lsaHA5Nis1OWp3ZHMvL0ZDUy8r?=
 =?utf-8?B?MHlwcG9OS3lUaTEwdDZLU1VRSytrR2FXbTZxTW43b1FEUkQ1eWR6UWYxNEha?=
 =?utf-8?B?bklVSTZnUm9UMXJxdTQxY1BOWVFpWnpQZEc4bVBwQUovQVladXoyYUxMUndX?=
 =?utf-8?B?a29JOHg5VWVKSnVTN1QwNmUrL2dobWEwR1BXUEtQRW5OS3FCZU0yRmI3VHhq?=
 =?utf-8?B?Vmt5eFVHKy9VM25zVEZsVlZmSGtBR0psOERITHo5UitxNnhJYVZoYTlBeGR2?=
 =?utf-8?B?VHNyUnR2TW1TOXpIWUlGS09ic3ZWUVVocS93Q21BemxvaHA5RzROQnZ0MDZu?=
 =?utf-8?B?NmNIejVVR01zYUhrcFh4cU5SdjgrdmtqK21XTTQwNHRSWEFtUDZrbEVvcTdV?=
 =?utf-8?B?UFJiMUp1MnljUUFVOTU5bFVhVUZaenE3Y0hpSzdUMWc2K3ExWFdGMTcwRER0?=
 =?utf-8?B?RjlCblE1b0oyUHkvWnhSMk1JZE0wNHlkcFh2K09LMzZzc2lDdTRlWWQ5NGV3?=
 =?utf-8?B?SVBGVFFvSkFyNHRoVC9XUVc0SW9zeWJ3dmlZZ0NVUXdDaDNaUS9DT0lObjRY?=
 =?utf-8?B?R2VjUGRZSzhKSG44K0pBZGpNMVFaeE1mWDkwMjd1akRraDV4OXh1dmdWd0Qw?=
 =?utf-8?B?YkZlYldlb1BkamZkdkdKeTk5a0ZwbkJRTHRzMnpic2dHcU53SGhXQlYzckQ5?=
 =?utf-8?B?MHVFaEdkVmZhK3Q3Z3dMeWlBMXVCcUR2ZW10V0szWk5WU3ZISHNMTkVIdWFJ?=
 =?utf-8?B?azh4Qll1Zjh5cG9LV1BFOGVjd1E1NVphMGxWR3FJNm4rZ0RoODhjc1lHcXpp?=
 =?utf-8?B?WlBuN3VBcHBRd093SkVmTkFPbTlQRFRRTVMvaFJTVllveDdKWFhicnhYZWxQ?=
 =?utf-8?B?UFdRclEwU1JrMVhjQlFqMUNiWkZidWRMYVdreHBpTldXQkduUFdvMWl0RUNK?=
 =?utf-8?B?OHlObjhDem16c1VZaHZxdDM5SW5BdHBZc3lyK2I0alpyYjNYeDBNZkphRlpl?=
 =?utf-8?B?M0NnZnkwWWY3czg5NmVaNCszQUxONzNpeFpCS1FlMFB0VE1iK29XMnk4aExo?=
 =?utf-8?B?TFJtbTdHRHJTWmVtbnA0SjdGZXRKYkp2RERnM21iaVNMV0NZcy9GM1JJckxo?=
 =?utf-8?B?cURqT1JlSCtaYXEzeEpFTE1weDBhelVxRHFnOVJnUkNXZk9WQnRhU3VmLzRL?=
 =?utf-8?B?dlhDY29LemR1cloya0JZUExLdmx0RzNYN0JNOWpzUTJsMkVlSnc1eXFBQzkv?=
 =?utf-8?B?b0FRY1ptaUJhT1c2SVJrTGNjNXp0clRKdHJrUzVGZGpGUHpVQ0VuZm9VNThP?=
 =?utf-8?B?SnltcVJsTmZzRVA0ZnRxeDBDNklLSDk1Tk5BcXlFQitBVW1LaDFIdFE5N081?=
 =?utf-8?B?ZkMwOG1hMWV6K05ETUFhdklzWEdPaDdhZ3MrMGRJV2xTV1E3bDFzS2NHRXhr?=
 =?utf-8?B?SGlzUGlvemU4RFdUNytadDZpL1ptUDlEc0l0aXBnWlRHUktCbXJQTTV6bEZC?=
 =?utf-8?B?YU8xZldEbDdEaGltWWxLdFI2aDQ5TS92aFVZMTRwdVA1dXNlMmwxcy85MkQz?=
 =?utf-8?Q?IOzuMahJ7wt7X0qec3r+6LgK3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e0a125e-5187-495f-50ec-08dda99dc3fd
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 10:42:02.3833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o1Jd6KKIzwTTNSmgr8KpSG7pO1Eo9G30vQB1Gb4mDTeleVbUU0E921je9vWOVMkPqAODTN5bHIULLQQMsGE5eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8903

On 6/12/2025 3:00 PM, K Prateek Nayak wrote:
> Ah! Since this happens so early topology isn't created yet for
> the debug prints to hit! Is it possible to get a dmesg with
> "ignore_loglevel" and "sched_verbose" on an older kernel that
> did not throw this error on the same host?

One better would be running with the following diff on top of v6.16-rc1
is possible:

diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 9026d325d0fd..811c8d0f5b9a 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -2398,7 +2398,7 @@ static bool topology_span_sane(const struct cpumask *cpu_map)
  {
  	struct sched_domain_topology_level *tl;
  	struct cpumask *covered, *id_seen;
-	int cpu;
+	int cpu, id;
  
  	lockdep_assert_held(&sched_domains_mutex);
  	covered = sched_domains_tmpmask;
@@ -2421,19 +2421,21 @@ static bool topology_span_sane(const struct cpumask *cpu_map)
  		 */
  		for_each_cpu(cpu, cpu_map) {
  			const struct cpumask *tl_cpu_mask = tl->mask(cpu);
-			int id;
  
  			/* lowest bit set in this mask is used as a unique id */
  			id = cpumask_first(tl_cpu_mask);
  
+			pr_warn("tl(%s) CPU(%d) ID(%d) CPU_TL_SPAN(%*pbl) ID_TL_SPAN(%*pbl)\n",
+				tl->name, cpu, id, cpumask_pr_args(tl->mask(cpu)), cpumask_pr_args(tl->mask(id)));
+
  			if (cpumask_test_cpu(id, id_seen)) {
  				/* First CPU has already been seen, ensure identical spans */
  				if (!cpumask_equal(tl->mask(id), tl_cpu_mask))
-					return false;
+					goto fail;
  			} else {
  				/* First CPU hasn't been seen before, ensure it's a completely new span */
  				if (cpumask_intersects(tl_cpu_mask, covered))
-					return false;
+					goto fail;
  
  				cpumask_or(covered, covered, tl_cpu_mask);
  				cpumask_set_cpu(id, id_seen);
@@ -2441,6 +2443,16 @@ static bool topology_span_sane(const struct cpumask *cpu_map)
  		}
  	}
  	return true;
+
+fail:
+	pr_warn("Failed tl: %s\n", tl->name);
+	pr_warn("Failed for CPU: %d\n", cpu);
+	pr_warn("ID CPU at tl: %d\n", id);
+	pr_warn("Failed CPU span at tl: %*pbl\n", cpumask_pr_args(tl->mask(cpu)));
+	pr_warn("ID CPU span: %*pbl\n", cpumask_pr_args(tl->mask(id)));
+	pr_warn("ID CPUs seen: %*pbl\n", cpumask_pr_args(id_seen));
+	pr_warn("CPUs covered: %*pbl\n", cpumask_pr_args(covered));
+	return false;
  }
  
  /*
--

In my case, it logs the following (no failures  seen yet):

     tl(SMT) CPU(0) ID(0) CPU_TL_SPAN(0) ID_TL_SPAN(0)
     tl(SMT) CPU(1) ID(1) CPU_TL_SPAN(1) ID_TL_SPAN(1)
     tl(SMT) CPU(2) ID(2) CPU_TL_SPAN(2) ID_TL_SPAN(2)
     tl(SMT) CPU(3) ID(3) CPU_TL_SPAN(3) ID_TL_SPAN(3)
     tl(SMT) CPU(4) ID(4) CPU_TL_SPAN(4) ID_TL_SPAN(4)
     tl(SMT) CPU(5) ID(5) CPU_TL_SPAN(5) ID_TL_SPAN(5)
     tl(SMT) CPU(6) ID(6) CPU_TL_SPAN(6) ID_TL_SPAN(6)
     tl(SMT) CPU(7) ID(7) CPU_TL_SPAN(7) ID_TL_SPAN(7)
     tl(SMT) CPU(8) ID(8) CPU_TL_SPAN(8) ID_TL_SPAN(8)
     tl(SMT) CPU(9) ID(9) CPU_TL_SPAN(9) ID_TL_SPAN(9)
     tl(CLS) CPU(0) ID(0) CPU_TL_SPAN(0) ID_TL_SPAN(0)
     tl(CLS) CPU(1) ID(1) CPU_TL_SPAN(1) ID_TL_SPAN(1)
     tl(CLS) CPU(2) ID(2) CPU_TL_SPAN(2) ID_TL_SPAN(2)
     tl(CLS) CPU(3) ID(3) CPU_TL_SPAN(3) ID_TL_SPAN(3)
     tl(CLS) CPU(4) ID(4) CPU_TL_SPAN(4) ID_TL_SPAN(4)
     tl(CLS) CPU(5) ID(5) CPU_TL_SPAN(5) ID_TL_SPAN(5)
     tl(CLS) CPU(6) ID(6) CPU_TL_SPAN(6) ID_TL_SPAN(6)
     tl(CLS) CPU(7) ID(7) CPU_TL_SPAN(7) ID_TL_SPAN(7)
     tl(CLS) CPU(8) ID(8) CPU_TL_SPAN(8) ID_TL_SPAN(8)
     tl(CLS) CPU(9) ID(9) CPU_TL_SPAN(9) ID_TL_SPAN(9)
     tl(MC) CPU(0) ID(0) CPU_TL_SPAN(0) ID_TL_SPAN(0)
     tl(MC) CPU(1) ID(1) CPU_TL_SPAN(1) ID_TL_SPAN(1)
     tl(MC) CPU(2) ID(2) CPU_TL_SPAN(2) ID_TL_SPAN(2)
     tl(MC) CPU(3) ID(3) CPU_TL_SPAN(3) ID_TL_SPAN(3)
     tl(MC) CPU(4) ID(4) CPU_TL_SPAN(4) ID_TL_SPAN(4)
     tl(MC) CPU(5) ID(5) CPU_TL_SPAN(5) ID_TL_SPAN(5)
     tl(MC) CPU(6) ID(6) CPU_TL_SPAN(6) ID_TL_SPAN(6)
     tl(MC) CPU(7) ID(7) CPU_TL_SPAN(7) ID_TL_SPAN(7)
     tl(MC) CPU(8) ID(8) CPU_TL_SPAN(8) ID_TL_SPAN(8)
     tl(MC) CPU(9) ID(9) CPU_TL_SPAN(9) ID_TL_SPAN(9)
     tl(PKG) CPU(0) ID(0) CPU_TL_SPAN(0-1) ID_TL_SPAN(0-1)
     tl(PKG) CPU(1) ID(0) CPU_TL_SPAN(0-1) ID_TL_SPAN(0-1)
     tl(PKG) CPU(2) ID(2) CPU_TL_SPAN(2-3) ID_TL_SPAN(2-3)
     tl(PKG) CPU(3) ID(2) CPU_TL_SPAN(2-3) ID_TL_SPAN(2-3)
     tl(PKG) CPU(4) ID(4) CPU_TL_SPAN(4-5) ID_TL_SPAN(4-5)
     tl(PKG) CPU(5) ID(4) CPU_TL_SPAN(4-5) ID_TL_SPAN(4-5)
     tl(PKG) CPU(6) ID(6) CPU_TL_SPAN(6-7) ID_TL_SPAN(6-7)
     tl(PKG) CPU(7) ID(6) CPU_TL_SPAN(6-7) ID_TL_SPAN(6-7)
     tl(PKG) CPU(8) ID(8) CPU_TL_SPAN(8-9) ID_TL_SPAN(8-9)
     tl(PKG) CPU(9) ID(8) CPU_TL_SPAN(8-9) ID_TL_SPAN(8-9)
     tl(NODE) CPU(0) ID(0) CPU_TL_SPAN(0-9) ID_TL_SPAN(0-9)
     tl(NODE) CPU(1) ID(0) CPU_TL_SPAN(0-9) ID_TL_SPAN(0-9)
     tl(NODE) CPU(2) ID(0) CPU_TL_SPAN(0-9) ID_TL_SPAN(0-9)
     tl(NODE) CPU(3) ID(0) CPU_TL_SPAN(0-9) ID_TL_SPAN(0-9)
     tl(NODE) CPU(4) ID(0) CPU_TL_SPAN(0-9) ID_TL_SPAN(0-9)
     tl(NODE) CPU(5) ID(0) CPU_TL_SPAN(0-9) ID_TL_SPAN(0-9)
     tl(NODE) CPU(6) ID(0) CPU_TL_SPAN(0-9) ID_TL_SPAN(0-9)
     tl(NODE) CPU(7) ID(0) CPU_TL_SPAN(0-9) ID_TL_SPAN(0-9)
     tl(NODE) CPU(8) ID(0) CPU_TL_SPAN(0-9) ID_TL_SPAN(0-9)
     tl(NODE) CPU(9) ID(0) CPU_TL_SPAN(0-9) ID_TL_SPAN(0-9)

-- 
Thanks and Regards,
Prateek

