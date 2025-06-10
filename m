Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964F724DD14
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 18:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749581582; cv=fail; b=cbjfLMwEqqy7/Z9GrSgdSLD4l2hCXmQMTXKhA+W7U/9ypLDMzirstgcYLacFYKFQfNDPhmxXxLGmdIfeZ6rKyszyID02YGjbHmh/6tiSlf31SZQuEH+z7cI1/1BbbMvQPoIjaqwzTIGwALZ8oHcCzFSz9e3RQRJ5hFLOaJaWbjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749581582; c=relaxed/simple;
	bh=lrX/I/a9k5pH0QSO/iRkITftVZr9l7E4HP/FNXA+478=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hij4xEh4x9pRY61e5OKiH7qBmo5nYCFT26qc1VgCSyg0lYn9Sr+R33eNApJ0IqiM21KXHiwnqEdSI+fb7Mtw6GPNdIiV9+ALp+wNeR7E+jRShV7XexoY6XpMIVWaAmcFlOZQ78Kumi6uL2GJcp/dhO/9Zg/2PX/Tzgkl7zew8Fw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dwlsyO/g; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SjskfoKW; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dwlsyO/g";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SjskfoKW"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AGN1Fc014830;
	Tue, 10 Jun 2025 18:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Tb5ML67LB/otpRQ2aoq91bj1/X3XnzDZG1J3L150lxw=; b=
	dwlsyO/gBlBqBwENsmTSTMgDys87eZB+MmJ6GC3YxRN7LUkHDbP12X+scusmoS+/
	AOmSWwUx6xLWujz68Q9NPXvpGm8q8urMoU8yWbNoGqhmpSmKSMGcOhRlGhaHSUFq
	R+3417qFvvioreEYBxrUxZX4rwNXYkGSfgWVKH/XhzTUcMx6wxafKzNIbqpqGIl4
	bsg8Qce29Ma96expbGqeAEDVoGpjPs9vtuWmcG24xsqqTs7A16TbNvyoOKn5z0i1
	M24qww1SHkhn4Bh09jzLwft06mQOXjVP584iBUxj78uyv2XX1ugaaLhig/SePoBM
	Edb9eqVZp8xPZC37ULd0EA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474buf4w9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jun 2025 18:52:35 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIpGkt007524;
	Tue, 10 Jun 2025 18:52:34 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010046.outbound.protection.outlook.com [52.101.193.46])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bv8vf2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jun 2025 18:52:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hA3xSGo5gmePBbOMpjWhkHDxQM9oik7M4Qi/YDUzenQd6OuOMI0RU/TvaLcjt0+WucIc3Z8spaip/wWSFxaHym3IF9Q3IWmjZxNDo5ouffHVDW1Y8VdAq5IquofhikZWDr5lztnYdC0oKJiRqbHVdMkR9m7WX/murd9JHnkFPTFLVora9KFAMLyORaBWwl66ybLoHi9KkiMJZSPkhuSnQi+4coVAQExm7Ygd021aNQUa1CnzdfGWxfui0w8HXIqVz5fam2g5y2XcAcxZMDuMbQ4op86JQJNQgNQnCoKTlJk21+1TfLFQKKz0uKzk9W740iJy7m/pSky3mo8H9ptgIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tb5ML67LB/otpRQ2aoq91bj1/X3XnzDZG1J3L150lxw=;
 b=iEeyBEVbhYkCw3K62JHLRNjQ92Pzc44fZd8AbNdPO9139Rz7V5IGKdVURggLaiTbLEwP15Wg6CWe1kZlg8V3lfFlMcmHt9WD0q9wnVoEZh5w7CYx4aRAjR8aDAz4KrqsxMMBg7QTg/OXx6SScMQVyx088h5iQ6RrNZwJI5jGC3bwoMnYde9eBYT2nmCelOq7c6aTGirM8GUIcnjuviwT9q7rqxheBOt+tpOinV1hnrEYu/5H1C0gprSBJV99+ibkD30HHT51wFBe1Du3EpN7Yrg2MtlPmxLzVadaCFWvA6euRL7CIwhz5jko+LFdRri2a4D66e+YemjlcUUnfHI94w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tb5ML67LB/otpRQ2aoq91bj1/X3XnzDZG1J3L150lxw=;
 b=SjskfoKWLDvX0B3RVnmNTMmeKn3vWTtIRr2qy06NFNx6idWMLGqCvddsjG98z4Tg4zxxiRWVwdt7wrBjJnACc1A8oTRA8NYNpmi6ZQwz3rIFo13WumMsQ0Twa+MKfJi3ym0HSbdcdFSMzt0jv0BkGT3muQ7NLYUqLPNnrR+EUQw=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA1PR10MB6367.namprd10.prod.outlook.com (2603:10b6:806:257::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Tue, 10 Jun
 2025 18:52:29 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 18:52:29 +0000
Date: Tue, 10 Jun 2025 19:52:26 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
        Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>,
        Lokesh Gidra <lokeshgidra@google.com>, Mike Rapoport <rppt@kernel.org>,
        Michal Hocko <mhocko@suse.com>,
        Tangquan Zheng <zhengtangquan@oppo.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>
Subject: Re: [PATCH RFC] mm: madvise: use per_vma lock for MADV_FREE
Message-ID: <8e3b3a63-9060-4bf9-ad85-3ef5f5d541db@lucifer.local>
References: <20250610055920.21323-1-21cnbao@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250610055920.21323-1-21cnbao@gmail.com>
X-ClientProxiedBy: LO2P123CA0088.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::21) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA1PR10MB6367:EE_
X-MS-Office365-Filtering-Correlation-Id: 04ecef0c-881a-42e6-4fcf-08dda84ff322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MDAvcDJsOXYwZlh5cHE4RXZLSHgwUU5uNEZadmt1L0tCaFN5RmlqenRjeHlv?=
 =?utf-8?B?NXRtalVIVGY5K0JZMjRaSDVHdzNpVXNleVMxWW56Zk9LUldWNnFTYmdTcm9D?=
 =?utf-8?B?MHRUT3cwUmRrMDk2ak51Y2k1YTlFR255VUtzVm9PMDZWWnZURGpQVlRzVjMx?=
 =?utf-8?B?cnV6eFVOMEx5WFhJV0pYUmNhbWh4V0VWc1J6VnI3dTVrSFEvSDlwSkFOOEJj?=
 =?utf-8?B?TUd6VjZ0aXVKRzU2d1lZVGlrQjVmbHNialhGRk94QWU4c2VtV25HWUpoWjBK?=
 =?utf-8?B?N0xJMXI4L1dSM0VJc3oxQlVKQVNpQkROZFRDY2tYcXk3ZTh1U3JmSVhNWHpE?=
 =?utf-8?B?VnZtblQvRXpVNlh5SXlYSnlHbTRka1dDNjAreTdJYkVXaGNJSm15a3J1U01y?=
 =?utf-8?B?eUJuVlkvQnpGSXBBUUdNVFg4ayszQ1M1QjdpS3BSZ2RNUlg3TUFod1d6ZklL?=
 =?utf-8?B?UitWa2E0VkVFTlhKeUttUTd3UHNuM2xjdk9uT0VDTDk5ekNyMGFzWTN1dUk1?=
 =?utf-8?B?U1BkaWZFSmJEaUZXeHpqajJrV2dmYitrb2pBOGNHUHRSbU05cVRxMjNvZ09o?=
 =?utf-8?B?TmVTSU9xSmx4cEdlOGMrd2lidk9Wc2F1TS9YUzhxaDk1MzlDd3ZMUjFvVjlP?=
 =?utf-8?B?cUpwV2tHOEZHWFltTVVMNUdjUFMvZi9rTUpIaHhDN05CQWhCU0dRNWtsaWpC?=
 =?utf-8?B?TWJSeUF5NEpQSDB4NjIwSUxpcXFHVEdITU5pV2FZUGVSbWxMRVdqb0FKSTFU?=
 =?utf-8?B?U0QzVU1tWUpvWXVWRXFackNxM1VXclY0RWJLTi85Q09lVnNlYU12K3ZGTHpY?=
 =?utf-8?B?dkJCZ1VHSDVTN1BVTFJqdEduMDh4UnFiK0xpSEw2cHh5VTZPMHJkSFhGMlhC?=
 =?utf-8?B?aUpTSmhMYzQ2UEFVemNDYWVFMjh1dWEwWjB3SDVTV0dNZWo4V0xKdXRLRkU2?=
 =?utf-8?B?T1NmQm8ydkVkRWh1eFBuWlRqQjFzc0VtL0FXeTJYVUlsdmlpWElZUXJIU1NN?=
 =?utf-8?B?d25EblJBQmxDMFpzQVZPbk9CZ3JVTXNlZlVOT2JmU1ZWZDF2MGJtOVhQVHQw?=
 =?utf-8?B?RENrRUc1MEhYRGhYZDI1aFJqNXlISHFKOHBhRU55QUVVUWJmelFMWFVsVDJP?=
 =?utf-8?B?ZmZXRVF6Tlpvdy9pZlR4cEpmRHNrUm9pQ1BtR2JWNDZ5Q2ZKQnFWdUNWZS9Q?=
 =?utf-8?B?RFduanEwUXZkVWNzOTNwUHRlcnlHbVNhUUQvREZHN1ZSWG53bHgrSUpTcFFr?=
 =?utf-8?B?QlZhSlk4c2pFSlRjRk4xYXRrS0c2V3hVSlRWaEMrNWNON3lveHFobGNWcnBR?=
 =?utf-8?B?Vytha3I1a2lDZUVQcmErdSt0b0xmbXQwMU91VHFJMTFSdEJHQmxST0E4UGZ1?=
 =?utf-8?B?NGF0Ujh0SnNkYWZhUkJaMFRKdFh6SjZINDZ2QWpaN0c0ZVNnbDlPUXE2MjlG?=
 =?utf-8?B?Y2FwemRWSFIyb3pYN2YrdEROOVkvb3kvOUxEaW9kUDhYRDROZUtneURIdnNU?=
 =?utf-8?B?Rm4ycDFaY1l3ckJoU2dsNEVxU0syUWh0UUViS0hpUk5lRjNDVzZRZzJROXZB?=
 =?utf-8?B?Vi9hdkxhbU0vakVTdVVpM1RBUFhiUkhocUliVHdGcE1tN3lqTEJ2c3dYUWJq?=
 =?utf-8?B?YklEekJjOFRLTTd1QUJhcWZtSllldWE1VUh2ODgvYTBxdlg1U3B3cGFUenVk?=
 =?utf-8?B?c0dxR2FwYmJVOXd5K3FCQmx5dXozRFFpMitsRTRCZmduRm1VZUVHK1BFOGNK?=
 =?utf-8?B?T1l4K1cxZzVqN3R6YlRCNXZLK0dxQlBwMzY5aEVjNC9hNTcvbk5aOEtkQmJN?=
 =?utf-8?B?YUZVbkNCcUNvQ3U1T2pIMjdXVkpCdFhyK0NtWmh0c1pRWTFnSjZFQmt3a1ov?=
 =?utf-8?B?RkV2WEtWNGRJVGdBdng4bmRLNHZvNmtWbGRTM3drd1R4TGt1QVc1cUVFZGE3?=
 =?utf-8?Q?T39Z82DElHY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alE3d25uKzNObmZGcStEL1lhMWJXVXpzcmg1cHV4K1RWMGFRTERYUDdlV2x2?=
 =?utf-8?B?OEVFenhxYmRVeGhyQ1pjN2dqUU43NG9IdEZwNnJ4NUZsMzFSNUdSNTVaQTAr?=
 =?utf-8?B?c3NVc0Jic2ZwWlNSa1lUdjRoejBrN1dYQkc1Um1KQmpXakJBS0E5UGlXOG1P?=
 =?utf-8?B?SFBxdjhTbGY4ZC9GSFQ5OWlLcFRmTmJZWndBQ3dwOHVudVZIUEVQRHVTSHh3?=
 =?utf-8?B?TWl3MEkxQ2w4YUZWTjJRakJNamxmTGttVHRneVk3R2VqQ24rOUlwL1k3bFJy?=
 =?utf-8?B?MHU1ZnEvV1N0SEtoWGZwaU9GQXdaU004c3RJaGVJbitjZjN1M3ZQdURnSEJC?=
 =?utf-8?B?ZDhvS0JTeWJMY3ZPbFkwVHc3TmZkYXNRV1kvZkRabGY5Wi9FY0l1MEEvcGJH?=
 =?utf-8?B?UHlmRXVQeXBWZzBna21WdW4yM1hHaGh0T05XM2R1Z05sZ2dmMjlHbXVqbkNm?=
 =?utf-8?B?cTJGRllNZER0Z2xjcTVRbFdCN3dXM04xUGdvaVdVZWE0MkJrenFBS1pKaHM5?=
 =?utf-8?B?SFVXbktlUTBzZVRzd1dRSHBwQ3FmUVRscEo0Ykt3T04zQm9Yd2xadWJic3ky?=
 =?utf-8?B?eG9YUEk2d05xcGRoc1dHRWgyaTBmZ1Y4akRwUzlQdXAvSTZGSExZb0xQWTN2?=
 =?utf-8?B?THA5SkRJT0RicTREaHBkcEVCb3ZNcGg0V2wxYlFaT2NLMzhDNXZUMXpWeFJO?=
 =?utf-8?B?OTNTT2FlVDdsNm93UHpoSVgzMG1HQ0I4MUxoMEdqOWFjVFdIZkgvNzRCM3pT?=
 =?utf-8?B?MElhZUJ1KzBkRGdCUVQwR0YvVjJPajN6ajFDcFVKNVBwM3hPK3RNaCtITS9v?=
 =?utf-8?B?T3ZkYW9DSjBmOVFSQzNvcHBqbml6Tm1YdG90Zk4wU0d0UHJCSXhrbkEveHE2?=
 =?utf-8?B?cHlWVUc5bTRYMTF3eFJQTnBUVmhBMStKdnB3MkFNQXlteXhmWUdMWjM1T2dW?=
 =?utf-8?B?bzdhbVluQTlFLzJxODJoMlZBNldBZGNIQ2FqZmRhQW04VzdvYXdpR2g4YWY1?=
 =?utf-8?B?T2s2Y015VXZuZTYvQUJnVkpqdDlORUpzMEtnM3hsQ281Q2lVTTNXQ1JEVHkr?=
 =?utf-8?B?bTYvOUJTZDkvcnovNEU1RnozZTg2MzZRZlFvY1FVZkJTTytGL3BGVWhTd1Aw?=
 =?utf-8?B?Q1E5UWVWaG8yVC9xVW5pV3N5VU9OVndrYTVPaWdIcnZYMm5VVG5SaEozampD?=
 =?utf-8?B?WDlPSk9YbGNKUUN0TWtWdWhQZnM2TTdua0Q3VlRMZzNGSjlkMmhMQXUzVkZK?=
 =?utf-8?B?a2dYby95YmlLN2hlTE1IZmlrK29oVE1BZ3Z0L1VXekNuVnBTYmlabzVWdUxo?=
 =?utf-8?B?Y01TeWVKdFdDRHlYK25CMW1XenlMOGRrR2FhbzNMWDNQWjdLTmxlL2hYQzNz?=
 =?utf-8?B?R2ZxREJVM3BKSEduSll1bE1aVnQvY2RLdlhBS3lhMUVlZENJUENDR1B3TmNo?=
 =?utf-8?B?Qlg0dkxLTXAwWDhkMER5eUpzL3NDbE0xdSt3dmZnV1BRTitZcXJ1QmJyT3lm?=
 =?utf-8?B?dEEyR28yc1NxTU0yYS9ldzV6ckNGVWhQMWJoTDFVeHFrL2N3M2NPZ2RHT2ZI?=
 =?utf-8?B?elQ2Rkp3T25KNjVpOU9DUXZvam9JOHFuYTg4SW9ldVdPMWk1QUdjL1pwMVkx?=
 =?utf-8?B?TzlETS8xWW81L3lvUUlVL0hlcmVhNkVIaytvQUFMSHhPakRURFh4anFHN21T?=
 =?utf-8?B?bjRIL2U2T0ZnbkhwMUxvNVd4VGdVd1lvb01tUjVQTUN5TUxUcTRjSUI3SG8x?=
 =?utf-8?B?cWZZQWtHazJtRzQrSGVOM3c1MVorWTNaN2R5RzMvV01zN0JOZU83Zjlkc01L?=
 =?utf-8?B?Z3FEYXNMNkFFZmlJWXNEenFLNDVDZGlKZHJrbG1JaEJXM0JEV2h0dmRuWWJW?=
 =?utf-8?B?U05MY2tVMGdmRVdZMGdzTWhzL1ZQakJOSk5KTHZhZU52dzFTenczZnN6QUVD?=
 =?utf-8?B?NGZIVUw2ZGdzbWVVRmJPb3NtK1doZDhLeTRtM2VjNm9Pb0tDeDZvd2krRW1k?=
 =?utf-8?B?S3lQVjZIbzlVUm5PVUZTeDVGNnROTXRKcy9aRzh4L09EWnRJU1FvN0orS0lw?=
 =?utf-8?B?Y25mcWRpV2tNcUFKTThOVzBmcHBoOGI4YWdBeGZKcVhob2JoS0UyZ1ZYOU0y?=
 =?utf-8?B?R2pTeEVETC9EbFdla2UxQ0lzNDE5SlJOZE5YMlcydk00S0RhMjNFUm1wY2ho?=
 =?utf-8?B?SHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QdAXii06TLds22+9851hTiUhOltseiXI/gAXp3jEvw4aj3fZq96qxGPQNX0EXuQtJmTkp49n54ok3LGdKCNUw+ThNYPzuY6xP+wYZC5dm0z/EuWx1iYxse/UCCnFvEIEHwZQO/6SVCCZwdaydU/WZ4J+LRk9Z29JduS3RmyqtLwi5sz0Opnh9ax9XaA59fsLY5NFVIlU9j9UaJ/v65tAzYxiKweBPHsEmbnD+Pi/6v22v91ZFbecB+eIamIGZRtoz9tF3vJcy4pl8Z0AmZSmfonweb3mE5wELpZI6w38VThLeny0v9+cDjms7Vm4tUoat81GvQD9bK9+gZIB0z1Xpn+xyOty0dLm5fIZiCDQ1Uhm07qhAZJsQlxtEtwPjKaqdT9r4ei7mGOjlf9wyBIJGn5+MgusyNW1pv6cbGOSyqwiGNsKCd6Qh+JZlvjS7Iup3USoUHgc5CW8np53Mxqb9n7Qk9JFcMA96djbYzUyu94JL2QoCiPAWcpaG0tf2IelSmoI7+CzO4QpNBLe+zPEbIIrTIOp2oyYKPFpC7ZDv+8XMxeoymA04Op6nG3xi7cNnET1SI/QxTZVrFUvd02LRKKwrfUmTzSPHoOpxvmXWZM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ecef0c-881a-42e6-4fcf-08dda84ff322
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 18:52:29.2467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AeEf1UmIzzLVZf+uYTfbRZ3DVWxzSNiFLJRtXQsMPChOZ5Aff9RRzYBdEar1uDe8rgHFWj0eZ/hxpwDBC9aihBAnOFmWwRhbqHPKxbWjw5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6367
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_09,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506100153
X-Authority-Analysis: v=2.4 cv=RZGQC0tv c=1 sm=1 tr=0 ts=68487ef4 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=A2pY-5KRAAAA:8 a=yPCof4ZbAAAA:8 a=20KFwNOVAAAA:8 a=1XWaLZrsAAAA:8 a=VwQbUJbxAAAA:8 a=iox4zFpeAAAA:8 a=968KyxNXAAAA:8 a=nBnOKZhBXdC0706E4UAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-GUID: VN9umH9j-slUz-wRzyzezTi0WuaBspE-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE1MiBTYWx0ZWRfX/hhk5uXN5qNH W9+xAycVccPS5PftROcKSiZgvB3nz5pDPLThmLUwLUeVAuL9GL3+nyJM+zB0pM1hDtgAC2Lib6l Ykz9jZ/I3CDiYZYvtgRkj8yKrf9KBMEQ3qYkTFBljRmFELJyX+Gwk/0NlEKbAND/Lq1aTODDqco
 ohPL97HD5sgxVVWJPX9QHSgtz/NIVSaC0z6AqaVoqwf3JshebuOvCvKjlFcAloHyoMdaoKch7H6 MPJIEE/pcyu+lPBHHlkngkZKTUvamHpQcVR/Qg4pjDatKo1mnrFmymrcPusur8Q+fM62qY43L4m 7LwqFaKZ7pXoT7meSAzMcuvcoIV0vf3Gg/Z0604pzKWoEEh+oxZqhw8v03jghSrDtmpKWTvg7Qx
 51w1vEa6lY0qwtR4715KPRIpxzJjnssEjrDVkJi/XuOxV1gHRMIXMLUaKkQWSyHOVEZO1Z18
