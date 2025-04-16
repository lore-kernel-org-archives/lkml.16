Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190712066D3
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 04:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744778824; cv=fail; b=h94qxuL7jRrC96zsGtfwIUfCz6AcRFJSTisJhDesZ/i3f0WsPLe7D03uYFrd+Vx1lz1F7eYKdux7bqLjv8bHYHORpyuKTejBqYAPVe6uj4MOyjxSDcVNvXrgsGhx4GPf1zyVBa1DKUe/NHVkwGY2ESIK5KvxeP7a7E3V1F4DLM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744778824; c=relaxed/simple;
	bh=nqn4I0PGFD059V+cpUG/Or/AwQZTfhKmUZogAzdwGjw=;
	h=References:From:To:Cc:Subject:In-reply-to:Date:Message-ID:
	 Content-Type:MIME-Version; b=BLShHBFW8eVyPUezGUPXnvHIXLs8044g7LcWEeZt+LosOVJxw5QCDCa3qJ82SFHhz8I37HBGBK6HxMigz9fhpsqMS2Fi9UeirRrfZuUBpDMBnve8jQjH68zvMSJyhGhni92wP2YdgOYDO6k/XInqSCbneKwqWts3Gf7etT9+2rk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BryX1WZw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BOJ5Sqsw; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BryX1WZw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BOJ5Sqsw"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FMN5R4027523;
	Wed, 16 Apr 2025 04:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=l+m3MNFZE6dNbz1eYOaNvrBQAIe31sY3qpBQIXn+/1o=; b=
	BryX1WZwa0liG5qbRagAVm17SLbBncfzeowmx2aVZEBXm9s1IXUMPxQbriQmnzwb
	+uf2JbvsYQNA8As7nc0sBbOVeN9tOYyiwAkq4xbWbatHxHYB9fWRKtie/UWwFGoe
	7lY4NyTgO8gfhNgOnPXFauRTegfxPN4fXWmeCtM0uBOBcbHOFkpMQQ0QhlCeZRA7
	Kz6C+6Kegb5qtSeW3fzELyNOxAFBtR6XDWVpDHRgCAmEhh7gcE1/pm1kTvy0d4f6
	q7OWQ279d9E5xPPfwGJ77sUozM1sKJjtT2Oi1hF4MITGnYxM844lXKAIZqCt6eQn
	kaMePYuh6okAGGusnPyD5g==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4616uf3du4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 04:46:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53G4E3Hi009161;
	Wed, 16 Apr 2025 04:46:30 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d3k1x0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 04:46:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HwzSSEcbKBW1nVO5gys8a2YrFQWFCJ1zGNpZf5732Ln7x9zxsT6ESzR0hq9hbKpFC9bM/Y3aOCN8Ai6YlLuFtjM/DQVrjsxQ7cLG2qlaaKKG1MME81g2+LO9HZ/bcmYug+JW2OVqX++YvuxNNQuF1DjqoM4fJZ2DxFXdzLoB8N7jYyKQy66E+rG4yMsl0X9lgbvMyNsiNOTexJmEcIGzK0RUFpqzCQiWyVujlYvs4DAqQs+vt7DJwb/VQ/td3EQDCZsrRmTT8zdva/DvUKrTK+t/C1RUxtIA528gzFDLT/wfvLjTle7/pxyr4CpOLahNJ2uvjXb7sh6HRojat+VyLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l+m3MNFZE6dNbz1eYOaNvrBQAIe31sY3qpBQIXn+/1o=;
 b=xJmqQ3pcQh96pPYNLV6iVfytDO5OMaGibpH+FNGDjzm87nDgNT1uTA6UcIqe7CWw9QIB4de1s1CaXe4RtYxm7+JeirDJSQ6lD0rNhjYWTlO1jpwbq8NlfDk+1Ki1rtegL284nQmGJzAQaD3wdfGqo+nN3YCCkBVFyyWljAPpN1Yi02UI8ZQJ9WzQIQUXsgwO3BRSnh47faCM/SKoLj8wvG8c0UoEjX5TuU8/gWNCD+5mcMeTaOV/dNqlgncQu27A1WKrAkKgFeTa0fHx1LTSKLOq4XA02rRzGwrn6621Pw304MhMr+ZP+eT8HEzUHjWtC8xYaOm7z3KXdtUM/qOrYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+m3MNFZE6dNbz1eYOaNvrBQAIe31sY3qpBQIXn+/1o=;
 b=BOJ5Sqsw8EAALG+i4HRcfxB1SWXZ2aQy/7fwTSI5mUMpWxPnFQnqf3E9aRhgaqVD2VwWEi/7NO1Pd3hZlw8n8VfuSePz8/hT/Mv/DU9Nle+4UGl2Js6JYjoqmmf5rF7nO1hkgaFR8ZeWK6xeDHS3ZpAen5Mn7BqXau3NaZAM3zM=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by PH7PR10MB6507.namprd10.prod.outlook.com (2603:10b6:510:202::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Wed, 16 Apr
 2025 04:46:27 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%5]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 04:46:27 +0000
