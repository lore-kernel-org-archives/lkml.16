Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67877253944
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 16:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744906966; cv=fail; b=TsSjw7BP1wrhyYxuK+0HsgA49BK1pVm7Fs4G1+2n2rNkXlz52v+Q/4VuxGA75vAjmIQaMHD+fQjzW3c2JQxo/Dob/CGRDbloC0ZkwKdGCNWJi/IghwnVrhtRZPBJpv+qxNCYFHWni5endFF2qTzVUB0OVE+IefY8MdrHga1BKss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744906966; c=relaxed/simple;
	bh=pmmhGyXOxhKYfWNVniEY8RHBn7VP3MqhH+Y43cV7MK0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BIMCJRw4GdeHUaaZQKfGDKRxZoZpaFjQOpB6qiyR/IauG8ez+JtZiTInoRbQMdH7+Ak4Wb6dD338CFVydFhcGRvYsEK4SWjzkCguT5vOfjd6J3IC8qqDuvev2kLEVN9GU8YP+/qlgGChqvfGoHDnSmkpMNb9ltsdGvGGgLxWNZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cW/vMeTt; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jmCfAtEo; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cW/vMeTt";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jmCfAtEo"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HGIqUm016845;
	Thu, 17 Apr 2025 16:22:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=/+9M5UyywJwGaPKy2LjWqztbQzrPi/dvQLTaoL0t/Fc=; b=
	cW/vMeTtFSK8JZZTIJs13LgbrMWITMFzRJroBsgR7nGQgAJFEhesw24ZVdqmDliC
	lpH7FZ2kwrDJHKZ2ywWtnP1etF1LSNTQ7GeeRGlkWh5wV3Mz/JOdJ1Zbrp+ZTY+x
	4yWW99KM3GzroWlU4ItPzzPMc+r5yU+8cf1DjWXPGehgEH4ARyz7Xt/gUP7V0ZS+
	NGpHSreNK8bSGwvfid3kVRtdrmsPHYI+Sd8dxR2Vb79LFc8ubbMTPE+h1aErl5nq
	d7CR0KQpy84CdToD5M8hH3Oo39LwbW8+DkTpDG0ciD3kV3kwoQXwxqnu96mMOFkV
	ia9DhBIdn8oiCHKFa9WWiA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4619446n5n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 16:22:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53HFRXrM008532;
	Thu, 17 Apr 2025 16:22:01 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2048.outbound.protection.outlook.com [104.47.55.48])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460d2tgkvp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 16:22:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qepFKY1kjvIg/T6VBJinMbGO88iJEOYp49SvQr2Qpgtr+K4mleaKBFUiYAZ9n9dKvEpMPbUIBSoKcG4To/5QRj7kTWxZRUpsNvOzNtnhfgfd24P5rHswyE+UMuN7RXRYQtG67bkvWlH11Bv+TnNJxfPlmiBJW3XWIaqAMfuKAq0tqPiJ+fnKnQ4t/1xamt0x8g+i2Kf057rTcpN6oJbj5sHQQRy6sGQVMZO5te/oF2+lbdDg405123UCq3/e7AzkX6xiPc/FTNk1kCyBcOdT1Rs5+ErCbklrEJk+7ydULlGbbO2IQxqaddRhWnNJ4POSjs132H7jxxdzhM6D2bpoqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+9M5UyywJwGaPKy2LjWqztbQzrPi/dvQLTaoL0t/Fc=;
 b=ewV8/A8LmyfY7+v02AJTFWug8f8HR//Tbz9J25VEbUB1tTvlCIq/pLlQJzeKefQNbv3p2H0oxG9pk3sj2MtYRHVlMXgJp9xdA5KjFiZXJEuTDL+wLtPPrMMDLOxcFsicKgLKDT6VtvF5f75wBVbc/oDh1sV188633Owdapood004z1YSH3lLCOa35cXYuYKr7/tuvYAS0F+UmPk3gHQAPO35LQ3VrQMY22/mSr6t3XV+mLqS7pastzeHps31ZdXCAoMb92WHS1rClz01do77efznettrrn6SV5QiNb0sKYMydjN7k57okAHkkIX35lBgOzxG+xaXmEp5OLXKwpt9sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+9M5UyywJwGaPKy2LjWqztbQzrPi/dvQLTaoL0t/Fc=;
 b=jmCfAtEo0F8d4UYL5SMs5YIwAKaI1SEC9O2XMqR08Pbm3ARHFzXiKjOp9wBW70IYmQ+O/++jegrYf3/f5vkt87W87LEGGC73dGY2PgAIZKqshqeWDEyuZiaNLIQd5NkX7LFlf2ISlQ6ofrjj72z1Ai0tTcVME8TGkzdCu9TWrIw=
