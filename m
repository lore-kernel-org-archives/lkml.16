Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2056.outbound.protection.outlook.com [40.107.95.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7AD1A4F0A
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 06:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739169574; cv=fail; b=TATyDVtlTU+u+GoEsTkOnqSZbfWiN9F9DwMKsJwVAljzibtVssfBm6fZV8aQvZokK6MbYA9bEcKHBXopp0NVUim6IK/9X+OSNvaUKJS6uy+kImChceQrZ3FmgxyOnl6XvngcCaPqINNcYrsLm2lm6hO7iVoapyHL22JY4gyHVe0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739169574; c=relaxed/simple;
	bh=kWmSbo1SESyLelyQ3L/N+FEOcM3+m/Un/JoLyACqJhM=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PRJI1muad7HMcvFhOzwXWkYhvsHU8NmmzaP3TzJdyUqrvc2X/DIwPB8aPzjT4fmm3y0WKUfaSZXOfQceq8UPQqGMZdfowUj0OSAW6DUzqy8DRWMgKWePQ3XTAIkPKSZLTHY+tn2ON0ICPZY9UyktNMoQO2HhNCp2gLtvT2q5Clw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=l0GbheFr; arc=fail smtp.client-ip=40.107.95.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="l0GbheFr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dGux+e1cEv9KSRdOghwi7K0AmhmUuZARZRVuvQW3wq/4nDLbdEFhnwYvHj/Idpa49qE4oDQMfrZ1u/euljEaLSQ86pZnFmINbjGtVJHLlzWLF7CqVGC9qvVM1i/Xc32rmAQ7S8okxgoUKjfd6/I+MTOGL6ChyR7d2iJl420m9FAEFCbuvWwow4vHFoY03Bu2xw+gqR5rc0IHGZP2h8jnamM3lmO7PBFBe+a41G9wZ+abdIm93EoyxtdVuZz/SQkc5ZB6YlmlK+aKw670CnbQfjHo72YeO0/G1miCTKbx7wN/mNmsfYOWEfMAuO9BSdZYQXNFU3PpBM8DZNsHdqxuqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E4+mvwpMqGpt0txW3xzP+743eGrKN713f9xaB6WefHw=;
 b=fg0u2GcBceMC9YQDOP8dsyxwBWVq9uiq7HADA9hpnk/jOX4HtHR/fSS8pVqnJbOEZrbDJ/yXqiBYiD6G9pNW5wOF1CFFYENap1w8+vG23vJMbiTIcFfpj89rXqwXE45XFnbrIQz6Xx9zLQIqrS/T9B6T9SfiMDgBYx5aRq9/Q4ZmiR/uyySiykJF1qaKPQz8AKoA0966rxuf+1+nKHwfbNqDjJl/xOO+t+b0xAA0E9eanPBJi0hVTGg1wPQfXQcbNENakqq93bw1t3Mv0cW5aaDv2NnnihZmf28cBWhy1+SFCpx0WoM1Yf8lwb+davEzwMiMfIvrp3DP2wizG4PGjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E4+mvwpMqGpt0txW3xzP+743eGrKN713f9xaB6WefHw=;
 b=l0GbheFr76Z5/VXBClBb03GSP/jozbHNY3ny+GUx/6/T0M4Cdu/PuhLKLO0c65VH6WsdawYcMR5QK8eoFo3RZ/1LjcRXPltrn2t05ESvqkBbif+KUU+791Ku607xTvd5GOQinjX0byQ87swzXXaCK55VAby4olWZGXRn9F80ZMQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6588.namprd12.prod.outlook.com (2603:10b6:510:210::10)
 by IA1PR12MB8519.namprd12.prod.outlook.com (2603:10b6:208:44c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 06:39:28 +0000
Received: from PH7PR12MB6588.namprd12.prod.outlook.com
 ([fe80::5e9c:4117:b5e0:cf39]) by PH7PR12MB6588.namprd12.prod.outlook.com
 ([fe80::5e9c:4117:b5e0:cf39%6]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 06:39:28 +0000
Message-ID: <72078a3d-4b19-4aa9-bed7-f95362b6265a@amd.com>
Date: Mon, 10 Feb 2025 12:09:18 +0530
User-Agent: Mozilla Thunderbird
From: Ravi Bangoria <ravi.bangoria@amd.com>
Subject: Re: [PATCH v2 24/24] perf: Make perf_pmu_unregister() useable
To: Peter Zijlstra <peterz@infradead.org>
Cc: "mingo@kernel.org" <mingo@kernel.org>,
 "lucas.demarchi@intel.com" <lucas.demarchi@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "willy@infradead.org" <willy@infradead.org>,
 "acme@kernel.org" <acme@kernel.org>,
 "namhyung@kernel.org" <namhyung@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>,
 "jolsa@kernel.org" <jolsa@kernel.org>,
 "irogers@google.com" <irogers@google.com>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "kan.liang@linux.intel.com" <kan.liang@linux.intel.com>,
 Ravi Bangoria <ravi.bangoria@amd.com>
References: <20250205102120.531585416@infradead.org>
 <20250205102450.888979808@infradead.org>
Content-Language: en-US
In-Reply-To: <20250205102450.888979808@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0227.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::14) To PH7PR12MB6588.namprd12.prod.outlook.com
 (2603:10b6:510:210::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6588:EE_|IA1PR12MB8519:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d504309-6122-4871-085c-08dd499daaf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bS9CYWdPWXdqK00rOFg5WU1KVmpBa0xZSGprSnN4RS9rQmg4bS9ZWjZEc3Yz?=
 =?utf-8?B?cTA4MVU0SlkrOW8rMk5RQXFGazhzc0lVMVROUHI2WlkrUm9YMU9KUmFGekRO?=
 =?utf-8?B?YWgxZ1h2aWc4Y3Y0aytuNHEyS1E0bE9HM3hZN3hRL2NBY0tCMVBWaFcxNjkr?=
 =?utf-8?B?WVozdkZmdFBmLys0QmRSRmppQ2JOSE9pZGNJU0JPNGhnR2U2WW9zdlMzMEpC?=
 =?utf-8?B?RE5MYnVtQTJDRzc4bExxZlZYS2U0Q3NOQ2N5M2o0cXBFWmMzNWdaMzExOXNB?=
 =?utf-8?B?QjhZSGhseXcwT01XaS9HZ05pdE42cGxLQURMTm8wRWpzbDZqbzM2Qk9uSW43?=
 =?utf-8?B?dFVZbE54Q251WitCOXBaU010Y3BKUnBjVFYxaGxXOUlZMzBRVXF2UUcxOG9p?=
 =?utf-8?B?VGxWQW4zYXU1T0xvTXdkK0RUbXJ4cUVYZlh1QktIdFBGOFdpVXBkdkpJWXlB?=
 =?utf-8?B?SGlzQlZ6U0pWTmM5dEUwYnVmb3RRdDE4TFc2NEtWKzlDeCtZL2d5TmM4QXNF?=
 =?utf-8?B?RSt4cGYzYnhqYW81WktLTnhYR1NDMHBGdUlOMVZLdjNxQnh6UEZaRk45SWRK?=
 =?utf-8?B?emdPbFlZZDRvNGxNVDFrYTh2VzFEQ0k0Q285dWh1L3l2cnpPUDBraHdjUERo?=
 =?utf-8?B?TmlSdmhScTNSMUtsSXMxcWVEOGZYZEdEQmFpV1UxN1NteEY4azd4bXJESVph?=
 =?utf-8?B?eGRzbWtNc01RN3NJaWJqdGt1Ny90QjJxOTRkR0RUM1ZXbEI5bWhmaWNpYTZR?=
 =?utf-8?B?Ujd5S1lpSk80b1M0Q0JGRDV5Zzh6cW5JZHRiL09hSFhCQzNxZDl2L0hoSnlx?=
 =?utf-8?B?eVFIZ3RxRDlFM3JqYWgxcC9Ha1pYZ0VQSUdTdzZnRkZEb09WTHBNdE84SDhD?=
 =?utf-8?B?WmYzdkhqWnhUM2UxWG5mbVVHdWF2bHBET0c5NVJsQXpRelV0bk5UWGhsTHkw?=
 =?utf-8?B?NlBvN1VEalhhbGdiNFk2ZFloYm5jRmoxVHA2MDF2RE1MVTlabFZvQndFUTd0?=
 =?utf-8?B?ODB0dDQ2SUNjcVNRNWp4dmdZbFNiMkgvSWtmelNOQjBsNkNTZEF3elJoV0JI?=
 =?utf-8?B?L2tlY05IS2FTaUJjZG5uVU56VUJkNThTUTZrUGRiMGRrbXlBRHFPTElwd25S?=
 =?utf-8?B?Q3V6SzA0L2R5a0JJdVo5dHliL1l2K1R2NUYrN2dNYkZTOVNUVHpzaS9mMFBU?=
 =?utf-8?B?SlBBcUp1OFhheGU3WEhVMk5rY2hCdTR2M2NCYThyQk5jTmdjWlh1MVBvV2Uz?=
 =?utf-8?B?dUwwVmUrcWJGb29WMnRMTmI2alEzdUMraGZsajliL3BCdi9zWVFrempDYUpD?=
 =?utf-8?B?RFl2SUhFaEN4eEcxVFF6WEhUYzhTbTB5SXROYVN2Vk95ZzJyUmxoNTQzSFds?=
 =?utf-8?B?bC84Rk5vVXJZbDF2T0NUZm1UZVE1SGk3eGcxZUZDWlRWNHBidlV0TW9FZUxz?=
 =?utf-8?B?ZmtuMnNLeEhFZ2RMMkp0QlJKOFRHRHE5dmg2blQ3b0RXOVdVY0lXRnZUQzZR?=
 =?utf-8?B?VCs0WXA4SG1WN2VpQm4yMU9GemdMRnFZaHBLMVd0SHFYdlFsTWxzY01nUk04?=
 =?utf-8?B?L2dvTVJOcFV5VlBsWWJ6VnliTzlVRlQ2ZklTb2hVZjhYNWx1R0hhVVhjaFRP?=
 =?utf-8?B?WDM5NTZpdkswRTRpQ3Y2c0VrN3M5b1dwREw5RmNkOW1qQVR0YVR2MmxXL05L?=
 =?utf-8?B?NXJJeWVyWmFNbFJ4MVhVWitHVGtWQy9UVE54K3dtZWJpa1gvaElSS090Uk92?=
 =?utf-8?B?TExJOVZkeTh0bndyTkFXMmxYdmh4dm5NWmtncGxMQVRhN0VPVXRyeVhwYVg5?=
 =?utf-8?B?UVBIcjBNNDJmcTgwMldmblZ3cGdxQ1drVnBhZWlxZ1RmMWZsSHZmMUYrT0s4?=
 =?utf-8?Q?OUeZVaizZ/Nhd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6588.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmR2YVNFRzg2aHRXbGFZZ1BCOVl0QnNvOC9aNVlDMklqWUxQN0NRem5vWDRK?=
 =?utf-8?B?NTBMWW9hanhHK0pIY2I0RWFXckhWVGMxcWZXZnJyWEJPcHNwMnlnREtFZ2xI?=
 =?utf-8?B?b2EwamwvYzh0bDgrZ0NXYVJqVVpLUmt6SjBKU1RFQk1WTDBsR2FPNXUxWGwz?=
 =?utf-8?B?YVdUcndYa0ZxbkpMaE1sRDdWdjVMckdmUU92NjlxanZOSUxuNFF0MkFBOVFR?=
 =?utf-8?B?ZGtKeTJxdDBGTStnampWRzYrZURncFhjMmZaU0pxV2xPMDlMVWN4QTdOYUpB?=
 =?utf-8?B?YkxncEdwaE5iakxPN01CQVdISmEyRk1DTEVjN3Q0N3Axc0dmWGVzeG1YS2Zu?=
 =?utf-8?B?N095QXRxV3dTUkNqU2d5TlJlS2hBd0hYYmEyMmRxSlQvMk56UEU3TmhaT05h?=
 =?utf-8?B?LzhDaTZnRTU0QU1UaEErVHRsMnZRYWJQNVBONkpSQmluMzdiTGN5TDlrOVdl?=
 =?utf-8?B?ckFFblg0NUJPZ3pNY210akQ0Y2ZNako4SlpUNGliSEgwN0dMOFhVRlFKU09K?=
 =?utf-8?B?MHJId0tNMGtHN05VV2NPaSt2cG9wUnJ0SVAySlFNaDE5Z0ZVYnJsN1hhbU5h?=
 =?utf-8?B?SThjdFpVb053UEt3VUtHcnJqTHNlZXJ5MlpWYTZWT09MV0xTd1dFQVVRN3BP?=
 =?utf-8?B?eHl0Uk1xN0VwNGoxaWdYUHpaeFBOb3hOTjAxSHMrUHRmWUxUOFV1NVlNem1O?=
 =?utf-8?B?NHJ1WForcHR0YmtBNXVsL05hOVZJUTdOdEt2TFh0NGhVNHhGYU82Rk9aY1NV?=
 =?utf-8?B?T1kzcmtZM1FPLyt4bFhuVVI1dVNXTC9Cd1JtMUNrMVBTWGJoVGFZeU9FVEJ3?=
 =?utf-8?B?dmk0VGFVZlJUWGNaVWM2bjFUVUhDWERxNGZkSEdNblovSnBwczM5alI3MTVy?=
 =?utf-8?B?dDR0elFza0QrU2M4bENWRVhHam15aDcvckJLd1IzZzBjKzUvYVk4MEVPRHJ0?=
 =?utf-8?B?czkzbWxJeXd4WC9OTTVVbDFEWjAvWERTK0JYL0ZqSlJ0dFRhcG5vNER5VEhE?=
 =?utf-8?B?elN3WU84L1luNGtHS0FsWGFlaTE1NWpUVEhMVlJZUklTUlpnOGFTRGNBRVZv?=
 =?utf-8?B?SzM2aExQcStXSTA4cCtUeHpZSTFIdnpGSml3ODZNK2p6eDJjeTdWb2Y4T3Ra?=
 =?utf-8?B?ZUJyVnptM2dBTWgyODZFc1FibVl4dWY5aTdPQisrRjZPUXFWSzBKT01hMWN4?=
 =?utf-8?B?dkttbGp0RDNyWGc0dTJoSHFyNkVvcDFjak8wVnBremNnL0xLaFdROVRrZUcr?=
 =?utf-8?B?Y1Y4bnJFV1RMSHpFbng4anBqQlR6SVloRDRmVDZ1ZDRmL2hlNVJ6QWY0TldL?=
 =?utf-8?B?ajZsb215SDZra0tjT1NWZmVqMjFYZWMrUGtUa1NGOGhoUmIyN2JoTFFzM2tO?=
 =?utf-8?B?Q05ValNvRVhtVFpPNTFxR1NUcjhUQjJ4c1dubUNmK1p4KzR6UjJxdWZnbnVH?=
 =?utf-8?B?cyt4djhha0tXbW1BaVdqZkVob0orZkZhUW01aDJReU5nNXNUcG9iSWM1cmM5?=
 =?utf-8?B?V3RKRmJ5VlRMcTdVaFlnem82YmpIOWpUN3R6ZkZCN0pCM0UzNkpBbzdNb0ww?=
 =?utf-8?B?WEt2M2x1SjIwZU5PbnVta2hPYUh1ejY2c3hlR1pzYmYvUUE2N2o1UWdxNitY?=
 =?utf-8?B?TkIrdG9IM3FmaHJ4dUp4NkVZaEhuUjRYcmxCRTVKaElseHExTno3enYvL0ht?=
 =?utf-8?B?Uk1ub05pRHVJT0Q0dVo5NGphYklIOHFmdXlpdVhMUVhBTzZnRGkxTVZuRkpT?=
 =?utf-8?B?ZHU5OC9Oek5lc3hOTTVBNGp2TTBCRm9CSHJwU1JHME43VFdVaTE4YjR6YUVC?=
 =?utf-8?B?L2JVb1pnWEFDRGZHRDFNbWgvR2M0bk5kLytOMmpmeVJ5M1hCZldjbzBuY2w0?=
 =?utf-8?B?aEdCellMU3hNSE1LSnZEcnRBTzlWTWZacFg2M1RSQkNKU2dQOUd0TkhZUks3?=
 =?utf-8?B?OHRQZmljN0Q4M1NocFNEczBxeVdvRTd4RzBwbzFBdTRhUnZma0ZwcUYrS1I2?=
 =?utf-8?B?YTAwUzNBejlCOGNuNnlIZ0hXL3Q5STBPVCszSnhSOUI4WWRTTW5GaTJIbFpG?=
 =?utf-8?B?ZFhnendqcnVnamdpUHNnV3liK3R6MzJXM1RrUi85b3lkazh0ajhKMXBGR25t?=
 =?utf-8?Q?L4w4Vn/TUohDegUSyAmjmyASn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d504309-6122-4871-085c-08dd499daaf2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6588.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 06:39:28.6679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GWE9OrPANmANPDNYKnqkjk9BRbSZ1dshoKni2geQWpGPdIZcqCuKK+bg9wRRC/6Ms7l9PJf78FotdLmAfoO+DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8519

Hi Peter,

> @@ -1737,7 +1742,7 @@ static inline bool needs_branch_stack(st
>  
>  static inline bool has_aux(struct perf_event *event)
>  {
> -	return event->pmu->setup_aux;
> +	return event->pmu && event->pmu->setup_aux;
>  }

this ...

> @@ -6412,7 +6444,7 @@ static void perf_mmap_open(struct vm_are
>  	if (vma->vm_pgoff)
>  		atomic_inc(&event->rb->aux_mmap_count);
>  
> -	if (event->pmu->event_mapped)
> +	if (event->pmu && event->pmu->event_mapped)
>  		event->pmu->event_mapped(event, vma->vm_mm);
>  }
>  
> @@ -6435,7 +6467,8 @@ static void perf_mmap_close(struct vm_ar
>  	unsigned long size = perf_data_size(rb);
>  	bool detach_rest = false;
>  
> -	if (event->pmu->event_unmapped)
> +	/* FIXIES vs perf_pmu_unregister() */
> +	if (event->pmu && event->pmu->event_unmapped)
>  		event->pmu->event_unmapped(event, vma->vm_mm);

these two ...

> @@ -6837,7 +6880,7 @@ static int perf_mmap(struct file *file,
>  	if (!ret)
>  		ret = map_range(rb, vma);
>  
> -	if (!ret && event->pmu->event_mapped)
> +	if (!ret && event->pmu && event->pmu->event_mapped)
>  		event->pmu->event_mapped(event, vma->vm_mm);

... and this one.

There is no serialization at all these places. i.e. event->pmu can become
NULL in between two checks.

  CPU0:            event->pmu = NULL
                         |
                         V
  CPU1:   if (event->pmu && event->pmu->blahblah())

Thanks,
Ravi