References: <20250414034607.762653-1-ankur.a.arora@oracle.com>
 <20250414034607.762653-5-ankur.a.arora@oracle.com>
 <mp6sg35nbmjzahnlkstw7y7n2cbcz3waqcthz27ciyc7fmki3s@jws4rtvqyds4>
 <87tt6pw11t.fsf@oracle.com>
 <CAGudoHEuRgDEHQOAsK=SmFu29a3NUyLDL1r5PVuahxbdOR6jZg@mail.gmail.com>
User-agent: mu4e 1.4.10; emacs 27.2
From: Ankur Arora <ankur.a.arora@oracle.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, x86@kernel.org, torvalds@linux-foundation.org,
        akpm@linux-foundation.org, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com, mingo@redhat.com, luto@kernel.org, peterz@infradead.org,
        paulmck@kernel.org, rostedt@goodmis.org, tglx@linutronix.de,
        willy@infradead.org, jon.grimm@amd.com, bharata@amd.com,
        raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com
Subject: Re: [PATCH v3 4/4] x86/folio_zero_user: multi-page clearing
In-reply-to: <CAGudoHEuRgDEHQOAsK=SmFu29a3NUyLDL1r5PVuahxbdOR6jZg@mail.gmail.com>
Date: Tue, 15 Apr 2025 21:46:25 -0700
Message-ID: <87y0w0vhlq.fsf@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MW4P223CA0018.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::23) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|PH7PR10MB6507:EE_
X-MS-Office365-Filtering-Correlation-Id: 18594bb6-472d-48c3-1cc6-08dd7ca1a5f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a09STmxpUmljMWxmcUdNamZ3QkQ3RThrUFhqS05zZEhqalZ4dFJBbzNDNTlu?=
 =?utf-8?B?d1dTeThpdkRWRG5WNThKWlluSHJmMEFWc2ZOQU1TUkNGcEpNZGlRb1JlaVdk?=
 =?utf-8?B?RTlhY2NOMVRwVFZjS0hhRXlIeDVrTzZHWWpYNVNBM2RFSFVEd2E4SHJFeEZ5?=
 =?utf-8?B?cHNEWXNGd0d5bm9lSkhUL0ZqVXRrdGZQcUF3cmVCWTQwdHpjNi9HSGNUWGNm?=
 =?utf-8?B?TlFvdEx5bUlQQW5Mc3FJVVQvMFRQSUxxczE2M214UG1oOGFKNS9lQzVuTm1i?=
 =?utf-8?B?K3g5d1JuKy9ieEY2U1p2d2pBdkZHNFZ4NmJKK3d5RXJTdzFqZFR3UU1talNw?=
 =?utf-8?B?WjNtTUZaeGtPaWt5NU54QlNjYkcwSWYwMjFpcXVYbXkzb25Wc3VwVmdtZXhW?=
 =?utf-8?B?WDJVSG5TUU1oMXplcHd4SFkzQTY2QzhpWkdDbGtsSE9uMUsvS2pwNStnOWFi?=
 =?utf-8?B?SHRvODlVOURieDVYc09nOUsxa3RTak9Henpqa1hvdVQrVzNOMG9WQk5zMzJz?=
 =?utf-8?B?WElZMU1FRzhYUWVyeC9PNXBuOWg1ZVEvVjFTS21QMk5sT3FrU0tRWExHY1do?=
 =?utf-8?B?Q1dsdHhjWDJiRmcyTUFxNU9YQU02ek1VeFBZYkJ1MWhDUGdTTkhLKysyUEtK?=
 =?utf-8?B?N1prOEMvY3JWSlcyMmxkdFFMUHFFNHVTVVgzTGk2eUhXZXJYeHZiNDgvcFNC?=
 =?utf-8?B?VkF4Z1hCbEVCbDc4M04rZEJIMldkL01HakxjNEU2Y3ZoeXNHcThxT1BLWGIr?=
 =?utf-8?B?eC9mK1ZNaWN4a2xtWmt5RHU1OU5zd1VKdVNhK0VxekVJK3BER3k4Rm9OaktO?=
 =?utf-8?B?RU5KK3R4QW9UbG8yR2ZCYkhvb3FkbS9PTlJjcG5xVCt2Lyt2T3lVOVZCdWpX?=
 =?utf-8?B?SEtYa21aL3htbjZPTitVY2lDOUpaT09ETE5CVktLeXpidjZVaUNKNFI3UUtZ?=
 =?utf-8?B?d3RJWms2anh6L0h4ZGJBL2swZlZ4eHEwRXJIU2wvNWRDakhXSVRoaklabjdj?=
 =?utf-8?B?M1NTRWIxb3ZRL3FpaW0zbkM4RkZ3QmZXRDlwY3BKMnJLVDV2UWczZGpxZlhW?=
 =?utf-8?B?MUtkUmgvSmp2emhzeFQ2YmRZd1E0UmY0L3R6RE81Zll5T2ZvaTRSeTdpS0Fh?=
 =?utf-8?B?WFlnM2JkU0dQTkJXRlVCVFVjRnE0eldONUlQVThjekZwZEtRRzkyVGNha3JO?=
 =?utf-8?B?eWVBanovb2ZWanlraHJLREJBZGhBa0JOc0VMd3dZTjBWYXM2NTBIOHhvcWUz?=
 =?utf-8?B?Ynp3WjQyRHlNOUNOam1VRTRZS2NUaTkvTzFxNGhwREN1VjJvZytwL3hIODV2?=
 =?utf-8?B?bkZjUkNOeHd4ZFFjRFFOREowWHdORm1aTU1NcHVUOGlzWHpGeEs1czBjOWFZ?=
 =?utf-8?B?WW93QUxJdVM2R1BqNU96M1VLQ0JlaTN3QkFjVXlIVVVwNm1BeE9yZ2FpM20y?=
 =?utf-8?B?ZzBJL3dKWXptcTlOKzlWTWlkOFdiU1hiSlJvYVZ6eXQ0WHUra1dsMVNTMTBn?=
 =?utf-8?B?Q2xoWmswRkUyQnhMZkhUTURuWXc1V0UxZ0tHS3Z1L2JwQlBTSHBvOTFEMnZp?=
 =?utf-8?B?bmNydEViUE5RbE5xSlVBR1UzVkkyMlh4dWhwLy9HWDQyMXNCbmJLRTJOajFi?=
 =?utf-8?B?TzkzNTBkU1VQaFRoRVRyQzRHbnV0RjExemtyNktOUWtUR28wM0xQalQ5ek1y?=
 =?utf-8?B?czhjZHdncjhhWkdhREZmRTlSYk43NTlpdFExM01RV01xVGRtMlNvRVU2UXNw?=
 =?utf-8?B?dnhtd2lOcDlweE1NY0JIbXdVcjZtVFZicTFDS0NBd0xKc1ZOOGQraWdUZU9Z?=
 =?utf-8?B?V2prUm9LSm9USWt1RFkwS2NDdGpVSjhnd3FoaW43V210VXA0ZnFYK3N5Yzhv?=
 =?utf-8?B?TFloOS9wUzJVNm5QMjNIOExYOGpYN0V1QmJ0VXkyd0FGY3N0QzErQ2FpUHRP?=
 =?utf-8?Q?SLiiJu0EKhc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmVhb1p0bGtRMkRKZ0xFcjBwckMvUmpoV3MzaUlRaGNpMG4zVTZiOTdIWHkr?=
 =?utf-8?B?bEJzSWIvbFFBZnJsNkVOVzRRMDM5dWZ4MVFEaVVSbVdsV0QvN3QxaFB1SjZJ?=
 =?utf-8?B?MWlpOGhRb2FlUmZEWGlLK05lZDl3dkxWQVRGWTAvZ21tL1U5ak5NL2xwcy9n?=
 =?utf-8?B?dFppeTkzcGpaMzFzbUp6SUJiNnhqYnM3c3h6eEhNcyt0M1BQdlN2TXNFZjlB?=
 =?utf-8?B?bXkxb2NvOENIWGYvYTI1N3Y3RnhCbGcwVks2TTNwYmVtT04vNmJHdEVGdUpF?=
 =?utf-8?B?bGNHQlY4M3dvZS9tK2trdXNlNWpHSmpKTEZSWnJlMHFmc29BRnVBNGd1TWM1?=
 =?utf-8?B?dFU0aHBtbVJUWGhWS3ZEcXVlckZXVEFabUVIVER1bVYrQXpGWDBFTkxuNG1h?=
 =?utf-8?B?RXROVXlkTEZvSGl2TEYzV25PWkFCMmxjWDdTZDJlRWZZL3A5RjZiWHVYOFNV?=
 =?utf-8?B?YnFoSzZDNUkwZTJ1a2hlS3hrYmhkdUtFUkRyazdpMjhtbXAzZjBuYzY3SjIw?=
 =?utf-8?B?ZDRMa1RUWSt3S3E2NEhPbkVsamZIRVlRYzAyRUJmL29MQzlDVVJWV05NWHIr?=
 =?utf-8?B?OHZkOGNTQkwza3diTEJaSm5LZUprcXZEUndXRFI3eURLRWpuV05KalM0aG9u?=
 =?utf-8?B?aE44d0pibTQ0S2pyYWZ6UjFQN0kwUjhzdXlqbHNUTDhtWkxXanJtQzE0K1hV?=
 =?utf-8?B?eWhvZFUrdEVUZUdHYnV6MlRYeWozdzRVcDc2ckZmOVIrbVRtU2JxZ1NTaTU4?=
 =?utf-8?B?Yk1mL1lHZWhCNzhyM2VCNXV4ZDVLdXQ1Y1o0bWliQmtnUk1DN3NyQVR6MEhZ?=
 =?utf-8?B?bkFSQVl4M1UzNmRpTkdSdGxoL0t3TDc5N1RFdmh5Z2pQYW5ZRVB6RVBDNDRs?=
 =?utf-8?B?YzRhdjZFYzA0eisxSjc0amhvTndxTzlDMmtqSnJVU1poSXk4NE9wMk9KeWdU?=
 =?utf-8?B?bXdzWlB3T0dnRk9XY1pZY2lCeEg1dzNrNWpvbFJRMEdHRklHTlRJNnBBZUgv?=
 =?utf-8?B?c1NDZFpTQTBENkFQQ2VVdnhmTVJ5QkNVY3NoUFJiWFVsQ3duQUdpa0xrWlZR?=
 =?utf-8?B?SUk1RzdueDdqS3pocXpWc1Z4d3lFVDBOUThGLzVvWW4xTG91YWgvMExaY3ly?=
 =?utf-8?B?aHhuQWNiWXp6eUNxTXc4QkZuS0hjZzFScEdBd3VHTzRVRENkVk9ydS83VnFo?=
 =?utf-8?B?YXg1Nkp2QUVGOFNZeHNRckFpenA4MW5tRTBtUURxZUg1MXpUZW16TGVvZVh3?=
 =?utf-8?B?cytTUVBBOVhKcWVsZnhPVlNlZXBwc251ZUhwczdxQ2Y4Z0c5T2ZuWE1TK3BP?=
 =?utf-8?B?RGliSUljd1JrT0FiS1U3SkVZUVNVYXJPSGlWQ0RPT0pqSUp6L2prbmxua3Z4?=
 =?utf-8?B?UEd1V0R4Q3g4M2JaaFhxM3lONlRtYmdJOVQ0M3hiVEdjNnhKT2FES1BSK0Ux?=
 =?utf-8?B?WmVTWnNvR2tsU3hGeEJtNGxqSTZ0OHNGQXNydDYwUzV2cTB6MWc5REk1amNZ?=
 =?utf-8?B?UWRyT0pVSHFnTm4zL0IvZzNTd2NqcUdFT3QwT25GRWdUNnBHd1R5SW4zbHU5?=
 =?utf-8?B?bnZPUjJRcUR3Si9RdHh2Z1hEYUNyd3BvSkFZdE5wZWUzRFgxN3lHcEVCcHlh?=
 =?utf-8?B?ODYwMnRVT0dWZ0Z0bVp2Y2dybnJjQ29wYXd5SFNrNUYrMTlJUEFaUzlLaFdk?=
 =?utf-8?B?elBabHlmWEtvM0dkUVZQTUtmWU4yeGRXM3NweUJUNDBqMzc4KzQ4d0tTR2NR?=
 =?utf-8?B?V2pMdkZneWVSN0x5ZWNScVl1SDZwS3oxODJFaTFObXR1WVFJc3ZlbDdoLzE0?=
 =?utf-8?B?elFFbmdqYWZnU2JGWi9sdUZ6ZWpuVHo4K3BhVWxIaVErajdkVDJrWitkZGxm?=
 =?utf-8?B?cnhteXpNRkkxYjFWNjJhRGlTajNBWjFsRTFzMEFCQzFDclN4SkhpUU1IREg4?=
 =?utf-8?B?eWpsZ3VKWmpHbzVDZ0FlS2dBVzYxaDdhQmZMdlhpYWlnZnV2NllnNEFqaW1K?=
 =?utf-8?B?cFo5WkpaQWlmVVBQSlZ2Y1U3U1U2T1NES3FQc3p1cHNBQTFqTzJUOFFmNXpk?=
 =?utf-8?B?b0dkL1YzczdzRUl6cUVTYjkwWjkwbUI4WkhZQXY1QTRKT0dwUDhiaFBvdUVL?=
 =?utf-8?B?S2JQT002SDE2OFROOVQ2M0wycFJYd3hxOUMrVExsYUoxWkswMkRuZ3pNajkx?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OurNBhHyeX8D43EHuzZFc38s/kEVo8QzoqKHW0J0r62BBNTSCDLE/ymYSvBJOw0V8jdXQOJjvXiVMpO2Lr7CjbUat9K5dCLyVu8wBU8QmQCkD/SxjRpIbelc3MXk1WOlgInHoATI3gOAv1/Y4EESw9jLRj20NtxcfNOMTxpQCIRKHcySqubss5KvJTAhEcCWVTBVyy/pVz8AOdpM4IOcenNhvqLL1ztk/wLRXv8rstMN9FWKUG/lABhJ8D6H/zgbG5NJmJqUToQ1IzlWoNsvqSNaOBBoL85pz+0Eu7KyoiC+7/x6XYHsElj5AM/VbCeQSLLKLIPPMJKSwZGYq1neSzCophpT/hK1b+EojPVFq9XJIrsQMcpmjktbKl4L05EPWVC4QJ05634bw7tu7vKHv1IdPDL5ZUpp2j7KxBkHuxfhL/YxzD5KP4fuFKYwhCZR4rOFDKduX+SHGpsVPwPybW4lF3JTOR+99v038WzgBGlXxXeMFH7WJl5GIsOA74vX45fm4JN1wJTMH8XG5xeD2PZaeMy8fZqETO93KbRsV5K4KsfyX/WcBEFgTKxOriLbAHPliRwx+4AYUk3XTwUvAAUNYX9EdkaNzQknbymT6+4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18594bb6-472d-48c3-1cc6-08dd7ca1a5f5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 04:46:27.7388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oFUHbwFnraQIJ642IUYrTEX09VLL1JYz2lMRIvOk2wIcRpw765o6B0DRjd2CVfRnIbq1qkP7wVi/d5GdmVVfdLwM6DwVZUF2l5OEQ45X8rU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6507
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504160037
X-Proofpoint-GUID: RAw72qhIXU9S3PgBGtY3Zu2nIfZYgSP5
X-Proofpoint-ORIG-GUID: RAw72qhIXU9S3PgBGtY3Zu2nIfZYgSP5