Received: from CH0PR10MB5113.namprd10.prod.outlook.com (2603:10b6:610:c9::8)
 by IA1PR10MB7309.namprd10.prod.outlook.com (2603:10b6:208:3fe::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 16:21:57 +0000
Received: from CH0PR10MB5113.namprd10.prod.outlook.com
 ([fe80::eab6:6dcc:f05f:5cb2]) by CH0PR10MB5113.namprd10.prod.outlook.com
 ([fe80::eab6:6dcc:f05f:5cb2%5]) with mapi id 15.20.8655.021; Thu, 17 Apr 2025
 16:21:57 +0000
Message-ID: <daaeffe6-f9b8-4923-a273-0dab573aa749@oracle.com>
Date: Thu, 17 Apr 2025 12:21:55 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] mm/hugetlb: Refactor __unmap_hugepage_range() to take
 folio instead of page
To: nifan.cxl@gmail.com, muchun.song@linux.dev, willy@infradead.org
Cc: mcgrof@kernel.org, a.manzanares@samsung.com, dave@stgolabs.net,
        akpm@linux-foundation.org, david@redhat.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Fan Ni <fan.ni@samsung.com>
References: <20250417155530.124073-1-nifan.cxl@gmail.com>
 <20250417155530.124073-3-nifan.cxl@gmail.com>
