Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E6F1D6DBF
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 17:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744221106; cv=fail; b=Y3rVilNA4iJH6DArfZEPD7vJsEOpTx0hCM3ezgYHP5B21qKv4RFZpHq3vVdglxAZP2000+IiXU2X9/w5rolUtYFtTorZJGa/pW0ZmIHlyF3xfhuF7iwQt2XGmMHvAbXj9Uizel0zPO9PcxsLR0SdMdGzbL+zqfGxNolm219oWF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744221106; c=relaxed/simple;
	bh=A+EaZkVvXxEkUi7h0y23yv1orczHYRrpC+hnlbULs4M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aJZ5tdHV9ZaNATbnkWOoeYnWYb/T4c88T69HUffND7gbglm2r7nfhfnUO5HwilBN+pDn3Q3/QQaNkOsutKHmkb1u4wK+g+NAO04GRAxQGpb0njkAygvTtm1C0ahSFMHOjY6FRzFJtTLb/LY77emiea75UlBpNudH63e/ObyL82g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CGixVZpv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vmNiirHn; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CGixVZpv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vmNiirHn"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539Gu6RQ024254;
	Wed, 9 Apr 2025 17:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=KPUOlo5yxatmHq6gu77VLFDYni14FChPGEbo61uzIfM=; b=
	CGixVZpvV+QibUgprWAnSa5cGusG450E4eCgTCXD4JkdYxNSBcmM5rVABrpdbpXA
	PI2wP+1n5vA/mh+3SXdaE1O2KGpfrXKjDD9K70h1luAHfi8SpFZbAGtaFihXt9vF
	mfWafeplO8EAhr3c5M9kr+t4pqDRlZl8RAaUfk5r3yCTA0IpPWdSmH2TejCRNflW
	Yq95GzI5qCp3jrTnWqkG7LTIjmcrVoDDXLXbfPE9Y4YTmX7nXWySawDJgCh1rrJ/
	8Ho0hvnwP0dgKB9NxqT5S3JO28gC2WqWLVGLxfIldK6dKyn2CTqCpSN48RAg0ltf
	yhMWgwVXT494QxVHhMcelA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45tu41fu36-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 09 Apr 2025 17:51:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 539G5EK3023786;
	Wed, 9 Apr 2025 17:51:33 GMT
Received: from cy4pr05cu001.outbound.protection.outlook.com (mail-westcentralusazlp17010007.outbound.protection.outlook.com [40.93.6.7])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45ttyhepg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 09 Apr 2025 17:51:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nyeXzfFEokfdZDWkVj1guEE0Tu3RCKXXUDLu3cUad6Q0JoDLTJPlZVlHgUaRwrGC6uIrRtUgSuTdPsfQNut/EYccy1OEn9tEBJKnFurPmJLYDN1vRftp4UqOoxQbwheciWy0ltv/N0UqOGWjdAiw2kL2QmiBnoertxKn+7l9IsFQD6A/65aeuRv3/tbpUYgMon/dNXHxEU9ASRacU9mROmUoUMz/14HLIsl4zPzA/s8cLyNWXd4c0WHHdCjg9RyX5e0F/G6rbOebK+Xuj5OVpLQIMM9OLhxgb9g1Dok5uE7jbz6ukINbQ+Ji22pm1EVaGbmhWPC5JNin+PGDWVSLkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KPUOlo5yxatmHq6gu77VLFDYni14FChPGEbo61uzIfM=;
 b=rZOEmLRmIiZbRI72+XS5PMckhwrmqxlkGZUhBCN5VsG7p1XbRbUbS3RDRDihOAV5Orn36SI1e/riSYaYlpNL8FDJ2JgI8rmXl4KxgxQiJM8T0jSVAmrKk0JRb9MCbRgHiK1iSPVj57xzRTsVBmUGLFsECE4Q0mZmgJozpyX2wP/E0D0zSSRDZEZ6gC+qlTXTkiCih0njasjo0EwCcdufXMPHSsjsJarC7mD6cu1GiU9cS5RFB6QSGTMuxI7WxK8g43eJZTwCxzP4OrnNSk6FU+paYTWuWyytvdsvxhZH4WDalgY/Hs3yWG1wDt4HbmbVBLMonsJlrP1Uf+/kGJHQBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KPUOlo5yxatmHq6gu77VLFDYni14FChPGEbo61uzIfM=;
 b=vmNiirHn87xJjdGXYFd1Id7yRiVlpkShqb2e+V7eyi+roUeLsOgtE1uimp+WKmZZ0Dz53jwpl5mnEdWrlYmrhmhdemwMeHc++lu8PcfbEAMzS/FeTBQVQOoCoeu7oQDV+854zb+teX7TjA0T39irXg0MpN1iNEAvBDw3dfBkZTs=
