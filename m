Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BF72D4B63
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 13:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751551054; cv=fail; b=t4rFArGDHWVe09e49hUpu4U9gDHcPJeyniwQkeOQ08AuksEvimg5KcXk6Vq8wxsaIWR7kYzOx2+Zf5dULmm41wBOoHAmekmHeUnOjLrmVpW+7UKy7J1TrsD3lC3x78Zt6N6DZsZU3AEzd+IJ+fAAr8HKuFkuoZL7mbhZSnw7O3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751551054; c=relaxed/simple;
	bh=sBjwzlhrzT89ChxBZDUVBtUxS92b3kP96odXLmqf1+E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=vGKCY5Fr/UedOHSjtL5F4nRy07XM/WfVR7E04vRBUldfY0IETCJKqx/JbbnsM8aLG9Tth45/gFDDjf17rAd54BC84R0GVHKbOEnWQKJGOoxhy3mH6mjbCSnqKR2L2ZQmgjWTCle8BwL6phuZNhzFe9UC2PzGKI+A3D10VjCnYRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WdtqxoBh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Bg1LjD1X; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WdtqxoBh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Bg1LjD1X"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563DZ5x5002374;
	Thu, 3 Jul 2025 13:57:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=cj0p/3MGI1ECqaZeeL/x85H5dAZzXpYYK4wvoy9v02Y=; b=
	WdtqxoBhRtDcsnTQLH4XgtEPCePGVpuo+s7B9VgFzk8rL+EWIuHpeDppKhvFoRgj
	5ZuV88GJ601iQJQw9kguFUxKQ9YXs/IcvjDlqOuQXJH8zd9ZlY8G45MwS/28pq4S
	amOjacXDBuQjoHDKccofqCrlEU8g6YbCp64dIsfiVHHZrLNc3eWnbzGtd3c2xCyj
	d81ilev4j5EEhTC6MKw5elNdz2C1fgD8VZND6QKR7lteeGjgNZMnGaNfm7/n7Xz+
	5u8Q8qUM6wbL/wbqEY76UqFDg4wqSs70xZyFUplU5TQ5bp0vGTJKjNBuGQ9kGfbO
	1nK4oFmDJmEwftIG7xRfAw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47jum80b0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Jul 2025 13:57:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 563DbENb015101;
	Thu, 3 Jul 2025 13:57:15 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ucdx5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Jul 2025 13:57:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m+IoFkFJ0ut64byHmeOO8elzkE4SBasuNP7bpYf592c7oKGQ1MTh2HrWtruPpw7zgWiS8fkx+/OZz4E576h497V6D5wMTEdX/s3iQz2sksbSzAG/kQdi0gG01M8xZBJcJGljtVaCQ13g0LfILhyGyoFWv9VlsT09ZWQuF8FW0hdhBOZmpEWpuzYNx+O0szfRBuLzBQ3PffTaI28T/I6ccT/tc99TjLosaqvUW9D/T3y3olxk0XA3XP47VUh0Y21uoMZfzMtL2eE0MpWC/e7sm9+/yZNCbNbiNuefbOcxbw5ruEzyjqvcR3ubPBeVSDZsHA+FO5rjUYQ7NutgVI0WsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cj0p/3MGI1ECqaZeeL/x85H5dAZzXpYYK4wvoy9v02Y=;
 b=LlAr0afD6XRiWLgbAKkmDbKORFXoMyWKun0wF1xHALBTgIT2R5Qdfuz5oE6vA1ZSgs/IvqzA3HcEZlV08efjIgcIJ9nPn7mxasLsAtuCyiY7kRUWOtyZmgyFcv2V1J+PFMlrHDozLzkHH9g2MscLOFW4txUe3svZELkdTFfPt9klEdXaItOjc22CSmkDHQKdRQ3QOyycfBAxVG4M4/wXWU+nFPqzy52uln2Wf4OFHvDOJgxxvuZe8pIvTtoVtsP7AAxTOZtzENlrhYXnFilhmQllb21UFv1DWmdnfNGfEQUnScCvRHb+HUlT30OM0qHUir9U4xSgstKjPTcSMZyBTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cj0p/3MGI1ECqaZeeL/x85H5dAZzXpYYK4wvoy9v02Y=;
 b=Bg1LjD1X9Typ6rD3dqJog1OVX3ArUZtSYyJhUxxrzfGLzRZoau15x2FnoXV0Py6+tU6BSInxk1c28QxwmzlA90qgy5tF0LLH5RiJ0vABL6vNAbZIgAMZYicPa6LXmakM0dURdxTiMPccsIDBjtjbuar0X7zHlmSCF1WZnOYfCes=
