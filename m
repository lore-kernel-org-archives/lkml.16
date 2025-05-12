Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A907E29712B
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 19:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.145.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747078796; cv=fail; b=Pi1O+mzNZ67XqvPEL8yUt4YyUlFllN00VYyLI8j/JfaaGzgzwfCqh9X2xEP12TO31IxoosdMuB6pMCiPUvJrc8qgO1zK9JxESA7UD8YBX7KA8L47Qdu80/YZ6IgzIeexZq3LeSemEPEevwLZAKF/u0k4HgAe7LFfbfVGI2wgebo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747078796; c=relaxed/simple;
	bh=XJGSagafOM5h0KlpIMqxtq0uJW6vd/O+mg6vtnrVEn8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=e6IIP0KvGakhX2JXyRAB3pmWBk/CRvYqJmbWbMUhqBad3AzIt293FLFtGXyK6CNlRUmwoPeC1xbIsuqpULcd9CY1n/b/qNqxESO0taYiRx9yqnMzd6U84XCwMUjels0DgNad3Y4hmbna42O0aQLKi5bWQx8s7DTq2u4j/XgHo98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=Ku6grjlO; arc=fail smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="Ku6grjlO"
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CIeOgA026251;
	Mon, 12 May 2025 12:39:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2021-q4;
	 bh=XILH/ssN49atl6Fl3x/tggkI+nCYRx1oUcujav2ggwc=; b=Ku6grjlO7BSV
	fpiIzHkh5wRvSGXkrj08metBit/njokQ4kmoZ+JbaDQmYvrkOibyNr/xEWD3v2xa
	FQMjA3/IrPHSrRNLBXemBnEcuTVttyu2ItaFYJmmfgADJCbVR/kx2lj5hghwSPJh
	l4mzopolKluyj2E0viyEbstjGMzCfDI/T3MdzfZR3bXLUdkLgG3DaJ1O7PYYhyWK
	gvofeVexFxjxJb0QwJMsfWaZaDcMnKgu8i8FYPyZPmMAeTEBOwkFnxTnt4HP+ojQ
	8lfwU7aPvF56HC7Rg1hwml8AE1eqr2WtAZmkkebIb8nD9nupcq8ToxrZkYRkI1JZ
	zSbbClFWuw==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 46kpfcgf84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 12:39:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VbEzZCd+NZZ8jThLqripKviWMgQoI3rppgOb3Iza+QUosFEJpJbG0axrmQuP9yNshg1aq2we0PWVV3N/wlClA7banqY6qjFktYl3+J4hkDOAgFOSoO5hsYVS1lNVTwZDZOUsGewn+Wh0TCniVxYURBvHXoHSwYMs/tL5adgYV9UiL5NRUPU5koH/zDAgI7GTctJ5uAJuUS5QX5RZ9ux3nG+J+LKk3Oz6ZcM5l9PzP8NAzwZ1X/nIguIUaGQ8GLbf/l19eWYU0pbeIzecPVJ+83MrURrfU8CCcJSQMIMTdhCG5azm4RoKOiwV4dxsU+hlnoGYGCwqT6mbRMZREKhN8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XILH/ssN49atl6Fl3x/tggkI+nCYRx1oUcujav2ggwc=;
 b=lX4eeOi5PX+9+rJE7M1aqXXGeVwsC41QxDB11aerq67crHHoDIsxyAGu6w4EzNs16FoZ1Ptt59Dgiplg61jYKX4DlcdnQSgPBzwSv8vlcIhKJucBDUDAQi0K3jsuZ7Q1bnEk+OU527md/GSyqiT0qaTk3Ox/BLG7dDmzHPuqEsxCzXJdyrZwPyJ8IJg8YgZwWr4PhRlBANY+SjOq6SCaPDTjS05F3L8kLksoJY5Vbfh0+K0Xlw3PWwgVtWrIdbLcKr3AcI2g/AgEUmSdDnHhdLXFTFtddFQe2wPugp9ceuG2v0KGdYfQ8dZZL/FUSivV+UBUxc6PFIBvT8ewh69ZoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from LV3PR15MB6455.namprd15.prod.outlook.com (2603:10b6:408:1ad::10)
 by PH0PR15MB5085.namprd15.prod.outlook.com (2603:10b6:510:a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 19:39:39 +0000
Received: from LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::595a:4648:51bc:d6e0]) by LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::595a:4648:51bc:d6e0%7]) with mapi id 15.20.8722.021; Mon, 12 May 2025
 19:39:38 +0000