Received: from CH0PR10MB5113.namprd10.prod.outlook.com (2603:10b6:610:c9::8)
 by DS7PR10MB5038.namprd10.prod.outlook.com (2603:10b6:5:38c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Wed, 9 Apr
 2025 17:51:30 +0000
Received: from CH0PR10MB5113.namprd10.prod.outlook.com
 ([fe80::eab6:6dcc:f05f:5cb2]) by CH0PR10MB5113.namprd10.prod.outlook.com
 ([fe80::eab6:6dcc:f05f:5cb2%5]) with mapi id 15.20.8632.017; Wed, 9 Apr 2025
 17:51:30 +0000
Message-ID: <d25b3d0d-ebc3-4cf8-bf87-7d42dd23dc36@oracle.com>
Date: Wed, 9 Apr 2025 13:51:29 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] Track node vacancy to reduce worst case allocation
 counts
To: linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, liam.howlett@oracle.com,
        willy@infradead.org
References: <20250407184102.2155415-1-sidhartha.kumar@oracle.com>
Content-Language: en-US
From: Sidhartha Kumar <sidhartha.kumar@oracle.com>
In-Reply-To: <20250407184102.2155415-1-sidhartha.kumar@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0044.namprd03.prod.outlook.com
 (2603:10b6:208:32d::19) To CH0PR10MB5113.namprd10.prod.outlook.com
 (2603:10b6:610:c9::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5113:EE_|DS7PR10MB5038:EE_
X-MS-Office365-Filtering-Correlation-Id: 72bc685d-b8d9-4d1d-bd02-08dd778f28cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YmxEdHo4RWZYdzRyZytnT2NwSFRYSlFGaFQ4cjhkMjYrL2JVOHFtcFBZeFgw?=
 =?utf-8?B?NmdqYzhMbFhNQlUxMmVqTm8yMG5ud004cG40RGlUaXZNWnNGcFhFNEZUcXFE?=
 =?utf-8?B?ZzBuYXh1bTlaVExGVUpjbHFUM3EyOHFYaExLTVdBQ2xHZUs3ZS9JS3p6U3NO?=
 =?utf-8?B?OGFxb0dNeFdPTll5M2YydVk4bG1NS0Q3enpuR0JEajg0WGw0ZlFnNXZ1VHhI?=
 =?utf-8?B?bXYrTFl3Zkxyd3J0RlNtdmFteXpzVzNSY1pPNmM0a1VLaXJVbWNPYU1EaHVj?=
 =?utf-8?B?RW1LUEh3TkJOQko2R2RtTkw2NFljUHlBeHFxd2oyeE1JOWpabGIwd2xCck5D?=
 =?utf-8?B?L0syakZKWmVremZuNzVFWTducndDeUk4cTNOZlA2SDd4ZjBlUW9Ib243THVJ?=
 =?utf-8?B?U3RpaHhyaCtNT1JoRjhCdGdLeGI4enZTSENBcXZENTE5OG4zQVRlZDl4QXFl?=
 =?utf-8?B?ZktSRTZtWEF6VzdwNVBtMkNIbWZ3OEtqTXpONUlPZW9CVWkrYWF6VEV6ZGJC?=
 =?utf-8?B?UERaVlZwVHFFWmVNNERNY05ydXJsZHVMclEvM1FqZTFsdDUvbFlPZ3o0SHpo?=
 =?utf-8?B?Tm1ob2VWdmJiVk9jV1pLaXlYS1ZpS2pyaWF0NzZ6Q2lEa25zbmtMdWhDdDFH?=
 =?utf-8?B?N2FhYUpNaXozSmZrSVJXb0tJTThKRnR5R1FZQVE3QU1EVk8rN1BGZnMzQ1B3?=
 =?utf-8?B?TE5oTERCYmRSUnhvZU96S0hqTWFORUwwdnlYWTNYc2lxZWd4MzBwcTZFc2Z6?=
 =?utf-8?B?WTNESmc3Y21zblNNVnkvQnBMSzlBM2Q0cmttdk9tZEUxOHE3RXhabTdzRFpq?=
 =?utf-8?B?cmJtOHM3bDhlQXF2TlhJcUhGUW5sUUpXOXJSVVQyeTlGdmYvV25ZL2hqOGJm?=
 =?utf-8?B?Y2VHM09zUG05RnR5NnA1ZE1SSUJMU0FhU21TSzlFK3FzcmI4dUVjcWJNejE2?=
 =?utf-8?B?RWlpTlEzbDd1OTBybU5PM2tQK2sxaERYNW5OUDZUVkxCZWtZNzZ4ampscWZm?=
 =?utf-8?B?d0F0SlJFYnIrZlZMVzd0OXlVd0dSUGNhRXZNUTNvSmdmVmQyVUJEME5BUVg5?=
 =?utf-8?B?ZGtWaGsveUFNZGdMcEY5VTdld09nSEZydTdWYmk4U2Rack5GODcvL2R4QU05?=
 =?utf-8?B?Y1BBSWFnWDhGYVQ2QnZFZkRhbEdKdGR3S1U3WnZ2alBJNEZlTmg1SjN3NzAv?=
 =?utf-8?B?RFlpN3A0VS9kZDlpQXZZdnRRZUh6NFBqOG4wWU53QXk0NEtNQnQrdkFvRll1?=
 =?utf-8?B?NE56bXdBVEJsMThubHU3RG1yN3k0cDJLbXFQQVY5eU5sdDk4a2NPeTRLYzJC?=
 =?utf-8?B?QTNyQjdjd0RON2VSNXNCeGhuNFYrUDFSL0hBQmdxUWFISGE3eWlDa212UDE2?=
 =?utf-8?B?NXZML09nMTJVQUlpMi9hZjUxYUdOWEdKTkJtWjdaOUZrSWJlL1lYbFVDVzBw?=
 =?utf-8?B?RU9qdVdMdk5pR3RnUVR3MEhpTEMwYUQ3Y0FoWEdtQzR3cTEybVdEV3kxQmJW?=
 =?utf-8?B?SFhlVUtBaEdTcmZyM0pIRFIxQVlvK0dDTmZDRE5rV29CTmt1TGZSWldteFJM?=
 =?utf-8?B?QlBlalFRdDlNZCtSN21odXZqYzFSODhmbkpCR3dMa1J6UnJucTFUalJoNUVW?=
 =?utf-8?B?bEN1bDZ0bk04a0l2SDBYcGFqcXV4bGI0eTFtMzQ1NUJHbEdVSHZlM3VKaU5E?=
 =?utf-8?B?VGRoRzhLU2xKRzg0NlVpb20xTDNibWZOUjdGS1BYcXM0VXdLaHBES1FpY0lJ?=
 =?utf-8?B?NnVhWUhJVzRMMkFuMGJJS3JCbURGSmZGUW5iY1hkRXI5S3htQ2tDaHM5NUJm?=
 =?utf-8?B?MHVxMHdCQW1FblEwZi9Qbk9KK1BKbVRPNDNMWDlrWXBDQ3c4ajlic243cDh4?=
 =?utf-8?B?QlhkQkVwZ0NPa3lzOEVRYXpUd1J0UUtXMkVma0sveERyUFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5113.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2RFdG9RbTJvMjlLcDhKUWNERzVTWjZxeUhQUFlDVjd2Z3U0elN6Z3dwbC9y?=
 =?utf-8?B?NnEyLy9YeFZ0L0ttMHpDdjhBV2wrckJuTHlYbWMzSjdtd2RGdnJpc3pTNjdS?=
 =?utf-8?B?NWExU2wzclJRMEpwdnQ2VUxUVFU1TURwM0FDTVhVMm9lam9XNmJIVDFmSWNB?=
 =?utf-8?B?UjlENmh4YkZKbURRSEt5VCtSM0ZKTy9Pai9mUzZkazJpMlJSNXpnajVxcTBY?=
 =?utf-8?B?OG1PNU9aNXViZzlYRmFuWGV4SENtVFF5SDh2ajdSY3V5Z2J6VzBKYTJQZzY2?=
 =?utf-8?B?UHVVSkhjVHNVV2tsVGtLMjYxRmFUam41Q1N3VEJJTHRxNG1aQ2tVNklIRTNE?=
 =?utf-8?B?bEw5QWFNNzhYYnp6cmZpbHRtbTNIRnpjQ2ZRN0NMdytxcmJWOHVhTGl2VFdy?=
 =?utf-8?B?MUpEZDUyT1M0WjdVTXVCTXR0SHVDRUs4S3k4cUJvSk1wQXBUUTJnMFdFUkNp?=
 =?utf-8?B?VUF2UThCN205b25ndDJGdTRQZ05zR05DSGgzamcwcXVxSXZqS2VrZitPNUZB?=
 =?utf-8?B?c20yTlJUaGFLNWpGaHcrdXFLVm1HTE1MMHlvZkRERy9RLzFpL0VFMjJydWI4?=
 =?utf-8?B?b0R2b0NpN0syb1hGbUNicnljVjlEUlRRbVdzMHcxbUpwci9ESWtVQ2IvSHI3?=
 =?utf-8?B?bEYzLzJYdkxSbkdNZEZUcThlUlJ1bVAxRVN1aXRqYWcvZE5ybVFiVDQ0QVo4?=
 =?utf-8?B?WnhGQ0JuVXA2M2pNcGNndng2Vlp5aVl1TmFEVjlSd05NUm9BeWpIV2pGUERo?=
 =?utf-8?B?WmlXV0R0NjFGYmV4VXRCYS9Fd1hFa3Q0TDQ4SEViQkNXWEE4NFNMSjR3Nk9U?=
 =?utf-8?B?TkJPcXNhelBMakY5bWNZSnF4WlI4dXEzb1NXSER0M1hKZXozQm1GU1dhTmd6?=
 =?utf-8?B?ZExNaTFuSmFWQzNyTEh1a1VoVDlpQjBiV1dWbDlJallnY0hjdVZldlF3Vjhn?=
 =?utf-8?B?dGp4ZkpHQWRaSWpSNE0xNk1LSytjWE4xYXk4dHhxNS9MYjBOUmlQdFh3V3pp?=
 =?utf-8?B?TXlGQjZON3RHZHk4d2ZpZHlpVnVmeHUyRTh3K0xPVVFwaGVyQ2xQU0J0YWxR?=
 =?utf-8?B?NHhNbHJOK3k1TWRUTkJlK0dMeVFlVkpEVkZzV3lTYm1EaG93bi9mSFBMVWNW?=
 =?utf-8?B?Zkw0dHVYMnlwS1kxNG9kMDkyNzlLU2FJOXQwMHhHNkxkZlV5MG1WMlNFK1Ar?=
 =?utf-8?B?dXVlaUNVZ1Bub2Q0U0xOVEFvWkV2alV4SkIweUJwZXduZVphK2tCTWdYS0NI?=
 =?utf-8?B?TlRoVmtNVVRsbnBGck9SL1FQbEtmR3Q5WDZNVmRqOW0rVXJPZjF3T1JJQWJF?=
 =?utf-8?B?eGs5S3BObVJRSkVaL1ozWnRzRTFWWUIvYjc5dVVDa3Y3VG4rOGdTVGMwWnRv?=
 =?utf-8?B?R2hqWS9NUkN0dU1ZTjhQMEtiZUhqTGJTYjlFUVkrWDlJU3paejFQMVNGV2hi?=
 =?utf-8?B?Sit0d2VxWXhBd2hBSWVJRkFwRnc3bGJtUVpEVUZkalVuemp3VFRjZEhuTXpL?=
 =?utf-8?B?MEh6UmcwOGg3ZTM4NkJYRkUvTFozRGIwdDZsQjVkQ0p1aDJjT3RKUmRwcXdS?=
 =?utf-8?B?Uy9SdU9INTVHbENxNENwN1ZLZzcxdlFyaFVqZ25jNUF5TE1FbHZHU0hjaTlK?=
 =?utf-8?B?cDdXbFRzZVBGVHl3cjZtTnJacXBuT1pYU2krTFlzRC8xcXBSOUV4djlIMzF4?=
 =?utf-8?B?UHc1d3Bnc1MzNEZ0S1VMYnVxaVFqU3IyTFJmTTFobHFsN3BnbHpDKzBTOU9z?=
 =?utf-8?B?SEhUOFNOY1puYUdBS1pobEpTMm1QWHlLNXNFRGZ1RFNPaEhYT2ZIaDR6QmJD?=
 =?utf-8?B?MnBFU1dqR3gvMXM2QWxVWkFGUmZFdzZXeExXRUVQVUVlQzEwSi9xSm1yaGZW?=
 =?utf-8?B?bUVYeVhlQjdvVWdobi9XNzlyNmkzRkhWeUE3QmZHTVdWSzJ1ZXc0TzBmdDZ2?=
 =?utf-8?B?RkNLbS9yaUdwT2k0SHdIWndoR2M2SDdLa2lQMW1EZUFjT3lTV2FtOUQ3Y1Yw?=
 =?utf-8?B?ZXByckdsQW5TWnZXNGlydjRMQ1BOMVJpUDA1SmI5LzhIUWFvUEhHcjg0VklS?=
 =?utf-8?B?STZ6R0ZpRWd4QzZhUWVQRUlWTmNQTkp0a3ZBd1EzUC9NZnhScFY5KzlZcGRN?=
 =?utf-8?B?SjZtdEhTYmRBRVlwLzRLS045NDg1dkd2dCsya1pTTDRYdmRldGhlY0Erbnhz?=
 =?utf-8?B?Unc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NU/GfnYiCHKAon73nDCbE9JCMNfeLzYWU/3TIIGbyWTlMMQfBrvXeLrfoTcaGABHhTyIKLT2qGIgVZEfWEdu2Q0WTnnwARYq5ebxmi2LqqOHsw9QMYJYX9IDeUOUIWr8b3Dfg4SvGrb4nkfsQl+mJIgerzftBbF7z2DT18zYruY7Gx3blUD9aNW61QWAOruSv9f+IrcCpttvhXCacRHAvYsxYAMYEcr1o/SfIPySjCHtC2yGMGhwvu9MiNhhNI0e3fMcAe1MaafcXCCfDpRKCwQPKY6DwffrOsxbT5dguvYPCyG/n3SVCcJsdaRicQfI2kfJRsNJkAsXsedqUlf4z7jxtJcRPt7Yab8d1qz/2oH7W3j4dH9He9Ybp4mLtSD3x8m/8bwEuX1ujERelRQ7rC91By8XUAZO460SefvaboKEz0W4opAI3ftSVF95xzLNJDljvbVra/3i/yB2lokChrIKNsNZ+yN1KujGM3jSLGLR7F/JSxNXtL0JV1KLKg9RXVlhsNcIZqPTUx5G3MKdoTfq+fKNrE326dmKZySZQ77i6ZLXyqFC76yB52155yH+xbC9J0FTZ9YCOAqN79qPDr0ZtgL0NMyjThLkBGrFXDA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72bc685d-b8d9-4d1d-bd02-08dd778f28cc
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5113.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 17:51:30.6534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l66JD8QpROjrNLQ1+iFSPmuSql0GCgX/erh/hQFUtRqW4z7wU7L1B7isydoLnHuTQoqOdyyF8nJH643y5IrHR2U8j2+kaH7/+ObieMZnaQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5038
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504090116
X-Proofpoint-ORIG-GUID: zrfiEmKop4OcTibWh-day72RgGclxtKq
X-Proofpoint-GUID: zrfiEmKop4OcTibWh-day72RgGclxtKq

On 4/7/25 2:40 PM, Sidhartha Kumar wrote:
> v3[3] -> v4:
>    - fix bug reported by Vasily Gorbik by fixing condition for
>      mast_overflow() and add test case for this condition. This fix
>      was also tested on s390 by Vasily.
> 
>    - cleanup new_height variable usage in mas_spanning_rebalance()
>      and add an additional test to make sure mt_height() is correct
>      after a rebalance causes a tree's height to decrease per Liam.
> 
Hi Andrew,

Could the following fixup patch be applied to the end of this series? If 
you'd prefer a new version of the series I can do that as well.

Thanks,
Sid


commit 1be83a7dccbef0a5973a3723de5a4460270d90c7 (HEAD)
Author: Sidhartha Kumar <sidhartha.kumar@oracle.com>
Date:   Wed Apr 9 17:44:51 2025 +0000

     maple_tree: vacant_height series fixup

     l_mas.depth is no longer overloaded to track the height in
     mas_spanning_rebalance() so we can remove its initialization.

     Fix comments that refer to variables that track height as depth.

     Signed-off-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>

diff --git a/include/linux/maple_tree.h b/include/linux/maple_tree.h
index 37dc9525dff6..9ef129038224 100644
--- a/include/linux/maple_tree.h
+++ b/include/linux/maple_tree.h
@@ -463,8 +463,8 @@ struct ma_wr_state {
         void __rcu **slots;             /* mas->node->slots pointer */
         void *entry;                    /* The entry to write */
         void *content;                  /* The existing entry that is 
being overwritten */
-       unsigned char vacant_height;    /* Depth of lowest node with 
free space */
-       unsigned char sufficient_height;/* Depth of lowest node with min 
sufficiency + 1 nodes */
+       unsigned char vacant_height;    /* Height of lowest node with 
free space */
+       unsigned char sufficient_height;/* Height of lowest node with 
min sufficiency + 1 nodes */
  };

  #define mas_lock(mas)           spin_lock(&((mas)->tree->ma_lock))
diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index 8425728e3c5a..affe979bd14d 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -2850,8 +2850,6 @@ static void mas_spanning_rebalance(struct ma_state 
*mas,
             unlikely(mast->bn->b_end <= mt_min_slots[mast->bn->type]))
                 mast_spanning_rebalance(mast);

-       l_mas.depth = 0;
-
         /*
          * Each level of the tree is examined and balanced, pushing 
data to the left or
          * right, or rebalancing against left or right nodes is 
employed to avoid

> v2[2] -> v3:
>    - add r-b to patches 1,4, and 6
>    
>    - update function parameter comments in patch 2
> 
>    - remove line that sets mas->depth in patch 2
> 
>    - remove redundant code for checking for a spanning write in patch 3
> 
>    - rewrite commit message of patch 5 for additonal context and clarity
> 
> 
> v1[1] -> v2:
>    - fix comment for vacant_height which refers to depth per Wei
> 
>    - add a patch to reorder switch case statements in mas_prealloc_calc and
>      mas_wr_store_entry
> 
>    - use sufficient height in spanning stores
> 
>    - modify patch 2 to use a counter to track ascending the tree rather
>      than overloading mas->depth to have this function.
> 
> ================ overview ========================
> Currently, the maple tree preallocates the worst case number of nodes for
> given store type by taking into account the whole height of the tree. This
> comes from a worst case scenario of every node in the tree being full and
> having to propagate node allocation upwards until we reach the root of the
> tree. This can be optimized if there are vacancies in nodes that are at a
> lower depth than the root node. This series implements tracking the level
> at which there is a vacant node so we only need to allocate until this
> level is reached, rather than always using the full height of the tree.
> The ma_wr_state struct is modified to add a field which keeps track of the
> vacant height and is updated during walks of the tree. This value is then
> read in mas_prealloc_calc() when we decide how many nodes to allocate.
> 
> For rebalancing and spanning stores, we also need to track the lowest
> height at which a node has 1 more entry than the minimum sufficient number
> of entries. This is because rebalancing can cause a parent node to become
> insufficient which results in further node allocations. In this case, we
> need to use the sufficient height as the worst case rather than the vacant
> height.
> 
> patch 1-2: preparatory patches
> patch 3: implement vacant height tracking + update the tests
> patch 4: support vacant height tracking for rebalancing writes
> patch 5: implement sufficient height tracking
> patch 6: reorder switch case statements
> 
> ================ results =========================
> Bpftrace was used to profile the allocation path for requesting new maple
> nodes while running stress-ng mmap 120s. The histograms below represent
> requests to kmem_cache_alloc_bulk() and show the count argument. This
> represnts how many maple nodes the caller is requesting in
> kmem_cache_alloc_bulk()
> 
> command: stress-ng --mmap 4 --timeout 120
> 
> mm-unstable
> 
> @bulk_alloc_req:
> [3, 4)                 4 |                                                    |
> [4, 5)             54170 |@                                                   |
> [5, 6)                 0 |                                                    |
> [6, 7)            893057 |@@@@@@@@@@@@@@@@@@@@                                |
> [7, 8)                 4 |                                                    |
> [8, 9)           2230287 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
> [9, 10)            55811 |@                                                   |
> [10, 11)           77834 |@                                                   |
> [11, 12)               0 |                                                    |
> [12, 13)         1368684 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                     |
> [13, 14)               0 |                                                    |
> [14, 15)               0 |                                                    |
> [15, 16)          367197 |@@@@@@@@                                            |
> 
> 
> @maple_node_total: 46,630,160
> @total_vmas: 46184591
> 
> mm-unstable + this series
> 
> @bulk_alloc_req:
> [2, 3)               198 |                                                    |
> [3, 4)                 4 |                                                    |
> [4, 5)                43 |                                                    |
> [5, 6)                 0 |                                                    |
> [6, 7)           1069503 |@@@@@@@@@@@@@@@@@@@@@                               |
> [7, 8)                 4 |                                                    |
> [8, 9)           2597268 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
> [9, 10)           472191 |@@@@@@@@@                                           |
> [10, 11)          191904 |@@@                                                 |
> [11, 12)               0 |                                                    |
> [12, 13)          247316 |@@@@                                                |
> [13, 14)               0 |                                                    |
> [14, 15)               0 |                                                    |
> [15, 16)           98769 |@                                                   |
> 
> 
> @maple_node_total: 37,813,856
> @total_vmas: 43493287
> 
> This represents a ~19% reduction in the number of bulk maple nodes allocated.
> 
> For more reproducible results, a historgram of the return value of
> mas_prealloc_calc() is displayed while running the maple_tree_tests
> whcih have a deterministic store pattern
> 
> mas_prealloc_calc() return value mm-unstable
> 1   :                                                    (12068)
> 3   :                                                    (11836)
> 5   : *****                                              (271192)
> 7   : ************************************************** (2329329)
> 9   : ***********                                        (534186)
> 10  :                                                    (435)
> 11  : ***************                                    (704306)
> 13  : ********                                           (409781)
> 
> mas_prealloc_calc() return value mm-unstable + this series
> 1   :                                                    (12070)
> 3   : ************************************************** (3548777)
> 5   : ********                                           (633458)
> 7   :                                                    (65081)
> 9   :                                                    (11224)
> 10  :                                                    (341)
> 11  :                                                    (2973)
> 13  :                                                    (68)
> 
> do_mmap latency was also measured for regressions:
> command: stress-ng --mmap 4 --timeout 120
> 
> mm-unstable:
> avg = 7162 nsecs, total: 16101821292 nsecs, count: 2248034
> 
> mm-unstable + this series:
> avg = 6689 nsecs, total: 15135391764 nsecs, count: 2262726
> 
> 
> stress-ng --mmap4 --timeout 120
> 
> with vacant_height:
> stress-ng: info:  [257]                   21526312 Maple Tree Read                0.176 M/sec
> stress-ng: info:  [257]                  339979348 Maple Tree Write               2.774 M/sec
> 
> without vacant_height:
> stress-ng: info:  [8228]                   20968900 Maple Tree Read                0.171 M/sec
> stress-ng: info:  [8228]                  312214648 Maple Tree Write               2.547 M/sec
> 
> This respresents an increase of ~3% read throughput and ~9% increase in write throughput.
> 
> [1]: https://lore.kernel.org/lkml/20241114170524.64391-1-sidhartha.kumar@oracle.com/T/
> [2]: https://lore.kernel.org/lkml/20250221163610.578409-1-sidhartha.kumar@oracle.com/
> [3]: https://lore.kernel.org/lkml/20250227204823.758784-1-sidhartha.kumar@oracle.com/
> Sidhartha Kumar (6):
>    maple_tree: convert mas_prealloc_calc() to take in a maple write state
>    maple_tree: use height and depth consistently
>    maple_tree: use vacant nodes to reduce worst case allocations
>    maple_tree: break on convergence in mas_spanning_rebalance()
>    maple_tree: add sufficient height
>    maple_tree: reorder mas->store_type case statements
> 
>   include/linux/maple_tree.h       |   4 +
>   lib/maple_tree.c                 | 189 ++++++++++++++++++-------------
>   tools/testing/radix-tree/maple.c | 126 +++++++++++++++++++--
>   3 files changed, 233 insertions(+), 86 deletions(-)
> 