X-Proofpoint-ORIG-GUID: VN9umH9j-slUz-wRzyzezTi0WuaBspE-

On Tue, Jun 10, 2025 at 05:59:20PM +1200, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
>
> MADV_FREE is another option, besides MADV_DONTNEED, for dynamic memory
> freeing in user-space native or Java heap memory management. For example,
> jemalloc can be configured to use MADV_FREE, and recent versions of the
> Android Java heap have also increasingly adopted MADV_FREE. Supporting
> per-VMA locking for MADV_FREE thus appears increasingly necessary.
>
> We have replaced walk_page_range() with walk_page_range_vma(). Along with
> the proposed madvise_lock_mode by Lorenzo, the necessary infrastructure is
> now in place to begin exploring per-VMA locking support for MADV_FREE and
> potentially other madvise using walk_page_range_vma().

Thanks :)

>
> This patch adds support for the PGWALK_VMA_RDLOCK walk_lock mode in
> walk_page_range_vma(), and leverages madvise_lock_mode from
> madv_behavior to select the appropriate walk_lock—either mmap_lock or
> per-VMA lock—based on the context.
>
> To ensure thread safety, madvise_free_walk_ops is now defined as a stack
> variable instead of a global constant.

A nit but I'd add 'because we now dynamically update the walk_ops->walk_lock
field we must make sure this is thread safe' or something like this to clarify
the need for this