Message-ID: <2f394a01-1cd9-4719-9394-647d8731cf3f@meta.com>
Date: Mon, 12 May 2025 15:39:31 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: scheduler performance regression since v6.11
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
        dietmar.eggemann@arm.com, vschneid@redhat.com
References: <1e3c711f-8c96-4c39-bbe2-7742940d1d31@meta.com>
 <20250509194955.GA25798@noisy.programming.kicks-ass.net>
 <20250512180846.GA25891@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Chris Mason <clm@meta.com>
In-Reply-To: <20250512180846.GA25891@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0206.namprd13.prod.outlook.com
 (2603:10b6:208:2be::31) To LV3PR15MB6455.namprd15.prod.outlook.com
 (2603:10b6:408:1ad::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR15MB6455:EE_|PH0PR15MB5085:EE_
X-MS-Office365-Filtering-Correlation-Id: 825ea12d-5376-4bf6-3855-08dd918cbbb4
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YzZlT1FSV3FMSVl3Q3RLZEF0bWJXQnh3L2g5MTNndy9UcmZsOHRuL25IUzUr?=
 =?utf-8?B?anBLQzlaS2xsVCtHV24wTU5OTGdtc0VLU3lGaW1rZ0NHYjEyV1U2SWU2K2Qx?=
 =?utf-8?B?V2hLaWZxYUVlSVk0MjA3bjZRM3BVNVgrMjdZbjlNc0RiZ21pdG4xV2hVZXo4?=
 =?utf-8?B?QWJsZXVRZUpPY3ZwakRheFVhZHB4dUZYNEVrN1JJT3V6b240RVg3YitmVHNS?=
 =?utf-8?B?bnJUeEM0Ymd4S1NEOVZzQ0wvZkJUS1M1WlUvdnc4WWg5UDcyUzlvbCs3bTBB?=
 =?utf-8?B?a3VJM3YzSSt2NllKNTE4T0QveGtuNHB5aTNZczVDbk5zczRsNzkxMG1QbXhT?=
 =?utf-8?B?Z3o3bXgzZi9Tank3MVQxU2dqR1VIbWhGaEVOTXZmQVBkUjgweVFnWmhSNzYw?=
 =?utf-8?B?aU5LRmhXYktZcGxBZERBY21DNXhlcXFMMVJ2OXNZaENhNTk1VlUzcWdnbld4?=
 =?utf-8?B?N1NRSTc4WWJnWFJaZDBNb3lPRU1jUWFuWmZTVmdrSlJ2WmlQOXRMSnBhbHJS?=
 =?utf-8?B?ZHdNUnh5Q3ZPbkdDYzdUVkdqQTk2S25GbkZpVFFRenphT2VJckVKMDRhZkg2?=
 =?utf-8?B?Y3QyRmJXaFhkMXUvWDhwbHcvKzlBeWFxY0tOOFd3azJKMmhsczZvVWR0N0I5?=
 =?utf-8?B?cDJkNWo3azVpcW9zaGd1OGxtd2ZsYkRJakl0TUl6OFRCVGc0RmZxRFlVNTRp?=
 =?utf-8?B?clZBR3dWY2lHUHI2MFZGYnpuTHNNMmU4UmpWT3F4bUZZY3ZnVnozTlRMTEZw?=
 =?utf-8?B?SUtPcHZ5WmJ4cEZXajRJbTZkbU9OVXZOelljUHZmcGYrT29mZFZJc1ZjNEJ3?=
 =?utf-8?B?bk1nQjlHRkwvSWpsd2FWS3dSMSt6dkdqbEpEOWhtdkNuMGlzOHA2cHg0ckhE?=
 =?utf-8?B?RG5RYWtpLzFmZDRiVXJtcjI1NCtyUjJWR0lGMHc0WmhUbGd5T2w1N2FIOGZx?=
 =?utf-8?B?TUl5YWpBemxoc0twWGxiQkFyNjc5MmpxZDVMT3NRdWFJQ1pxdWpsUFNHaFFa?=
 =?utf-8?B?cWdiTHl3NnBtS01mQVhuMUhmTnhTZ1JSV1RFWmFIY2x3bkFhQUlhU21BaEY0?=
 =?utf-8?B?SnkwRGhtdk9vd29nd3Y1cDdxYThBTTNkekJBMGFHT0FDM2NtZURsSkRBU3Ew?=
 =?utf-8?B?cUpuYi9PbnZBYlpENkUrOTV1a3l3QlUxZDlFcHRzOUIrRVlnZ3AwaEU4RFBz?=
 =?utf-8?B?dlJYalpKUkVBK21NMzRHUTJLQ2syREM3OGZpY0hEc1dRSU1sc2ZPMFo0Y3R2?=
 =?utf-8?B?QVdFZkJtSHFVVUdQNnZkUHNaRFNPVVFrQUNrcnJtdkl2WTM1ZURxSENGWGU2?=
 =?utf-8?B?MS9HOFNZMjZndVFEa2I1cEF0QVFCVE5wZzJCQjAxZkJDTW1QNjV6ejVFbGwx?=
 =?utf-8?B?cDAxNW5zZzQraXRSNnV5WDZyMFlBbWxXWVdrSTJaY2hteWRNNkRxd0FxRWpH?=
 =?utf-8?B?WW9PTm5nKzNrUFRBTTg3d2toNWFlVVJ3YzRYU2orMXdNc0Y4UUtVbTFoa0dl?=
 =?utf-8?B?emhwZCtHK0JNdlZnN0ZxWFYwU0pnZXVBYm9jOUsyVHJvL0NpM1UrSk1hVHg2?=
 =?utf-8?B?R2Q2UWtaYm9DcXFqd1lxSnBEdDRDRWd0QlQ5bUdYZ2w5SU5rSklUV2crY0dB?=
 =?utf-8?B?TTZ4VmViWmZUREhyQ0tIUHRCT0Z0bjZaL2tpeHExd2ZtakovL0RwYkxGNUVm?=
 =?utf-8?B?K2tYSnVmM0VyK1dwNDYwdWswOWlSdXVYbFErbURBdnZFdXlSUDVCZGNhblJq?=
 =?utf-8?B?WVdyM3FITHpKOGx3TklxMnZrS1I5a2tVamcwMFlsZ0c5N3NaY0FmS0ttdmdm?=
 =?utf-8?B?dWNIRUhKMHc1VFN1ZVMvRHRsRld5ZG54bjQwZ21udUtDc2VUQmRCNFVpbTQ2?=
 =?utf-8?B?aWZoTy9qMGJJbW9qYkFBZjlyMEhBbnFhMW91NjVKNEkrem8vbkY5Y3ZIb0ZX?=
 =?utf-8?Q?3oD/zxBDptA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR15MB6455.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjVUU2lscWs5bFk0V0hvcHJkQVdtUmdGSlZHSngxTE14dVQ0VkcvaHVwUUJK?=
 =?utf-8?B?S1JnRml2VDIvUGNYa1VvRWRZWklwV1hCN2ZWejEzVCsxOUozdEVSeVRYekRl?=
 =?utf-8?B?eUR4YU9VcUNIVm5uWHFSWXhVVzhEUGdNZWZtU0NTVnMvckFCUEVtK1RIVUly?=
 =?utf-8?B?Zm5RY0dyTXhVNzZrZkExQWdyWWQ1bjdrQ1hWY3pBOVV1SWdGSWRqRm5nMFVK?=
 =?utf-8?B?OTZzekQ3SmcwM1dqYU9OQ2pmcFNNVjFXcFdjcmNSVCtDRm93ZWQydGkydG53?=
 =?utf-8?B?VWVvU3JXbDg4OHc2SzQxNTkzbGdkKzZHc1ROR3FHTWIzUC9BNnhUUSt3VHhr?=
 =?utf-8?B?aitTYlV6UUV2dmYrcjB5Z1N3ZnRrYU40K2hRc2tNbzhRdlYvcVduYzE4UjVD?=
 =?utf-8?B?WTBUUVRONGRkVkRpbUt5YXdGVWRxYTZkemI0K1UzSENWK2NkNEl0WW5CR0Vl?=
 =?utf-8?B?dkFLeE93VUFzUnZRbU9QWDI1Z0ZTYXVQTVBMbG1JTmJUalA2a3UzcWJYVlI0?=
 =?utf-8?B?dkxKTkZDNDJxeC9YeEVmRDlsL0ZZc0JOUUlqQUFTbmluQ3FzbEFSbDQ5Y0dN?=
 =?utf-8?B?RFY4L09BSkMwazE0R1NFaFhsY2MySzZZajZjNkw0a3NOZ2pFelRDengwK05I?=
 =?utf-8?B?bkE1aG1aSmt4em01dEZqUm4xRnpCMWgvOUZQc2MweWJrTmtXUG0wR09Hb1pa?=
 =?utf-8?B?TkZjbEw1UHY1cFRhS2lSeVFKbFF5SlFHeGF1MGdzdWhZZnJkMXl4ZmlBSS9o?=
 =?utf-8?B?bFgyMEJkL0IvRjJPd3lMQ3JRdTRmOU9nem1vWlBSdjJCaUIydWFKbTE2OTVx?=
 =?utf-8?B?bVIzdzA5MmMrV1VSbERHL3k0SXZBWVdCZHA5N09lclRYckV4OUt1RUVLY3RH?=
 =?utf-8?B?aHhONHRvK0RDSmp5TTFld2ZjZkFMOHkvT3lSaGlYUTV3Z3BQR3JxaDhuQjZu?=
 =?utf-8?B?ME1qT0R3UE1sd1lwaFdLdUxKWjdNVzRGaGw1UDV5cHNScGxtR3FvQXNzdWNE?=
 =?utf-8?B?ZitQUjdGZG5vM0NTeXFKOEhVdTBOTWUvZGdRM2VmRzJtdDNEWCt0UGJybjhS?=
 =?utf-8?B?cFlQVWNrc01LNmtCTldxVERuZVd0cGhMd1NqWUg1RUpIUTBXZzNnTnNGa1p5?=
 =?utf-8?B?U3RFbVA3MTFlSHh3WmFWZDBxVUIyaDg0RnpvWGxkMmpYdU5GUW01clZLZWJN?=
 =?utf-8?B?SjM1cFQxRGp2MGFCaTZFSVNRWWhJYzB5bkpDSm45a01Vcm0rS085dXBqdTlN?=
 =?utf-8?B?QnNqR1Z0THI3cENqWnN2Qm5nc1pXT3RsNWlWczU3cDl0enJ2ZGE1NXhDT0xS?=
 =?utf-8?B?eHRYUkwyZ2hWWW15L1MxVG84RmNYZ2xZcTgya3UzWENZaGdNd2QyRlVMQTR5?=
 =?utf-8?B?QVFyMHc1TFZtbjVmQlhEeTdOam14OGhyQmZsc1YzM1IydGZiLy9JbzY5Q1hZ?=
 =?utf-8?B?TVNuSnU0VG8zWTNVdWNTZU4wV1N2aDV4aWNQbDJXekU1dDVWSllNdUQzb0Fm?=
 =?utf-8?B?SUNLOEJ6Z3hYUUROMzkxY0ZlbURTQk1pT3pkSUhmL2lEK2wwUk5mNmhHeUlR?=
 =?utf-8?B?SDFINzhXNFhwSWd2Q2xCY01lTWZ6SkVMdUJncHRJR0xwWXlBVkwwY3hOQXdr?=
 =?utf-8?B?SkgvMWo1VGw0ZlFFSmNGSTRtWFdjY2RyTER4UVlEbUZUNEpqdVVQWlVSRXZZ?=
 =?utf-8?B?WmUyTkF0d0xzelB0UzRuUkdSODh4eXRUUnpqaXBXclpBWkVqMDVFcEYzM2d4?=
 =?utf-8?B?ZWRkZHhzcktEbXYvcnZUcHZ1Sjl3RVI5TlptMDFZOVdjUGY1T3JrMXlrUU1p?=
 =?utf-8?B?STdVM2x6VTRLZlUzV0RFRTdKb2s1TGR3QVpiSTM1OXQ5ZS9hdnFMWmxkMk1K?=
 =?utf-8?B?OHREc3FlSWpacXQ0cThaSGVKZWVJenA4S0pOUUlUS0crT2l6UnNMaE1qMTZt?=
 =?utf-8?B?cmhRTHlwVXROTStrV3ZaMVJwTnBPSTBheXFabXdESGtaWlpkZ3kva3g2Rks3?=
 =?utf-8?B?Ui9SaGE1SHlna3BQWmZXMUtNdFh3dHpWSEt3ZC9NUmwwOEFnRGc4UEZDUHJo?=
 =?utf-8?B?RVN3NW1QQjh3c3B2RWF0eHh6RVYzVmVBN0c0QWhybGtoR0ZuTzlkczN1Y0tv?=
 =?utf-8?Q?txnc=3D?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 825ea12d-5376-4bf6-3855-08dd918cbbb4
X-MS-Exchange-CrossTenant-AuthSource: LV3PR15MB6455.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 19:39:38.8508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cci3yyOzXgzyxxTElE8/5qDwu/UjYv+FEc9qyo03iqq9Cojbw3bnMpvJbtWrfSC/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR15MB5085
X-Authority-Analysis: v=2.4 cv=brVMBFai c=1 sm=1 tr=0 ts=68224e7d cx=c_pps a=wMNeujlvNozESTkKEiiyVQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=60iUz7s6z2LQU-OGDTgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDIwMiBTYWx0ZWRfX1GROPZ5GuHjB W0H8EAAsHdjsnbw6imAGya80lGQpTHCIhiZl30WaEWIl+PGLiB9aKhIyr+dDfba1iD3dRt4ESIv tnHIqGr5qav8JYKTvcQFlFyhQK+Gm8VPGRQeR//EEZtxtUmKevuKT+ykXfPJW5TMKJwN3SHGmGn
 EJzKPU3S9k5PARrjzTlSLU/U48rM2ZnbBcD9PLmlRrKa/4mtgQ0piUYIU3jHoM7l+1z4q4GLteQ pxj+mvXzKR0GSWHX8GDkhvFgb4qSgNkPcpRPuWv2SyPomql+uQmkZrcC9GR0B7nAVs3jhPVAYHw VpzF8hkAJqLXKhOba61p8wgXn8LNINwgyug7D1RbS9wU6QiMlpa/lU/1Zm4SyiRFjBPrcnsu2Aq
 cXcIF9zAQaNvEN/mIvpF1UxM5tZiU5Nsbecnc7a40dmlKOQZcYdL2BI2B4tjKhEVTusXNM32
X-Proofpoint-GUID: WDkYcmBsR7pBdvmmnuK5qcAOzg-RLauh
X-Proofpoint-ORIG-GUID: WDkYcmBsR7pBdvmmnuK5qcAOzg-RLauh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01



On 5/12/25 2:08 PM, Peter Zijlstra wrote:
> On Fri, May 09, 2025 at 09:49:55PM +0200, Peter Zijlstra wrote:
>> 152 729288bc6856 kernel/sched: Fix util_est accounting for DELAY_DEQUEUE
>> 	average rps: 1936829.47
>> 	average rps: 1950715.10
>>
>> 153 84d265281d6c sched/pelt: Use rq_clock_task() for hw_pressure
>> 	average rps: 2176857.32
>> 	average rps: 2223004.23
> 
> So, a little more data on this.
> 
> The result appears stable, but reverting 729288bc6856 on master does not
> seem to cure things.

729288bc6856 is in that section of commits where the regression was ~1/2
as bad.  (bad: 1.8M, good: 2M, middle ground: 1.9M) I get the same RPS
with and without it.

I called it "good" in my bisect run, but I'll take a second pass through
those potential suspects and see if the bad really starts there.

> 
> OTOH, switching to performance governor completely cures things here.
> 
> My machine defaults to schedutil governor.
> 
> Chris, can you confirm -- or did we manage to find different issues?

My repro script sets to performance w/turbo on as step one.  I didn't
turbostat my way to making sure both sides were actually running at the
same frequency, but I'll check that too.

-chris