Received: from DS4PPF5ADB4ADFC.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d1f) by IA3PR10MB8273.namprd10.prod.outlook.com
 (2603:10b6:208:573::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Thu, 3 Jul
 2025 13:57:07 +0000
Received: from DS4PPF5ADB4ADFC.namprd10.prod.outlook.com
 ([fe80::2072:7ae5:a89:c52a]) by DS4PPF5ADB4ADFC.namprd10.prod.outlook.com
 ([fe80::2072:7ae5:a89:c52a%6]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 13:57:07 +0000
Message-ID: <0182cc94-c557-4ce5-b245-fb1fd54bc59b@oracle.com>
Date: Thu, 3 Jul 2025 06:57:04 -0700
User-Agent: Betterbird (macOS/Intel)
Subject: Re: [PATCH] sched/numa: Fix NULL pointer access to mm_struct durng
 task swap
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Chen, Yu C" <yu.c.chen@intel.com>, Michal Hocko <mhocko@suse.com>,
        Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Tim Chen <tim.c.chen@intel.com>, linux-kernel@vger.kernel.org,
        Jirka Hladky <jhladky@redhat.com>,
        Srikanth Aithal <Srikanth.Aithal@amd.com>,
        Suneeth D <Suneeth.D@amd.com>
References: <20250702163247.324439-1-yu.c.chen@intel.com>
 <20250703072608.GS1613200@noisy.programming.kicks-ass.net>
 <aGZNTtJuCyHJE_25@tiehlicka>
 <20250703115006.GT1613200@noisy.programming.kicks-ass.net>
 <aGZxFRVxHouLaMPg@tiehlicka> <b4891cca-4da3-4411-bc9c-669118bf825a@intel.com>
 <e944b504-a852-4f07-a514-7dd99e63b888@oracle.com>
 <20250703123626.GW1613200@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Libo Chen <libo.chen@oracle.com>
In-Reply-To: <20250703123626.GW1613200@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0217.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::12) To DS4PPF5ADB4ADFC.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d1f)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF5ADB4ADFC:EE_|IA3PR10MB8273:EE_
X-MS-Office365-Filtering-Correlation-Id: 26963d4e-de3d-44a3-9613-08ddba397f58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Sk5uTi83Q1U0T2xmeXdhcHJpVGJjMGQ0WGM0MnkvNmFueEhvZmdxNDBSL2ta?=
 =?utf-8?B?cWVQSktvYlFRWEZuZGZJU2VsbENISkxKYnhYcFR3Qk5lZDJPdTg0L0swaFA4?=
 =?utf-8?B?cklRaEhVVFNsTXpCaEJCZkprejVwbHpMVzUyTVVGVnlKT01hcFpHaGs3NlM2?=
 =?utf-8?B?OTc5eTgyZ2xuMlB5dll4ZDdsQnN6WENMcDdzODY3U1BLQ3g2bWo5N24vTWk2?=
 =?utf-8?B?eUdXU0JsTlhxNllhMzZHRTZJYnU2azVQOGJJT3AvSWoyeklSejRIbDB4Tmsy?=
 =?utf-8?B?Z0pGOEpqSE5VYWlsU3dRVnFVQmo1cmZDL0Y1clFUSktlRG1LTzd4dmVqaEk3?=
 =?utf-8?B?V2U0REtsdk5EdHhOM2RYNGZqdjNwY3RKVEFNYUlxZzJDWFpraEFPbHhoekFy?=
 =?utf-8?B?cGRmbDNrNm9aK0hGT21BazlSUW5Bc0htd2FBVjNUdjFJUTk0eHpXMklubXpB?=
 =?utf-8?B?dVBObG9jekFCd2V1K2k3TkVDTjNGS0drY1U0UWV3dDFxSnJybWhoMDdMV0V6?=
 =?utf-8?B?L0VjQ0F2LzVQaWRkOG9zdnI2ZCs3Z2dCOFhVV2I5T045cm8wcE41eHpQY1hl?=
 =?utf-8?B?MjlhTXUzUnhQU2JQWERjRENzWEo0M3VtTXhFV2dNS1ZOYi9Na3o2elQ1VU1Y?=
 =?utf-8?B?eWoyRkhLN1RNUEM0dExrRDVJRDIyNEl1S2txRVBxTFhjdGlDT080RWxraW1Z?=
 =?utf-8?B?bHdjdWFMdTYvY0RRc0ZrSzUzTGlDK3p0WnF6OW5TeDc0Ris2eEtRYTZLdU0w?=
 =?utf-8?B?NGs2dm53NWNRcUprRFJRdlFNUTJtVjI0aFZFbkpvUzU2c2FsaEpHQjdpTmxG?=
 =?utf-8?B?S2JWQTJYd3Q0UXV1a092TG5scXpIZldOOFF0WldraWt0OWRaK2U2blA4QS9k?=
 =?utf-8?B?UXJwMDk4RWNicWlhUGg3L2YrRm5zcFQ4Z2c1NFlveFQ0V1VNTFZTTzh2ald6?=
 =?utf-8?B?NkRDbzVXaStyR2tQaWxpbVZjMjBpYnNuMzdNUEVZQ0IwUUZLZmZpUU1MZjEy?=
 =?utf-8?B?aENVY1ZkcWdpcHFteE5DcGlDeVdjcVQ2VmwzdEx5MzFPRTQyb1N2bmZMN2ph?=
 =?utf-8?B?YlVqTmt0bkFlV3k2VDMwUDk0SmpQc3NpOFJSZzhMclA4emJFdm13NnZMd3RJ?=
 =?utf-8?B?c2VGTFF1bUVNVFNEOEI1dWI4L28zUndOYlJWUEhpSVlrV2t1d3kzeUtwMzd3?=
 =?utf-8?B?UFlzQkMyZ3N3QUNIc0R2M1dneUJ4VzIrQTNUcVhQRXJKK056Vk9pdFE3Vk4z?=
 =?utf-8?B?aWQvOWtjQzRoR0FqcGQwY1JWZFVtWnlXN3ROcnYyQi83TTFYNXlvUlpoZitM?=
 =?utf-8?B?aXNsc1N0WVowVUdGN3BGOUM0d1lzcmhaNEMydUhIME1HTHEwT25lR1JCcVE0?=
 =?utf-8?B?YnM3Q2U2dnZhRHhEQzk4bW05dEVDSjNjSlZTNEFuejZvZ3VYMGs0czM0L3Qx?=
 =?utf-8?B?M1pTTStUQ3YzKzY1SVRmcm5tM1N1WnFkZEgzdGVJVkIyVWRndUVPREphM1U0?=
 =?utf-8?B?ZDY1SHZnTUZIM0w0UUI3Y1grZHJuTThJc2ErMTVZdlpXekJZVjhIdlBPZHV0?=
 =?utf-8?B?Z0hRcTBFaytJVzh0NTJreE8xc2VBZWxiZ2h1ZjZyM1ZDcC9CSWlJLysvTGxL?=
 =?utf-8?B?Sm8ycWVhZTlwbHFRTWlicFBjVDBRYzdYMXVpam1rdi9IMW5TMmZMMm1IYTU5?=
 =?utf-8?B?WnF4bjRjTXBlT2Q3bmErSjFWdG8rK2lpb1JlYTJSVy9iWGc0TWR5UFR1bnlR?=
 =?utf-8?B?Y3hLcjVBMHdWWEZOMUJCMkhHdVo3UlZBd3RBTlJzNFlFcnZ1eHljMEt2Vy93?=
 =?utf-8?B?NEw5NHFQdDZ1V2RTUGNRdERuaGNQVlpKVE9neHFZbHlaVGRKa2xJS0w0SWdX?=
 =?utf-8?B?SitDVzM4NkFKZTI4d1RPMmNaVDJNT09lcW9hMGUzZmJqdjZLa05RVGVibWIx?=
 =?utf-8?Q?UUQGcw0SJIw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF5ADB4ADFC.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEwxci9EUEZVYmlUajVYYi9SU29MeDdaV2RUTkJQZVRBYlNMY2hsWjZzRlhx?=
 =?utf-8?B?OVFkbDdZTU1nS1NPL0FPWWNSOThIMktvbjJVMnZrRlQ5RnRqYzZwUklhVnh4?=
 =?utf-8?B?eFJjU25hdE5vc2JpMUpTMDl3bmhmMWprdHRXYmxySjhiOU9zbTkwbGw3NHBj?=
 =?utf-8?B?dW4xOE1UNDhwMnRiRmo2cTg2ZWVBOGVsVXgyem0xM1AvVHFMb3daMDRpV1Rq?=
 =?utf-8?B?cDlVemU1eExpMTV0ZW42OTRoUkx2aW9VZ1NyRkRMa21JN1hHTXEvc2w5WGVB?=
 =?utf-8?B?Ty9MY3lTNnZOQ1RNNGNjSjYwdGZPRUVaNHZIeFgxTUdzWjJVSldEK2I1Z0Zn?=
 =?utf-8?B?Z1pIQUVhMVFmR1ZTVCt1Q1JHYUw2cDVHdHNVUXVBRVZXdStqcHR4eHRrZjFo?=
 =?utf-8?B?d1ZqckVET3NkSitQUXZFRG5QTHM2RWZkYmF1bnNNRWd6QXhXVjFYUklJMnRE?=
 =?utf-8?B?cjBUVUs2K21xMzUrSEpQYXZBTUgrUHFiMSsyRHRXSkEzckpvWW5na0FKbXlj?=
 =?utf-8?B?WXZ2ZmU5KzZBbkxLa3VHN1k4Zk1GSXJCTGxsRlBLLzBpNXROUjgyUWpPdERw?=
 =?utf-8?B?THRpNDlNbUZpNUJqVjY2aXlDVThkWXFXYm5NZlRBZEJtOEJ2dU81b3EwUmFY?=
 =?utf-8?B?NU9sWUw0aXhpa0pkVHozZ3RsRmNXTFN1VnpQUU5aVmRiSjQwRGRBUXM4azN4?=
 =?utf-8?B?bzR4aEQ2S0hpNkRVZVhPbkNrWHM2OGxUTDlNSGhneWw3bGRmZENXcUg1K09F?=
 =?utf-8?B?d2NrK1hETnNmN3JzT3p5UCtUTFJuUjdlWHpRd0R1aTc5UXd4eTVmTW9EUjBo?=
 =?utf-8?B?SFpiUWFpUlVaS1RFaE5SL0RqWmQyKzhrRG5ndWtTSDRvTWdyN3crN3RRcnNm?=
 =?utf-8?B?TXU5M1JMVWFTTUI5dS9zRTlNVWNYQVpzSkcyTFdJWGdOV0c0Yy9tdGpGOGVk?=
 =?utf-8?B?SmRjR3U3emlweHBZUmNNaEFXclZtblhsenRXQzFab1FZQ0RPNGxOK0JadVBE?=
 =?utf-8?B?N3N4bWhmWVc2MDY1TTZrdUp5Z2dyeUNHOEF6RzZuTW5BeFFxdUtWUEU1Y1ZL?=
 =?utf-8?B?ZjY0VzNuTkYwaDhhd3N2YTdrTzNhTzk4V1JmMSttRnkrVU5KKzZFUzIyRTZY?=
 =?utf-8?B?NmF6dU4rYlBDaUJWYXZ4djBsYkVsYW9QdmhONDFhZlU4NFpYUllsV0YydVBH?=
 =?utf-8?B?MTRrUGc0c0FUby8wSlYycTdJSitGY0hFcXBVKzJJaWNLU0loNWNVdTJlNGZj?=
 =?utf-8?B?SzMvSWZ6UHhHNTlXRWZYUVFOVWIxV3N4NjJlRXYvRlpWWXhSWngrZ3VhVk14?=
 =?utf-8?B?dkVxbjBDRWdzQWIyeG5PMWUvUk9nQVZ2ak8rTlZFSWYxYTh0U2J4NHNrNWZr?=
 =?utf-8?B?SWNLTUV1SWNPZnpBalFydk5scUZLdnFDczBoOGpVQ3FiM00xVzNoZmlKUWVC?=
 =?utf-8?B?d3pBSjNmRkxSREdEQkdUSjBHZWVVT0YraEVzZkw2aXhUdFRBeHJlcjFWdFZo?=
 =?utf-8?B?eDBVUUsyZGtoRm55c1JySkJRWGJSM21IUXlNV3JVUmJzbjRZUjcwWGNmUGpm?=
 =?utf-8?B?WlJTWTJ2VGdCNGRvZ2dDeUtIZVNuV0tmTFJsaTIyUmpSanpzbkEwRS9jbEpq?=
 =?utf-8?B?YXEvSHBjbUdrdlIxcHR6aXRzYkxtL2VoV2gzM2dIZXVqQzZNSkN4UGF6YWs2?=
 =?utf-8?B?TkRwYVVlNUlWRzM5QXB0TUZTU3BDbHFGNnpYL2V6VXR4cEROYXpjSXNNMnJT?=
 =?utf-8?B?Y0ZpbFpZdFF5WGl0MW44czdsODN4SzlyU1grb1RuU3h4L0dtdmI0aHg5SEpt?=
 =?utf-8?B?dFNhT01NeEVnRDd6dzliWDR6Y2ltUGlhd05PQkxQQTlhbGFEemVsVk04dlZn?=
 =?utf-8?B?ZTYwUEd6VUhpeEhEaGdpa0JTZ1I0aU5teDFOMW4vWFBpbGVhVjUweEFOT0xx?=
 =?utf-8?B?eVd1Rjd4N0tSeFBsd2xXMm5Ld1N3bHF0d3ZLZVZWTkhlVmFKLzk0a3FxbEgw?=
 =?utf-8?B?UFozbDhtdmx5QWhzRGxGUHA1ekFWeTNoWS9vay9uZUdmZzFYZzZjNDl4aXp2?=
 =?utf-8?B?dm5JSWhxdXh1REk2K3hlRFdFL0hVQS9zTUNCVXU1czc5RHRCK2VwQ0Rra3pB?=
 =?utf-8?Q?v26KYKibN49B1KhN8CBWmniRt?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	95Ny2VMiGwCd0ToOBuwu2tc7DupvaSxkg2X3yV7ZxSL9POIvOJ3w9e4jnPNP//qLwjeDpuIH0RnEPuFkarJvm8yPFlJfppDIiMmTotidq1wt77SDLSBN9TJHqE2jakXseXpP6lC54Ptwls+M0rD8ujfc3y87OHk1fYP7JcIN0yP8sjj8kZ4GKd0oKfSlP7E4AJ0sRB3olM+7tcAFTSfO2i4yhETKDClwDU66n7hPjXDGtp/ik40lvDU5uafyZAGHX9JGSP4WIFPZegbxRs5sUF5UVEto6PdLid+IDjOd52nE+IFBZY5cIIBy4y7EBzXU+6yUyK7001NFmygy2bb2mVqadWQquZTNOqLNULrwTJoVSn2/mRGvV9rprJXn9vTA/CCj8JpoLH+86LzoEfb8zemnL320xNYVMK83czb5w6UO7xpGrnukE0LpSp98mwO7C0qBFZsUO8Bd0wHC3CSY0iq6NfNMrj6qqBf+1nQsbDo1NoGQr/XQpk1gOCUTydw9oOZBFRiDaIQVJQ+s4XLEVNZBV0yUHWNIGDUgGl5jtxD9WjQAjpjntyfAczf57LNuUO2CDksIOrSJGmeGyrofDaIJNzdtSBJR79tJJfdq2sg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26963d4e-de3d-44a3-9613-08ddba397f58
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF5ADB4ADFC.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 13:57:07.2812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lTayuUIaaXrm1Dcqofu0jihaGrfW682IvPUf20ni0xpXALY1LSdmRIOkTBEAnroL2+SQJk6PzegrbudDx5XZ1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8273
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507030117
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDExNyBTYWx0ZWRfXzZ0OchwE28hV MEY6KPIWQplizgNYDmAlvRQMKz3bIvThIcxn1reNFzS2XQjEkH1JvB1RSlLAkOdxNwPu4aEBK+I CeW1PnLEKUK4z9EntoN8S8Nk7Sas7IrXnI60lXiqpnjLF2nnN7rzDhwvg3GcucQsgmMgPziOdgx
 qfXT4Mhq3t4n7TodEf11unctw0qfhIawsGrqcdnX5iT5CiaGKCAyPZBUtOQLauApnthMbS2Xsrz VEXuDsHXueGEC+S8siBS5FT4sH2zEF0LgZGGZ6KKq5+JjZk7t6Y3KzjYQQ8/TjcKo/gXegOl/9m xaUdavWkFGwf5CEEdPkrptZM1rglaGTcpQVhL5SLu8MuwZWIajb5DMjnjRu46JTH0tI18mzeTXw
 /DBbbivVCJIFugT8bjnpBQb3yLwr+Rzd6RNFtKIl+qhDk4TNySBqQ8pRvN8mum1zgQw2BY/e