Did we not have to worry about this before I guess because the mmap lock would
exclude other threads?

An aside, but I wonder if we have this implicit assumption elsewhere that VMA
locks defeat... hm :)

>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Jann Horn <jannh@google.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Lokesh Gidra <lokeshgidra@google.com>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> Cc: Qi Zheng <zhengqi.arch@bytedance.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>

Looks good to me, kinda neat how the previous work for the MADV_DONTNEED under
VMA lock stuff made this pretty straightforward :)

So:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  include/linux/pagewalk.h |  2 ++
>  mm/madvise.c             | 20 ++++++++++++++------
>  mm/pagewalk.c            |  6 ++++++
>  3 files changed, 22 insertions(+), 6 deletions(-)
>
> diff --git a/include/linux/pagewalk.h b/include/linux/pagewalk.h
> index 9700a29f8afb..a4afa64ef0ab 100644
> --- a/include/linux/pagewalk.h
> +++ b/include/linux/pagewalk.h
> @@ -14,6 +14,8 @@ enum page_walk_lock {
>  	PGWALK_WRLOCK = 1,
>  	/* vma is expected to be already write-locked during the walk */
>  	PGWALK_WRLOCK_VERIFY = 2,
> +	/* vma is expected to be already read-locked during the walk */
> +	PGWALK_VMA_RDLOCK_VERIFY = 3,
>  };
>
>  /**
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 381eedde8f6d..23d58eb31c8f 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -775,10 +775,14 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
>  	return 0;
>  }
>
> -static const struct mm_walk_ops madvise_free_walk_ops = {
> -	.pmd_entry		= madvise_free_pte_range,
> -	.walk_lock		= PGWALK_RDLOCK,
> -};
> +static inline enum page_walk_lock get_walk_lock(enum madvise_lock_mode mode)
> +{
> +	/* Other modes don't require fixing up the walk_lock. */
> +	VM_WARN_ON_ONCE(mode != MADVISE_VMA_READ_LOCK &&
> +			mode != MADVISE_MMAP_READ_LOCK);