Mateusz Guzik <mjguzik@gmail.com> writes:

> On Tue, Apr 15, 2025 at 11:46=E2=80=AFPM Ankur Arora <ankur.a.arora@oracl=
e.com> wrote:
>>
>>
>> Mateusz Guzik <mjguzik@gmail.com> writes:
>>
>> > On Sun, Apr 13, 2025 at 08:46:07PM -0700, Ankur Arora wrote:
>> >> clear_pages_rep(), clear_pages_erms() use string instructions to zero
>> >> memory. When operating on more than a single page, we can use these
>> >> more effectively by explicitly advertising the region-size to the
>> >> processor, which can use that as a hint to optimize the clearing
>> >> (ex. by eliding cacheline allocation.)
>> >>
>> >> As a secondary benefit, string instructions are typically microcoded,
>> >> and working with larger regions helps amortize the cost of the decode=
.
>> >>
>> >> When zeroing the 2MB page, maximize spatial locality by clearing in
>> >> three sections: the faulting page and its immediate neighbourhood, th=
e
>> >> left and the right regions, with the local neighbourhood cleared last=
.
>> >>
>> >> Performance
>> >> =3D=3D
>> >>
>> >> Use mmap(MAP_HUGETLB) to demand fault a 64GB region on the local
>> >> NUMA node.
>> >>
>> >> Milan (EPYC 7J13, boost=3D0, preempt=3Dfull|lazy):
>> >>
>> >>                  mm/folio_zero_user    x86/folio_zero_user     change
>> >>                   (GB/s  +- stddev)      (GB/s  +- stddev)
>> >>
>> >>   pg-sz=3D2MB       11.89  +- 0.78%        16.12  +-  0.12%    +  35.=
5%
>> >>   pg-sz=3D1GB       16.51  +- 0.54%        42.80  +-  3.48%    + 159.=
2%
>> >>
>> >> Milan uses a threshold of LLC-size (~32MB) for eliding cacheline
>> >> allocation, so we see a dropoff in cacheline-allocations for pg-sz=3D=
1GB.
>> >>
>> >> pg-sz=3D1GB:
>> >>   -  9,250,034,512      cycles                           #    2.418 G=
Hz                         ( +-  0.43% )  (46.16%)
>> >>   -    544,878,976      instructions                     #    0.06  i=
nsn per cycle
>> >>   -  2,331,332,516      L1-dcache-loads                  #  609.471 M=
/sec                       ( +-  0.03% )  (46.16%)
>> >>   -  1,075,122,960      L1-dcache-load-misses            #   46.12% o=
f all L1-dcache accesses   ( +-  0.01% )  (46.15%)
>> >>
>> >>   +  3,688,681,006      cycles                           #    2.420 G=
Hz                         ( +-  3.48% )  (46.01%)
>> >>   +     10,979,121      instructions                     #    0.00  i=
nsn per cycle
>> >>   +     31,829,258      L1-dcache-loads                  #   20.881 M=
/sec                       ( +-  4.92% )  (46.34%)
>> >>   +     13,677,295      L1-dcache-load-misses            #   42.97% o=
f all L1-dcache accesses   ( +-  6.15% )  (46.32%)
>> >>
>> >> That's not the case with pg-sz=3D2MB, where we also perform better bu=
t
>> >> the number of cacheline allocations remain the same.
>> >>
>> >> It's not entirely clear why the performance for pg-sz=3D2MB improves.=
 We