Content-Language: en-US
From: Sidhartha Kumar <sidhartha.kumar@oracle.com>
In-Reply-To: <20250417155530.124073-3-nifan.cxl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN8PR04CA0066.namprd04.prod.outlook.com
 (2603:10b6:408:d4::40) To CH0PR10MB5113.namprd10.prod.outlook.com
 (2603:10b6:610:c9::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5113:EE_|IA1PR10MB7309:EE_
X-MS-Office365-Filtering-Correlation-Id: 32ca53dc-2ee3-4238-97d1-08dd7dcbf98d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SFdiTCtsNVZZZFR6VjFPMm12NEJMak9MVzBIMXZ1NmR6K2Y1NzlXVHpnanc2?=
 =?utf-8?B?ZXlhcHBiWEVQK3FWL2o0bHg0RkVveHY1dEZJN1d6dWpHMzYySEdZWGIxaTI3?=
 =?utf-8?B?Y3pmNkZMVTYralJ4dEpQQ29NRTE3a2IxTjZMZXJ2WWh4MGgxZkw0NytMMDBn?=
 =?utf-8?B?SVBRT2h5alhnZVRUN2JsaitETzRIemNYUHM4UnpMbmlzYWxRUG5icFp5OTAx?=
 =?utf-8?B?WjdHSkUxRXNMNnYzMjNDYmlJMmJJcDM5Rk1WTWdHQUQwZXRmcFZjdlMwUnF6?=
 =?utf-8?B?c0Z1Z3M0TThxS3JiKzcyVXNTNHovOE5TbDBFeHVDaUw0U3UzUDE3ODByK0lk?=
 =?utf-8?B?U3MxeStheWI5NUlBRlg4aTdCUXZRUXI5RitvMEEzbEZtbitkS0kwWWtQc2RN?=
 =?utf-8?B?dElwRUtzWEhicFZWVFh2RjN0Y2hML0RxQU5MVERFaGhvaUFKYzVhMVlSY2Np?=
 =?utf-8?B?c2JjY0lMN2c5dTRBQnB0bDlZdUJSQ2h2Y2hYZE55Qld1Tmg5TjlzSmQ5eFNO?=
 =?utf-8?B?dndJdWk2UEk1S0pDSWtjQzhqa2FzK2I2aDQzaDd4S2pGcVJyME5ZSUtDcjEx?=
 =?utf-8?B?WGF4VnppR2xrNER4dHFJVDZ1dGh3YnVhYXRqL2tDcCtBMmtZL3k5OVVPQS9C?=
 =?utf-8?B?NWNpRy9YVjE2ZGlJTjM2RlBOTWNEcGR3N0pXVjVobzFEWWFRaG9QaE1tZmw2?=
 =?utf-8?B?NHlrQnFFbXZZUFpObXlkdlY2czRqSDdlSk1EMWhiZm5GSTZUMnRUaEdjY1Vj?=
 =?utf-8?B?UVdBc1VTeGFPTGw0RGxPQ0VDd3FhNEYzR1ZRS0ZIUWZyNG9IQTFHa0RvdmJn?=
 =?utf-8?B?Y2tnK1dyN1F3OUIxenQwZVcxQ0ZaMU1hQkkxSHJEL294MmVVeWpQWUdESEsy?=
 =?utf-8?B?MTJDZTRHNVl1Zk5NbTJFRUNVNm1iY2FpN3JXMEo2YStSZlh4LzF3ODRwQ2gw?=
 =?utf-8?B?QnhQbEp6a3VyZkFiTlNCaVlQdUZUUzkyZ0dEclFFTk5MaXlKOTE2cm1UVVlV?=
 =?utf-8?B?K1JSWmJBMGZYVzVndm1aWHFwaEI5RUFUbnI5bnRDaS9VU29VODhyL2FCaVJE?=
 =?utf-8?B?WVZNYXBoMWhORFBvWmxJK1VOa2l3cGJWN1lKT3ljbVJqWFNLV284SlVqMXI2?=
 =?utf-8?B?OG5JTk5NNDB2SmpuWDl5K0wzUFMycVVvRGJaeGVJZnBTamFFZHJOMWVhMm03?=
 =?utf-8?B?WnZXVSt5bE9GVElZNkdRU3g1ZU5UdzZld3BtcGg0SUtCMXAvbUNpTStaOUl0?=
 =?utf-8?B?VTZtTmNzRVVXNzZjejV5M29sMUpHMUd1c1U1blBoN1JjY1M4SDNRNGl3eEZj?=
 =?utf-8?B?QnF1NVJOMkx5Z2ppY1V2YXJackdHM0doaS9OdHZqY3ZyU2wzOVV5VlNNTDc5?=
 =?utf-8?B?SGpZTHQ3K3FLK1VxVHpCdHU1aXgzUngzZW56ZUQ3R28vRXFsN1BXS2ZGVkpy?=
 =?utf-8?B?Ly84cDFNcnZyb3hjcCtEV2pDcTBnY2EvbVZoMG5VTTlPblF0VENiMC8yMDZs?=
 =?utf-8?B?b3FzaSs4QmpMQzZ6eVQydkgwZ1FTcFBDOFhKbXFhMGl4Yy96dWMwNDBTZDZT?=
 =?utf-8?B?dEg2c1pGcTFOZVJKNUdINWNWMHZaOEg1Yk5IMzhNckFlR1hyY0hFU3NGbUUw?=
 =?utf-8?B?S0NKcVJ1Qzl5OFBnTFE3cXp4WkV0MCtOdGtQN3VaYk56Sit6T2REcTFyR3JM?=
 =?utf-8?B?Z1NDVmF2NXFRdUVpL2dTdEczOFB3UjI3ZTBmZ28wRDFtSEdWelNSbkcwNmhp?=
 =?utf-8?B?QXA1RVZuUm45ejgwWTlJQW9ScGN5RFpaQzd0MFpxbjJmdHRiVm1aQ2c5THU5?=
 =?utf-8?B?VGhFRlZlazRlSHdUakI2WkpCcHlON0ZqZzh5TVZCNHd5aTRrR09FcVdqb1ZR?=
 =?utf-8?B?dWFxc2R5b01LL0s5emhVSkhOWkNSakd1VkJJQXE2SGcvNmc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5113.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDdzU05zR2xSd3JJWm9vNUhjU3V3NnJhS05malFvSUlIQ2FoTlJ6T1pUekwy?=
 =?utf-8?B?aGwwaXBxNXJRWDgxQTI2WjBJUWFpMGtXRmhzdWlZRzlxbmhiMHJJazBGODNN?=
 =?utf-8?B?Z0VFUmxudjVlMzMzSE5Pd2pDRmNoWUQzblNhdjhWc1cvQ3NkKzI4OElaejFO?=
 =?utf-8?B?akx6cjRUQVBUTWNZZndCR3p4ZFEyUXFTRUdUM3NMYk9kL0czcUNneGFIRCsv?=
 =?utf-8?B?TlNEejJOdkE0M0FBczFxY3FId1BrNmhDbWtWUG01Zm1hOTI1S1QzbFRMQ1lq?=
 =?utf-8?B?Z0szdFNnTFpibFNEL2pLT212V0ZxMG9KZTNYVU8xMzZXVEZwOWQxTVcxd2Qr?=
 =?utf-8?B?cWE2TjN1alRGR0tDODI0ZHczSEUrV0hEQlJHM2QyK041MlJZQy9oeDh4YmJX?=
 =?utf-8?B?SmhiMjY1MFJPSG9wa1dZM3JRK3lnVHBsSnFQNVZLUWc4R1I3WloxL0JVUHRa?=
 =?utf-8?B?azUxbkptNllZeExOa3RMSmR2SW5Ib3RNelBwcURMb3dWT1laV2ZlbjZVUmNw?=
 =?utf-8?B?Q3F2M21SSVM4OUlXejNtdjV1bTJGVGZCRC9uaVNjMWp6WmVxaHh3YmVEdDNM?=
 =?utf-8?B?cE1id29QZ05NZUJtMFlFb0g4b0ZsNmlWa1RXa1dEL2lnM256VXJHRml1WWhw?=
 =?utf-8?B?dzlud3g1ZnpKemErNVFJczJFVXJReVQxMEZJa3ZvUXNYdGczNnhSSXZxMjlN?=
 =?utf-8?B?N0thcURadHllUm5ZZkxFaHZVaW5wRUtJZUtJRlk0R1BZczVNWlB1YWJyeld1?=
 =?utf-8?B?WWdvdm9kSTVUL2RRdHJieTQ0QlcxZWEzRkxCV0lFQkZJZXNBc0RFak9vZlpu?=
 =?utf-8?B?Nmt0UGxvMlBwUWF6bUlPNllFcnV0VXBVNXNjdEFxYkFBeWFZSXJldjMxOXB5?=
 =?utf-8?B?VUFuSkU5VjR2TzRuM0RnVmhZQ3A0a0lTSmNNdU0vR3lpOVErRnZHSmpPNFVh?=
 =?utf-8?B?dVUrQ3pGaVZub1ZDNVVtNEJzbkQyU3MyWjBEMjBPeEpFcHRRdkxrKzNsMVdW?=
 =?utf-8?B?b1E4b2VFMFQzZFczbUYxTmtOVVFhZDhpQ1AzTzVqU0cwMjdURmhHeDB1VlRL?=
 =?utf-8?B?RUl5RzhpRkFsWkVBREdiWU9RMFhmN0VXOWZtZjdqQkpDUzBxWkJwWEtIMi91?=
 =?utf-8?B?dmVueCtkeHVpUFQ2aXR0bDRZZGIyOHRHdVdPdk1DU3pWc0xaWWkzektDcC80?=
 =?utf-8?B?OS9tbldMbkpvbXl4YXJwa0s1NWlYM0R3dWJUTk5zYklzRHI5MmYyVy9XQ1BP?=
 =?utf-8?B?aGF2K3IzQ3ROaU5aL21GUk5YSSsraWZkSCs3WjZkcnJ1SUtDbGFHMTlieVVJ?=
 =?utf-8?B?dXdDcll0c2djaHl4R2pmaXVvSWM5NkhnZ3RQNlV0T3h1TmpPOXhOT2pvWk1T?=
 =?utf-8?B?QXBhSElQZkpnK1pGd2p3aXJxeVNTWUlVUjRNU3crZWViMTNya200ZnpsL3Jk?=
 =?utf-8?B?UEVTZi9tV2RvRGtPeXF5SitGdU1sUitOR2lLZEZVRnkrZUtrNVZxSGJMK2No?=
 =?utf-8?B?Lzd1WVROZHl6Mkt4ZkRzYlRpNkRXQ2txZGZobmpvYlpCaTU5WUJZSVl6M1pq?=
 =?utf-8?B?RkpmSnVRQk1tTGE3TXVWOEhjekFxUXFhUytCd1RFMzNpbzVyQmkzUDhzZXZH?=
 =?utf-8?B?N1drVGRlY3RseGVFb0MxZSsxRXRBTjExbW9KQzY4cVRYbzFzZHpZc0ZXYUtO?=
 =?utf-8?B?OHRKZTVIOVJMSHVjWkV3UzdvYUZiQVBRTm5KSXNqTlM4ZkRWSmdzQS9waE9j?=
 =?utf-8?B?cit1dkMrUHFRUzF5eU00REl0NElOWVpyd3dKSU9nNDNENkFaNjlOMVVwbjBx?=
 =?utf-8?B?TU1YdXppYnFBbTBsUFA1R1BQRnJsMGl1d1BZUHE3c2h4KzdObXV5cnF6djAz?=
 =?utf-8?B?VG8zTklSbTlMS2RYUm9ORTNhQ0lmcnpzNFdQQXBaQ0FuR0c4ODZUWnVmMm5L?=
 =?utf-8?B?RHdsV25mWGNPMEFpdm5hek4ybW1UbWc4TlgyZGdTRjdLTTkvQi8yQjJtb3RL?=
 =?utf-8?B?eFJHYUY0ZkdpelNqb3NBT0xZK01YUDV2MFd1QWNscTBXSmQ5bG9yUkhNNTNZ?=
 =?utf-8?B?QTJnMUN4QmJLL3RONFY1NHdwYnd6M1ZpUDJBbHpSeUdSMGwzdSs0SGhBR1lE?=
 =?utf-8?B?MVpNdkI1R1FmcUpMaG5IaUlQTVhqOEg3QnlFdEhGS3M4dGM0Q0VTeXNYT2Zv?=
 =?utf-8?B?cXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dIwPNXvbqPbfDVL2gsnDqRQuzCBF5iKZzuodOeZHTWedWP5RVvJgeMfskkkwlqE6VbhcsbWGDGdvxgzxUiG5MYmudcIO3e5O6FoURBC0DoAHDxL/an4r0cCWU/IymvBFzaRRSkbFeSQIlmoiD0eQLH+pnh4t9Q1CUQzDw5px9cIITUOK4PjVmo5P3xr3f5nu4lPU28tkcC2YtjcToOintb7/HHaul10nkbHA9aBVG5UOrGWO+NX1n+2Km3OLIbeIyCWjYoURyxoYWRS7Qiplz5+tSLD0H9xsF/G2KeiNXpangrdemwp+9VILrvD3+lSnPA2QfqnW1TNDqv/t0w7zSd9qV8+6Y1H8wE84ycfftqwg0l+OgvZ1UEp0bMOHycDN1zAwZnJH0ibD71W9S1emiiN7xUOlpSgtEeCJmFvfo2Jzb33MgfewBhYFdhdRdiSqWqox51mmUA7eaJ/Wcr5A61aijJ5PAAyLmcHUi62Yut8KubFzLsbQDFn0Tom10S1xZBIpM/Q97da1oH3D5/anIkdQRQ4V4gQS+WTv9JChjsQQAhhCv6918vtEN5uCesILJy6U7yG08+f8PiihkVLiZbCwQGYisNDICDkKrPYZ/zQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32ca53dc-2ee3-4238-97d1-08dd7dcbf98d
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5113.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 16:21:57.6726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M2IUAfjUdbjD+cPF0NTRFLffRB5lnFnnbgOsG/RhXZfSEiAHQt5ijtVKS0rgvTeAE1aYuAxcwV/SOKac7+X9R5H5Hacs9Hsjai7hdz02yq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7309
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_05,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504170120
X-Proofpoint-GUID: RJFf0BQDMdEqtR5eQrDIyakwIV69DfJ2
X-Proofpoint-ORIG-GUID: RJFf0BQDMdEqtR5eQrDIyakwIV69DfJ2

On 4/17/25 11:43 AM, nifan.cxl@gmail.com wrote:
> From: Fan Ni <fan.ni@samsung.com>
> 
> The function __unmap_hugepage_range() has two kinds of users:
> 1) unmap_hugepage_range(), which passes in the head page of a folio.
>     Since unmap_hugepage_range() already takes folio and there are no other
>     uses of the folio struct in the function, it is natural for
>     __unmap_hugepage_range() to take folio also.
> 2) All other uses, which pass in NULL pointer.
> 
> In both cases, we can pass in folio. Refactor __unmap_hugepage_range() to
> take folio.
> 
> Signed-off-by: Fan Ni <fan.ni@samsung.com>
> ---
> 
> Question: If the change in the patch makes sense, should we try to convert all
> "page" uses in __unmap_hugepage_range() to folio?
> 