I find this a bit hard to parse...

> +	return mode == MADVISE_VMA_READ_LOCK ?
> +			PGWALK_VMA_RDLOCK_VERIFY : PGWALK_RDLOCK;

...might be better as something like:

	switch (mode) {
		case MADVISE_VMA_READ_LOCK:
			return PGWALK_VMA_RDLOCK_VERIFY;
		case MADVISE_MMAP_READ_LOCK:
			return PGWALK_RDLOCK;
		default:
			/* Invalid. */
			WARN_ON_ONCE(1);
			return PGWALK_RDLOCK;
	}

> +}
>
>  static int madvise_free_single_vma(struct madvise_behavior *madv_behavior,
>  			struct vm_area_struct *vma,
> @@ -787,6 +791,9 @@ static int madvise_free_single_vma(struct madvise_behavior *madv_behavior,
>  	struct mm_struct *mm = vma->vm_mm;
>  	struct mmu_notifier_range range;
>  	struct mmu_gather *tlb = madv_behavior->tlb;
> +	struct mm_walk_ops walk_ops = {
> +		.pmd_entry		= madvise_free_pte_range,
> +	};
>
>  	/* MADV_FREE works for only anon vma at the moment */
>  	if (!vma_is_anonymous(vma))
> @@ -806,8 +813,9 @@ static int madvise_free_single_vma(struct madvise_behavior *madv_behavior,
>
>  	mmu_notifier_invalidate_range_start(&range);
>  	tlb_start_vma(tlb, vma);
> +	walk_ops.walk_lock = get_walk_lock(madv_behavior->lock_mode);
>  	walk_page_range_vma(vma, range.start, range.end,
> -			&madvise_free_walk_ops, tlb);
> +			&walk_ops, tlb);
>  	tlb_end_vma(tlb, vma);
>  	mmu_notifier_invalidate_range_end(&range);
>  	return 0;
> @@ -1653,7 +1661,6 @@ static enum madvise_lock_mode get_lock_mode(struct madvise_behavior *madv_behavi
>  	case MADV_WILLNEED:
>  	case MADV_COLD:
>  	case MADV_PAGEOUT:
> -	case MADV_FREE:
>  	case MADV_POPULATE_READ:
>  	case MADV_POPULATE_WRITE:
>  	case MADV_COLLAPSE:
> @@ -1662,6 +1669,7 @@ static enum madvise_lock_mode get_lock_mode(struct madvise_behavior *madv_behavi
>  		return MADVISE_MMAP_READ_LOCK;
>  	case MADV_DONTNEED:
>  	case MADV_DONTNEED_LOCKED:
> +	case MADV_FREE:
>  		return MADVISE_VMA_READ_LOCK;
>  	default:
>  		return MADVISE_MMAP_WRITE_LOCK;
> diff --git a/mm/pagewalk.c b/mm/pagewalk.c
> index e478777c86e1..c984aacc5552 100644
> --- a/mm/pagewalk.c
> +++ b/mm/pagewalk.c
> @@ -420,6 +420,9 @@ static int __walk_page_range(unsigned long start, unsigned long end,
>  static inline void process_mm_walk_lock(struct mm_struct *mm,
>  					enum page_walk_lock walk_lock)
>  {
> +	if (walk_lock == PGWALK_VMA_RDLOCK_VERIFY)
> +		return;
> +
>  	if (walk_lock == PGWALK_RDLOCK)
>  		mmap_assert_locked(mm);
>  	else
> @@ -437,6 +440,9 @@ static inline void process_vma_walk_lock(struct vm_area_struct *vma,
>  	case PGWALK_WRLOCK_VERIFY:
>  		vma_assert_write_locked(vma);
>  		break;
> +	case PGWALK_VMA_RDLOCK_VERIFY:
> +		vma_assert_locked(vma);
> +		break;
>  	case PGWALK_RDLOCK:
>  		/* PGWALK_RDLOCK is handled by process_mm_walk_lock */
>  		break;
> --
> 2.39.3 (Apple Git-146)
>