>> >> decode fewer instructions and the hardware prefetcher can do a better
>> >> job, but the perf stats for both of those aren't convincing enough to
>> >> the extent of ~30%.
>> >>
>> >> pg-sz=3D2MB:
>> >>   - 13,110,306,584      cycles                           #    2.418 G=
Hz                         ( +-  0.48% )  (46.13%)
>> >>   -    607,589,360      instructions                     #    0.05  i=
nsn per cycle
>> >>   -  2,416,130,434      L1-dcache-loads                  #  445.682 M=
/sec                       ( +-  0.08% )  (46.19%)
>> >>   -  1,080,187,594      L1-dcache-load-misses            #   44.71% o=
f all L1-dcache accesses   ( +-  0.01% )  (46.18%)
>> >>
>> >>   +  9,624,624,178      cycles                           #    2.418 G=
Hz                         ( +-  0.01% )  (46.13%)
>> >>   +    277,336,691      instructions                     #    0.03  i=
nsn per cycle
>> >>   +  2,251,220,599      L1-dcache-loads                  #  565.624 M=
/sec                       ( +-  0.01% )  (46.20%)
>> >>   +  1,092,386,130      L1-dcache-load-misses            #   48.52% o=
f all L1-dcache accesses   ( +-  0.02% )  (46.19%)
>> >>
>> >> Icelakex (Platinum 8358, no_turbo=3D1, preempt=3Dfull|lazy):
>> >>
>> >>                  mm/folio_zero_user    x86/folio_zero_user     change
>> >>                   (GB/s +- stddev)      (GB/s +- stddev)
>> >>
>> >>   pg-sz=3D2MB       7.95  +- 0.30%        10.90 +- 0.26%       + 37.1=
0%
>> >>   pg-sz=3D1GB       8.01  +- 0.24%        11.26 +- 0.48%       + 40.5=
7%
>> >>
>> >> For both page-sizes, Icelakex, behaves similarly to Milan pg-sz=3D2MB=
: we
>> >> see a drop in cycles but there's no drop in cacheline allocation.
>> >>
>> >
>> > Back when I was young and handsome and 32-bit x86 was king, people
>> > assumed 4K pages needed to be cleared with non-temporal stores to avoi=
d
>> > evicting stuff from caches. I had never seen measurements showing this
>> > has the intended effect. Some time after this became a thing I did see
>> > measurements showing that this in fact *increases* cache misses. I am
>> > not saying this was necessarily the case for all x86 uarchs, merely th=
at
>> > the sensibly sounding assumption turned bogus at some point (if it was
>> > ever legit).
>>
>> That was a long time ago though ;-). And, your point makes sense for
>> small sized pages. But, consider that zeroing a 1GB page can easily blow
>> away an L3 cache for absolutely nothing gained -- probabilistically,
>> nothing that was in the page that remains in the cache will ever be
>> accessed.
>>
>> Now, you could argue that the situation is less clear for 2MB pages.
>>
>
> Well I was talking about 2MB. ;) I thought it is a foregone conclusion
> that 1GB pages will be handled with non-temporal stores, but maybe I'm
> crossing my wires.