For this to be correct, we have to ensure that the pte in:

	page = pte_page(pte);

only refers to the pte of a head page. pte comes from:

	pte = huge_ptep_get(mm, address, ptep);

and in the for loop above:
		
	for (; address < end; address += sz)

address is incremented by the huge page size so I think address here 
only points to head pages of hugetlb folios and it would make sense to 
convert page to folio here.

> ---
>   include/linux/hugetlb.h |  2 +-
>   mm/hugetlb.c            | 10 +++++-----
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> index b7699f35c87f..d6c503dd2f7d 100644
> --- a/include/linux/hugetlb.h
> +++ b/include/linux/hugetlb.h
> @@ -133,7 +133,7 @@ void unmap_hugepage_range(struct vm_area_struct *,
>   void __unmap_hugepage_range(struct mmu_gather *tlb,
>   			  struct vm_area_struct *vma,
>   			  unsigned long start, unsigned long end,
> -			  struct page *ref_page, zap_flags_t zap_flags);
> +			  struct folio *ref_folio, zap_flags_t zap_flags);
>   void hugetlb_report_meminfo(struct seq_file *);
>   int hugetlb_report_node_meminfo(char *buf, int len, int nid);
>   void hugetlb_show_meminfo_node(int nid);
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 3181dbe0c4bb..7d280ab23784 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -5833,7 +5833,7 @@ int move_hugetlb_page_tables(struct vm_area_struct *vma,
>   
>   void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
>   			    unsigned long start, unsigned long end,
> -			    struct page *ref_page, zap_flags_t zap_flags)
> +			    struct folio *ref_folio, zap_flags_t zap_flags)
>   {
>   	struct mm_struct *mm = vma->vm_mm;
>   	unsigned long address;
> @@ -5910,8 +5910,8 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
>   		 * page is being unmapped, not a range. Ensure the page we
>   		 * are about to unmap is the actual page of interest.
>   		 */
> -		if (ref_page) {
> -			if (page != ref_page) {
> +		if (ref_folio) {
> +			if (page != folio_page(ref_folio, 0)) {
>   				spin_unlock(ptl);
>   				continue;
>   			}
> @@ -5977,7 +5977,7 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
>   		/*
>   		 * Bail out after unmapping reference page if supplied
>   		 */
> -		if (ref_page)
> +		if (ref_folio)
>   			break;
>   	}
>   	tlb_end_vma(tlb, vma);
> @@ -6052,7 +6052,7 @@ void unmap_hugepage_range(struct vm_area_struct *vma, unsigned long start,
>   	tlb_gather_mmu(&tlb, vma->vm_mm);
>   
>   	__unmap_hugepage_range(&tlb, vma, start, end,
> -			       folio_page(ref_folio, 0), zap_flags);
> +			       ref_folio, zap_flags);
>   
>   	mmu_notifier_invalidate_range_end(&range);
>   	tlb_finish_mmu(&tlb);
Reviewed-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>