X-Authority-Analysis: v=2.4 cv=MvBS63ae c=1 sm=1 tr=0 ts=68668c3c b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=eUQ0a4facdn78AV830YA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: WTj6xf2yXNdcfSERvu0gzP43XyzEw8aS
X-Proofpoint-GUID: WTj6xf2yXNdcfSERvu0gzP43XyzEw8aS



On 7/3/25 05:36, Peter Zijlstra wrote:
> On Thu, Jul 03, 2025 at 05:20:47AM -0700, Libo Chen wrote:
> 
>> I agree. The other parts, schedstat and vmstat, are still quite helpful.
>> Also tracepoints are more expensive than counters once enabled, I think
>> that's too much for just counting numbers.
> 
> I'm not generally a fan of eBPF, but supposedly it is really good for
> stuff like this. 
> 

Yeah but not nearly as good as, for example, __schedstat_inc(var) which
probably only takes a few CPU cycles if var is in the right place. eBPF
is gonna take a whole bunch of sequences to even get to updating an eBPF
map which itself is much more expensive than __schedstat_inc(var).

For one, __migrate_swap_task() happens when dst node is fully busy (most
likely src node is full as well), so the overhead of ebpf could be quite
noticeable.


Libo
> Attaching to a tracepoint and distributing into cgroup buckets seems
> like it should be a trivial script.