Or I am. I agree the situation is less clear for 2MB. I think for the
immediate neighbourhood we clearly do want temporal.

For the rest, L2 sizes are typically ~2MB or less. While there might be
latency benefits for caching the rest of the page, there are clear
negatives to blowing away state that was definitely useful in the
near past.

Would be good idea to quantify. Not sure what's a good benchmark to
do that though.

Ankur

>> > This brings me to the multi-stage clearing employed here for locality.
>> > While it sounds great on paper, for all I know it does not provide any
>> > advantage. It very well may be it is harmful by preventing the CPU fro=
m
>> > knowing what you are trying to do.
>> >
>> > I think doing this warrants obtaining stats from some real workloads,
>> > but given how time consuming this can be I think it would be tolerable
>> > to skip it for now.
>> >
>> >> Performance for preempt=3Dnone|voluntary remains unchanged.
>> >>
>> >
>> > So I was under the impression the benefit would be realized for all
>> > kernels.
>> >
>> > I don't know how preemption support is implemented on Linux. Do you
>> > always get an IPI?
>>
>> No. The need-resched bit is common. It's just there's no preemption via
>> irqentry, just synchronous calls to cond_resched() (as you mention below=
).
>>
>> Zeroing via a subroutine like instruction (rep; stos) is incompatible wi=
th
>> synchronous calls to cond_resched() so this code is explicitly not calle=
d
>> for none/voluntary (see patch 3.)
>>
>> That said, I'll probably take Ingo's suggestion of chunking things up
>> in say 8/16MB portions for cooperative preemption models.
>
> makes sense, thanks
>
>>
>>
>> > I was thinking something like this: a per-cpu var akin to preemption
>> > count, but indicating the particular code section is fully preemptible
>> >
>> > Then:
>> >
>> > preemptible_enter();
>> > clear_pages();
>> > preemptible_exit();
>> >
>> > for simpler handling of the var it could prevent migration to other
>> > CPUs.
>> >
>> > then the IPI handler for preemption would check if ->preemptible is se=
t
>> > + preemption disablement is zero, in which case it would take you off
>> > cpu.
>> >
>> > If this is a problem, then a better granularity would help (say 8 page=
s
>> > between cond_rescheds?)
>> >
>> >> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
>> >> ---
>> >>  arch/x86/mm/Makefile |  1 +
>> >>  arch/x86/mm/memory.c | 60 ++++++++++++++++++++++++++++++++++++++++++=
++
>> >>  include/linux/mm.h   |  1 +
>> >>  3 files changed, 62 insertions(+)
>> >>  create mode 100644 arch/x86/mm/memory.c
>> >>
>> >> diff --git a/arch/x86/mm/Makefile b/arch/x86/mm/Makefile
>> >> index 32035d5be5a0..e61b4d331cdf 100644
>> >> --- a/arch/x86/mm/Makefile
>> >> +++ b/arch/x86/mm/Makefile
>> >> @@ -55,6 +55,7 @@ obj-$(CONFIG_MMIOTRACE_TEST)       +=3D testmmiotra=
ce.o
>> >>  obj-$(CONFIG_NUMA)          +=3D numa.o numa_$(BITS).o
>> >>  obj-$(CONFIG_AMD_NUMA)              +=3D amdtopology.o
>> >>  obj-$(CONFIG_ACPI_NUMA)             +=3D srat.o
>> >> +obj-$(CONFIG_PREEMPTION)    +=3D memory.o
>> >>
>> >>  obj-$(CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS)      +=3D pkeys.o
>> >>  obj-$(CONFIG_RANDOMIZE_MEMORY)                      +=3D kaslr.o
>> >> diff --git a/arch/x86/mm/memory.c b/arch/x86/mm/memory.c
>> >> new file mode 100644
>> >> index 000000000000..99851c246fcc
>> >> --- /dev/null
>> >> +++ b/arch/x86/mm/memory.c
>> >> @@ -0,0 +1,60 @@
>> >> +// SPDX-License-Identifier: GPL-2.0-or-later
>> >> +#include <linux/mm.h>
>> >> +#include <linux/range.h>
>> >> +#include <linux/minmax.h>
>> >> +
>> >> +#ifndef CONFIG_HIGHMEM
>> >> +/*
>> >> + * folio_zero_user_preemptible(): multi-page clearing variant of fol=
io_zero_user().
>> >> + *
>> >> + * Taking inspiration from the common code variant, we split the zer=
oing in
>> >> + * three parts: left of the fault, right of the fault, and up to 5 p=
ages
>> >> + * in the immediate neighbourhood of the target page.
>> >> + *
>> >> + * Cleared in that order to keep cache lines of the target region ho=
t.
>> >> + *
>> >> + * For gigantic pages, there is no expectation of cache locality so =
just do a
>> >> + * straight zero.
>> >> + */
>> >> +void folio_zero_user_preemptible(struct folio *folio, unsigned long =
addr_hint)
>> >> +{
>> >> +    unsigned long base_addr =3D ALIGN_DOWN(addr_hint, folio_size(fol=
io));
>> >> +    const long fault_idx =3D (addr_hint - base_addr) / PAGE_SIZE;
>> >> +    const struct range pg =3D DEFINE_RANGE(0, folio_nr_pages(folio) =
- 1);
>> >> +    int width =3D 2; /* pages cleared last on either side */
>> >> +    struct range r[3];
>> >> +    int i;
>> >> +
>> >> +    if (folio_nr_pages(folio) > MAX_ORDER_NR_PAGES) {
>> >> +            clear_pages(page_address(folio_page(folio, 0)), folio_nr=
_pages(folio));
>> >> +            goto out;
>> >> +    }
>> >> +
>> >> +    /*
>> >> +     * Faulting page and its immediate neighbourhood. Cleared at the=
 end to
>> >> +     * ensure it sticks around in the cache.
>> >> +     */
>> >> +    r[2] =3D DEFINE_RANGE(clamp_t(s64, fault_idx - width, pg.start, =
pg.end),
>> >> +                        clamp_t(s64, fault_idx + width, pg.start, pg=
.end));
>> >> +
>> >> +    /* Region to the left of the fault */
>> >> +    r[1] =3D DEFINE_RANGE(pg.start,
>> >> +                        clamp_t(s64, r[2].start-1, pg.start-1, r[2].=
start));
>> >> +
>> >> +    /* Region to the right of the fault: always valid for the common=
 fault_idx=3D0 case. */
>> >> +    r[0] =3D DEFINE_RANGE(clamp_t(s64, r[2].end+1, r[2].end, pg.end+=
1),
>> >> +                        pg.end);
>> >> +
>> >> +    for (i =3D 0; i <=3D 2; i++) {
>> >> +            int len =3D range_len(&r[i]);
>> >> +
>> >> +            if (len > 0)
>> >> +                    clear_pages(page_address(folio_page(folio, r[i].=
start)), len);
>> >> +    }
>> >> +
>> >> +out:
>> >> +    /* Explicitly invoke cond_resched() to handle any live patching =
necessary. */
>> >> +    cond_resched();
>> >> +}
>> >> +
>> >> +#endif /* CONFIG_HIGHMEM */
>> >> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> >> index b7f13f087954..b57512da8173 100644
>> >> --- a/include/linux/mm.h
>> >> +++ b/include/linux/mm.h
>> >> @@ -4114,6 +4114,7 @@ enum mf_action_page_type {
>> >>  };
>> >>
>> >>  #if defined(CONFIG_TRANSPARENT_HUGEPAGE) || defined(CONFIG_HUGETLBFS=
)
>> >> +void folio_zero_user_preemptible(struct folio *fio, unsigned long ad=
dr_hint);
>> >>  void folio_zero_user(struct folio *folio, unsigned long addr_hint);
>> >>  int copy_user_large_folio(struct folio *dst, struct folio *src,
>> >>                        unsigned long addr_hint,
>> >> --
>> >> 2.31.1
>> >>
>> >>
>>
>>
>> --
>> ankur


--
ankur
