Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112271A7253
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 19:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743534651; cv=fail; b=RYgpIr8I31COXGNqK+NV5VVR7G4sQutpu+7BIqcOhFC/bXHaaAtBTycwmjUXFzO0jmNhXSCwfliyjAHvcAwwExRo86BiIgNaheNJaJf3UM22xTs0C81sGnSVaZa3GIg6R56AEglp+PnRowIfT9B/+TFj5UYJuXWe29G/WLyjves=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743534651; c=relaxed/simple;
	bh=+OcVHetnA7Z8iKI86xbCYP/NSiY/l3xKN8xU4z32QBM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=D36usxNCEnpHniYfT4bxQimUHB9gHF0dh/UzJeG4DZlpm0km2dz1Y+BPkJLKQ/lwPOLSlwQfE7Uc2M9uIyPmwah0Z+6DuzYovz7N91ne52XPPQOAoE3u4ygauRJsdfbTZ97sEdauaPq5lQN5TGOrRy1r8mYD38GAYVcSEJfnGf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dZH1mDQq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CmIsTWhc; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dZH1mDQq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CmIsTWhc"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531IK97q004329;
	Tue, 1 Apr 2025 19:10:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=RAqu8N7nytZIofBQfmDcGKOGX6ZiAhSdd140fcHaw5Q=; b=
	dZH1mDQqQsCX7fqIDF9c1qkLvUkeTYAZP/qy+EOyLPsjzYmvKUtl396vNvH6R2CI
	16SzB+BvP3EgXCgzS58mKFZOaN2KPx+Fl65K9env+lyKLZNOjSU7x69AFegEqhsn
	X21vwJ5owrEi9voKYQ0fHPRv39oYkJ2jpLoYEqV5Q/OjUQlL0uIQJQTvEaOUF1a0
	clO62SoTCX+/KkEk+1CmluLv+TfA7YvfM1XIA6L6drWv590zYdevXMAu/JGhlvjl
	4DfK+CoAASnYhf/2SautWFQqtckX60+7ZnzgtEaxhxGLs94vRhZ0V1VBQssgERfE
	ShpyHqQWpfOiFQ8p4ydZlQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p8fs98tn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Apr 2025 19:10:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 531IisIC002637;
	Tue, 1 Apr 2025 19:10:19 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2042.outbound.protection.outlook.com [104.47.55.42])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45pr8qsguf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Apr 2025 19:10:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MM470FZHrupucyzOGCqn6r5zOfElfCzCrgcQXqwO/krblmDn64SZyKfv3VjA2UPr7Y14BAQDGmbpdq+7t0Q2cHXaUv+SOYAgcQzri16SHmyEFHlDMzzdjXDu+Y0QNOVdIq/jt6/Vhv2e70L/+bG3dRUk9OezuR9gRbooC6amG0S82NtpmJkYIMhXrDOpPGr927+OEgofbwOmxbQbtCquKNwtndaft7CrqxePSMhcr7QaK55+gS7R6t/Utqv5I4Mz6FGJ19vid6alwUe3USQqRAdmm6cdMQwndm93P5nCvdOO2Mq6z4vC4bnFduBAslAoaDDlbwNk69+GjbLwtGO3MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RAqu8N7nytZIofBQfmDcGKOGX6ZiAhSdd140fcHaw5Q=;
 b=FNtYaegfHOdoRCRsE8NfWspURyx4JSKVFO+RFryGCKOhHfw+h5paRv2r5dq+uds93pKA+sQdpcH+ltPXE0d5Rx/63nE4DZklAUVKQ+7Ls8tWhN3Hqnvured+tXEraXof3amkkW06SuV0gS2gFE0pgvKvsGh90r2A7FSTDqNceBX3o+hlWSH9CfrIAOQY4AWcqVH9aVqm4LANFp6UnDqoWpKiEwKxoG67emJHkx2aMBHaobs8a8YLiS9zwBSCmyP7pB/kFnV8PKDbPglBpKhRMhxIWRRHUrZcEmwwkGcb3qPkR1GQReiIRRxkoFJtHx1/Ar+PNob0Bl8fMLP4nw7jAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RAqu8N7nytZIofBQfmDcGKOGX6ZiAhSdd140fcHaw5Q=;
 b=CmIsTWhcySY4W/SamD0tWhCqCVaH9ywCteSNuBuuJr8d+bHmkmsT+yLiKoR2oV8t+UaSY/eUfeS+DESoyM+LKz4pIMPqWr0tAUlFsfdmyC75vH7RTwXGZTQUUapO3nseaQYfryMMbJ0iST5TDqeJZrTA2IfLv2Kp1bu6jaTUApQ=
Received: from MW5PR10MB5738.namprd10.prod.outlook.com (2603:10b6:303:19b::14)
 by BN0PR10MB4885.namprd10.prod.outlook.com (2603:10b6:408:126::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.39; Tue, 1 Apr
 2025 19:10:16 +0000
Received: from MW5PR10MB5738.namprd10.prod.outlook.com
 ([fe80::187b:b241:398b:50eb]) by MW5PR10MB5738.namprd10.prod.outlook.com
 ([fe80::187b:b241:398b:50eb%6]) with mapi id 15.20.8583.033; Tue, 1 Apr 2025
 19:10:16 +0000
Message-ID: <1f54efc6-045b-475f-a1f1-918377af8960@oracle.com>
Date: Tue, 1 Apr 2025 14:10:14 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] jfs: jfs_xtree: replace XT_GETPAGE macro with
 xt_getpage() function
To: Suchit K <suchitkarunakaran@gmail.com>
Cc: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
        skhan@linuxfoundation.org
References: <20250302191558.47180-1-suchitkarunakaran@gmail.com>
 <e495bf9c-9fba-44ce-99fe-04879f8dd0c2@oracle.com>
 <CAO9wTFgMCsS9L1PwpkDr48t9R4hO2UvFRwbPu2mMQMP0aqD+cQ@mail.gmail.com>
Content-Language: en-US
From: Dave Kleikamp <dave.kleikamp@oracle.com>
In-Reply-To: <CAO9wTFgMCsS9L1PwpkDr48t9R4hO2UvFRwbPu2mMQMP0aqD+cQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR16CA0027.namprd16.prod.outlook.com
 (2603:10b6:610:50::37) To MW5PR10MB5738.namprd10.prod.outlook.com
 (2603:10b6:303:19b::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR10MB5738:EE_|BN0PR10MB4885:EE_
X-MS-Office365-Filtering-Correlation-Id: e5349b59-015f-4b35-bc64-08dd7150d638
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cmtBS1pXMmcrSk9hZmJqb2grdHdUWVljRG13c290MjQrWVVGM3NoMWdiK21a?=
 =?utf-8?B?NFdmOU1zZWNFUmZFWXpIaDNqYjJiUEtlTnJJcnhCN0NZVDJ5K3draFR0VktG?=
 =?utf-8?B?SDBWSFVpbmx4L2tqYW1nZ3VqVGhuZEZmL3IxbWVNcU5WTWttUTBKTy9ZWnpU?=
 =?utf-8?B?NUdmK0Q1Z3REQXd4ZTdaanlvblVZL0ZGeEdJWG5nc0Ezb1RQU05xVldLbnN3?=
 =?utf-8?B?S3VGUWZUZkJ2eG5ZeHZOaFU3d2RJWTE2OE1aYjA1WEpMdG0xVHRIdVRRb1Bz?=
 =?utf-8?B?QlJZRWZxc3RPZ25BRE1SWnFyV3FaRGxGMGpLWlNSSUh1dmpXZkNXc3hEYlpR?=
 =?utf-8?B?UTVDMkxNMGx2aUY3VFlqNGJBbEpSanFhRG1xK1AzL2hoRllCY1RCZnp2aEkz?=
 =?utf-8?B?Rnd3V0Rnd25LS042MS80azVrZnp1ZkE4Q3hlZ2plR1pwaHJ0aHZKYUgzb1dr?=
 =?utf-8?B?N1NxdmhFQzJ2eFN2bE1qaVRiMjRrNk5ZVnVON2tETWhobkgrMnMvcEtRcE9F?=
 =?utf-8?B?UkJSSVl3NCtCVVg1dCtZeTBPMHN6bktLN2NPNUMxeEFoQjRrRmwvbmFaaXA1?=
 =?utf-8?B?YTRnUW9RMHEzekxuLzNtZEdFRU1kVFlucnorYWpQNUpFckZ4OUc5VjZoNmxO?=
 =?utf-8?B?SG9QalE5SVZkOFgzR1J6ZTF3L0dFYXRLdVpOUzhabVRxMmNBWDRudkQ0Vm9m?=
 =?utf-8?B?VHoyRDdYRnRzQ3dCYnhaZjM0dnJ3dHp3REtySmdqR2Q0L2J2L01lQlhKb21x?=
 =?utf-8?B?ZTcra2loeWQ1MC9UbmR1dk9xUmJLbzA1eStpSXgwd0gyVkhnczRtMzVXTnB4?=
 =?utf-8?B?TjNpaktqbVMybE93VkZwV05kVFZrV1FlcVRJZlRTQXd5WjQ1N3dxNUcyV1JQ?=
 =?utf-8?B?VFVoeEdBVW5TTVA2bnlXVHB0WXExQzJReWRydlZpRnNMZlZhWDlrMVozdmYw?=
 =?utf-8?B?Smp2VFJrWU1aVGJkbXBWNjhGVWZKMDV2ZUtkZ1EzQUpkRVlNSlpyaUVIQXFi?=
 =?utf-8?B?dG1HeGVnOWhUTjcvcUtWZFVLMXVuWTNMdlJhYlpmWW1xdXlBc2dKQWViZTFI?=
 =?utf-8?B?ZkhKUzNTQVRnQWkyUS9VV3RRUGRWdy9CVTRNOTFZeVRoeUlCVXM2RG1wdlhK?=
 =?utf-8?B?enhUdC9yRVlmZng3UmxpL1Q5MjhvRnhjZTdCUm9VM2NqdnBJdFVWUXNLa0Jz?=
 =?utf-8?B?YWxpUG15OFhsT3AyRXRzaWg2cnVrRVNhNDFlRkl1Q09uNzcxUGFmS3lzYmlS?=
 =?utf-8?B?ejF3OXNkWEZqYlRvYmpnR1JPM0tZZmhqSkZ5VWl6S3JFeEg4SDJlWUc0dE1q?=
 =?utf-8?B?cjczTUpuZEVCS1RZcFplMHROaUxUSHhOOU5pVHY1TXpFd3dWZ1NEVWI1cERE?=
 =?utf-8?B?ZjkwdHBtdDdORXdzOHpucms5MUxvSEdTbjVmRmIzbkhRQVRyNE81RzBMcC9W?=
 =?utf-8?B?R2htYjAwWEJRQmNCUDF6aWhLOGxuellEc285Mk95aGV2Y1dTa0k4UStYblZo?=
 =?utf-8?B?cjl5UWpjekZZTGhWb0gvaGd0NkhzMUY4VmFIQXBMYW9iQS9lT1Q2ZllKNmd4?=
 =?utf-8?B?MzMvUk1mWTdwMkpBZlRoRjZCcDBPZXFYbytYWUl4enNPSkJmTU4ydmFScmgr?=
 =?utf-8?B?VUdvOGtzUjl2QVVvVE5rSnBJV1lOd3NvcUl4RFljQVM5WFJ3elJodFdIeThW?=
 =?utf-8?B?ajRoNFk2MlZDeFdGRmF3T3QwNE9yTjRJVkM5eG9rL1lSVytHTnUwWWpIYTV1?=
 =?utf-8?B?UG00NytiS3A4dHBleFlpcmovaDFDYndJbGhwZVVLL0VvNFBRMGQ1ZjdBbXhD?=
 =?utf-8?B?MnZnT0x4QXZCbGhldjJ4L3V5eXg4VGJ4VnZBejdjVlpsNk9ZUDVNWWk2ZmI5?=
 =?utf-8?Q?gm+3FBEjkmWDk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR10MB5738.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Uk16dk5UOFNBdDhxOEdkV2VrMkFpQVhCSEhRYklGcVZ2RitXSUFxQkFnRWVE?=
 =?utf-8?B?cjQyRi9EUy9acHpqdW9IQ3dMN3ZvU0pCOWlYYm44NmozU3JHSCt5V1ZHcktD?=
 =?utf-8?B?YVNzcmlLNzRabm5oekJRaE9WV3A5SWJ1K3N4cDJLSm05eEkxQUUwSmMzZE80?=
 =?utf-8?B?NUFITW1RVVpyN05RR0xyQWJ1YXE3ZG41WXQ2djRNVGtjWUwzMmZiMzBVV05D?=
 =?utf-8?B?bXlWNWdqZ0NIUy95ZEVQLzcvWkZ2Q3Rqb05Nb1gwTm41eHpTQU9lNEw3MG5i?=
 =?utf-8?B?SkJiZ2NsQTRCdkZZK1pPV0RqaXRBdHI5RjR4Ukl2Wi9STGdvTXRkclJqRElp?=
 =?utf-8?B?cHZzVVV3WWUxWG50cDVTL2EvdFdDWFIySnZXUSswYXBaVmdlcjIzV2FTUWYz?=
 =?utf-8?B?L1pqN1o5WG5rSm5FS0d3OVVLVVQzMHVJZE5lK0EwMkVTTUg4TklNUkswc3U4?=
 =?utf-8?B?elU1eGRwblo2Q2tXUStiTDVGLzJnVUdENnM5dlg2TTFWMkNRd3RyeVJvYjlw?=
 =?utf-8?B?OE5yWjQ5Y1BWbnZ4M3RVc0ZVK29IWW0xay9GQTlxV3liVUJOZEw1T1huaytz?=
 =?utf-8?B?Y2l0bGxzNHM1ZWZDS0RkL2NzRzZzemNVRXJ5NnlWaWNWR0kvYmN2WWo2RHBn?=
 =?utf-8?B?VGVPM3N6R1NNazFWcE95RytIRkxMN2ZkdFR3L0tMM0FRa0Zudng0N2pOVzVR?=
 =?utf-8?B?b05aTy81NHl3cXZJaDNyQ0VRUmYzaHlnOTdtbWJyQm84YXRWRWErZlphYmkx?=
 =?utf-8?B?aTZGK3VQY1h0a0lpOW8xVytJMHpjV2VmY1RnOWZwdUJxZzk3ekprdzBnU2dm?=
 =?utf-8?B?LzI4SlpKL3YzMUVucnlURlY3WWIyMURseExxczlzd1Q1L3Q0Qk1NSGFnM0hQ?=
 =?utf-8?B?ZHdZNEdrVHJOb1RRSUt0Rm9vQWcyYXV1VG8ydXVHTk50azM0QVNZM2NUSmov?=
 =?utf-8?B?ZEdtVHIydDMwckdzTGU0UTI3cVoyU2loSnpHK1YzZWQxZTBEZ0x4Zklpemls?=
 =?utf-8?B?bS9vOHorR1dySjFsRmU1ZlBTTFBLUXBNVU5PN1NRQlVQakZVMUNZVnhkTnB4?=
 =?utf-8?B?RDV3QjdaU1NLNk5lQzRJVkFsejFwOGEwN2dMbVNtbjBhU2dhMXI1M3VFQTU1?=
 =?utf-8?B?TnI4MXc4YzdwZ2RKY01vTFhIeFB1TjNCS08rQVZHWU92aksrYm5TY3ZCdGt2?=
 =?utf-8?B?ZStTU1NRNFhiTmZva0pNOWJOYUltNmN1bEJQbmlNenJQM0oxc1lncUdwUTBr?=
 =?utf-8?B?NlBPdkF5ZzAvVnpUSWV2ZmpqWVRGRXpXNU9FcUt1eEE2WkE5NE15SFZxcUFa?=
 =?utf-8?B?NnBubGhRZXhjN0tsdFBubkdvM3BLdjZMbnd6N2w5aXRMMHlEa1RKM0d6UDF6?=
 =?utf-8?B?RmlLd0lXMVJ5VUI4Z3h3a1NKVzYvNTJFQkszakZaWlBaUnppUnpTRGdsWFZW?=
 =?utf-8?B?ZzBoeTZ5L2VicGo5U0RYQzEzQUwxd1kzYmxhMU5CNHBQb2oyM1JBUm1jVDNm?=
 =?utf-8?B?Zmh6TGhXL01Pem85dmxoeCs3dlMyQzdLSUpEQjJpOE0zSW1lcHhDY1FnbE82?=
 =?utf-8?B?RUo1L3psRjdlNXg5eFVqSDc2V1VWOFlreE5YNGQxdm9SY2pyNU5RcFMrbkNt?=
 =?utf-8?B?VlJTb3BBUi9Dd1VlSCtSVFNJVW91U0t0czNmaU5vN2dvanZPYThlNndFV0xa?=
 =?utf-8?B?ZWdvM0tGT0VQRUdjd3NXN3l1QmVMWjhFRWkybTMyMVltREFacENIRU5pYVhJ?=
 =?utf-8?B?ZG1hQzgrOUlzMlV1bWRFU1R3QTZSc3BvS0pWTk5Vd3FsKy84RWd2cmUwZm1Q?=
 =?utf-8?B?TkMxYi9NYm5jWkhjaUxEMGxsMlVROFBTallHc1N3NjlNYWh4SWNuQlp6Y1d0?=
 =?utf-8?B?VFVzQmUwTkREb3hjblVmcGxBYXJSckZTSjQ5QlB5ejJPcks5L05kdzRkS08x?=
 =?utf-8?B?WEZIR1kybGVaalFidENDRjJrYnNXSFJVR1pGcVVwVjFDdzRmRGZLOGtmUUty?=
 =?utf-8?B?YVRGcFJzLzhQM1dFMkZtdE9oSk1pemlmU2NkU24vditwZCtzTlU4OGtmR0ZF?=
 =?utf-8?B?cUpTYzZUYWc5TDMzQnNMZmNDOEY4Sjk1M3c5Y2orL1FRWVQ4cTFqS2V3VTJj?=
 =?utf-8?B?TEpodkZmRTljRy96Y29TRjJQb1YxRExYTnlvWG4rWmE2VXRZeCtzVVRrRzlm?=
 =?utf-8?B?MkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QILlxvfZlMrZvKb0Dfm32X2zpXZy6x+JKyh9XAVepYd1waGSUssO2Aynx7xzdXdAivzIN9yZBsnqQoaJ7WhBL4+0uydMFGkR9cqvw3M7k1nhhPRLhUYHwdRU0+40IlBr5DDDqasON3+xl0aIyzScu+Wj7TQChbH4qpTM1wmpw1FcrA9fK1xjCkrdNGDOeGH6fkU2h+j5BePIAgksq7Vh/PapK5QBpjE4OHM4bsJmNuWB8ENhHDCnLEonEVggCk/YeYoZwHw+tcafDS4qjUfXld3RbfOvkDXFx46jn9vW/xlFjYpz7BkCqd2Z8CseB4XOkQT0sbCqFQkL7CQdE6QJYJ1R07Y9fCIdNZzAWlmMNBP6jMEPEZ7Ccs2IUVFvXUILmNpgqtPrm4D0qMZF9d4G409jBiMlJwmxjyL50FzIZc4WkgcL2mgV07Sy68BCQKBCCWJB0AXIsidm4q5WT/KblmWiQRopSGVQN1G4b/gvscWl0n1c2z9H7+CkG4M0zSJ9zrXcPrLaTxQz4eqJQfmPTsvvNDJNVrTcPK+mOI+pJj2BRUF0dk48N4DMpdFUkB47U41yOdTGsJANN3+4y4lfr23V1BakJNEArjAunR4pKlw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5349b59-015f-4b35-bc64-08dd7150d638
X-MS-Exchange-CrossTenant-AuthSource: MW5PR10MB5738.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 19:10:16.3219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DL0TEgHU+/cmLoGp9Wt2K6ZCD9cm3x/VB8YrD3f7iusvxNlvGDZrofYEm0DzobvzI97kXzdlafnhglPRU4FG9zHoYiPwqawqMcvXD+uL1Zk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4885
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_08,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504010117
X-Proofpoint-ORIG-GUID: hyZgpi9VaYViHKeh2A_JkP7W_TpOzN3l
X-Proofpoint-GUID: hyZgpi9VaYViHKeh2A_JkP7W_TpOzN3l

On 3/12/25 1:28PM, Suchit K wrote:
> Hi Dave,
> Thanks for the comments. I’m still a beginner so I wanted to share my
> thoughts and check with you. Almost all references to the xt_getpage
> function directly return the rc value obtained from it. I feel that
> changing its return type to (xtpage_t *) might not be ideal, as it
> would require modifying the code in multiple places. That said, if you
> think changing the return value is the better approach, I’ll try to
> change it. Also, I’ll update struct inode** ip to struct inode* ip.
> Thanks once again.

Sorry for taking so long to respond.

I really think that as long as we are replacing an ugly macro with a 
function, we should make the function actually return what we are 
interested in. A case could be made for either the metapage or the 
xtpage_t, but I would choose the xtpage_t. Of course, it should return 
an ERR_PTR if it fails. I know it's a little more work changing the 
callers to handle that, but the result would be a bit cleaner.

Thanks,
Shaggy

> 
> On Tue, 11 Mar 2025 at 22:19, Dave Kleikamp <dave.kleikamp@oracle.com> wrote:
>>
>> On 3/2/25 1:15PM, Suchit Karunakaran wrote:
>>> Replace legacy XT_GETPAGE macro with an inline function and update all
>>> instances of XT_GETPAGE in jfs_xtree.c file to use the new function.
>>
>> I like the idea, but as long as we are changing this to a function, I'd
>> like to simplify it to return the xtpage (xtpage_t *). A NULL return
>> would indicate a failure.
>>
>> Also, the first argument should just be "struct inode *ip". That should
>> eliminate your second patch.
>>    >
>>> Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
>>> ---
>>>    fs/jfs/jfs_xtree.c | 86 ++++++++++++++++++++++++++++------------------
>>>    1 file changed, 52 insertions(+), 34 deletions(-)
>>>
>>> diff --git a/fs/jfs/jfs_xtree.c b/fs/jfs/jfs_xtree.c
>>> index 5ee618d17e77..fb736a06ea58 100644
>>> --- a/fs/jfs/jfs_xtree.c
>>> +++ b/fs/jfs/jfs_xtree.c
>>> @@ -49,26 +49,6 @@
>>>
>>>    #define XT_PAGE(IP, MP) BT_PAGE(IP, MP, xtpage_t, i_xtroot)
>>>
>>> -/* get page buffer for specified block address */
>>> -/* ToDo: Replace this ugly macro with a function */
>>> -#define XT_GETPAGE(IP, BN, MP, SIZE, P, RC)                          \
>>> -do {                                                                 \
>>> -     BT_GETPAGE(IP, BN, MP, xtpage_t, SIZE, P, RC, i_xtroot);        \
>>> -     if (!(RC)) {                                                    \
>>> -             if ((le16_to_cpu((P)->header.nextindex) < XTENTRYSTART) || \
>>> -                 (le16_to_cpu((P)->header.nextindex) >               \
>>> -                  le16_to_cpu((P)->header.maxentry)) ||              \
>>> -                 (le16_to_cpu((P)->header.maxentry) >                \
>>> -                  (((BN) == 0) ? XTROOTMAXSLOT : PSIZE >> L2XTSLOTSIZE))) { \
>>> -                     jfs_error((IP)->i_sb,                           \
>>> -                               "XT_GETPAGE: xtree page corrupt\n");  \
>>> -                     BT_PUTPAGE(MP);                                 \
>>> -                     MP = NULL;                                      \
>>> -                     RC = -EIO;                                      \
>>> -             }                                                       \
>>> -     }                                                               \
>>> -} while (0)
>>> -
>>>    /* for consistency */
>>>    #define XT_PUTPAGE(MP) BT_PUTPAGE(MP)
>>>
>>> @@ -114,6 +94,44 @@ static int xtSplitPage(tid_t tid, struct inode *ip, struct xtsplit * split,
>>>    static int xtSplitRoot(tid_t tid, struct inode *ip,
>>>                       struct xtsplit * split, struct metapage ** rmpp);
>>>
>>> +/*
>>> + *   xt_getpage()
>>> + *
>>> + * function: get the page buffer for a specified block address.
>>> + *
>>> + * parameters:
>>> + *   ip      - pointer to the inode
>>> + *   bn      - block number (s64) of the xtree page to be retrieved;
>>> + *   mp      - pointer to a metapage pointer where the page buffer is returned;
>>> + *   size    - size parameter to pass to BT_GETPAGE;
>>> + *   p       - pointer to an xtpage_t pointer mapping the page's data.
>>> + *
>>> + * returns:
>>> + *   0 on success, or -EIO if the page is corrupt or an error occurs.
>>> + */
>>> +
>>> +static inline int xt_getpage(struct inode **ip, s64 bn, struct metapage **mp,
>>> +                     unsigned int size, xtpage_t **p)
>>> +{
>>> +     int rc;
>>> +
>>> +     BT_GETPAGE(ip, bn, *mp, xtpage_t, size, *p, rc, i_xtroot);
>>> +
>>> +     if (!rc) {
>>> +             if ((le16_to_cpu((*p)->header.nextindex) < XTENTRYSTART) ||
>>> +                     (le16_to_cpu((*p)->header.nextindex) >
>>> +                             le16_to_cpu((*p)->header.maxentry)) ||
>>> +                     (le16_to_cpu((*p)->header.maxentry) >
>>> +                             ((bn == 0) ? XTROOTMAXSLOT : PSIZE >> L2XTSLOTSIZE))) {
>>> +                     jfs_error(ip->i_sb, "xt_getpage: xtree page corrupt\n");
>>> +                     BT_PUTPAGE(*mp);
>>> +                     *mp = NULL;
>>> +                     rc = -EIO;
>>> +             }
>>> +     }
>>> +     return rc;
>>> +}
>>> +
>>>    /*
>>>     *  xtLookup()
>>>     *
>>> @@ -252,7 +270,7 @@ static int xtSearch(struct inode *ip, s64 xoff,   s64 *nextp,
>>>         */
>>>        for (bn = 0;;) {
>>>                /* get/pin the page to search */
>>> -             XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
>>> +             rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
>>>                if (rc)
>>>                        return rc;
>>>
>>> @@ -807,7 +825,7 @@ xtSplitUp(tid_t tid,
>>>                 * insert router entry in parent for new right child page <rp>
>>>                 */
>>>                /* get/pin the parent page <sp> */
>>> -             XT_GETPAGE(ip, parent->bn, smp, PSIZE, sp, rc);
>>> +             rc = xt_getpage(ip, parent->bn, &smp, PSIZE, &sp);
>>>                if (rc) {
>>>                        XT_PUTPAGE(rcmp);
>>>                        return rc;
>>> @@ -1062,7 +1080,7 @@ xtSplitPage(tid_t tid, struct inode *ip,
>>>         * update previous pointer of old next/right page of <sp>
>>>         */
>>>        if (nextbn != 0) {
>>> -             XT_GETPAGE(ip, nextbn, mp, PSIZE, p, rc);
>>> +             rc = xt_getpage(ip, nextbn, &mp, PSIZE, &p);
>>>                if (rc) {
>>>                        XT_PUTPAGE(rmp);
>>>                        goto clean_up;
>>> @@ -1417,7 +1435,7 @@ int xtExtend(tid_t tid,         /* transaction id */
>>>                        return rc;
>>>
>>>                /* get back old page */
>>> -             XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
>>> +             rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
>>>                if (rc)
>>>                        return rc;
>>>                /*
>>> @@ -1433,7 +1451,7 @@ int xtExtend(tid_t tid,         /* transaction id */
>>>                        XT_PUTPAGE(mp);
>>>
>>>                        /* get new child page */
>>> -                     XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
>>> +                     rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
>>>                        if (rc)
>>>                                return rc;
>>>
>>> @@ -1711,7 +1729,7 @@ int xtUpdate(tid_t tid, struct inode *ip, xad_t * nxad)
>>>                        return rc;
>>>
>>>                /* get back old page */
>>> -             XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
>>> +             rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
>>>                if (rc)
>>>                        return rc;
>>>                /*
>>> @@ -1727,7 +1745,7 @@ int xtUpdate(tid_t tid, struct inode *ip, xad_t * nxad)
>>>                        XT_PUTPAGE(mp);
>>>
>>>                        /* get new child page */
>>> -                     XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
>>> +                     rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
>>>                        if (rc)
>>>                                return rc;
>>>
>>> @@ -1788,7 +1806,7 @@ int xtUpdate(tid_t tid, struct inode *ip, xad_t * nxad)
>>>                XT_PUTPAGE(mp);
>>>
>>>                /* get new right page */
>>> -             XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
>>> +             rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
>>>                if (rc)
>>>                        return rc;
>>>
>>> @@ -1864,7 +1882,7 @@ printf("xtUpdate.updateLeft.split p:0x%p\n", p);
>>>                        return rc;
>>>
>>>                /* get back old page */
>>> -             XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
>>> +             rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
>>>                if (rc)
>>>                        return rc;
>>>
>>> @@ -1881,7 +1899,7 @@ printf("xtUpdate.updateLeft.split p:0x%p\n", p);
>>>                        XT_PUTPAGE(mp);
>>>
>>>                        /* get new child page */
>>> -                     XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
>>> +                     rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
>>>                        if (rc)
>>>                                return rc;
>>>
>>> @@ -2268,7 +2286,7 @@ s64 xtTruncate(tid_t tid, struct inode *ip, s64 newsize, int flag)
>>>         * first access of each page:
>>>         */
>>>          getPage:
>>> -     XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
>>> +     rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
>>>        if (rc)
>>>                return rc;
>>>
>>> @@ -2506,7 +2524,7 @@ s64 xtTruncate(tid_t tid, struct inode *ip, s64 newsize, int flag)
>>>
>>>        /* get back the parent page */
>>>        bn = parent->bn;
>>> -     XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
>>> +     rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
>>>        if (rc)
>>>                return rc;
>>>
>>> @@ -2791,7 +2809,7 @@ s64 xtTruncate_pmap(tid_t tid, struct inode *ip, s64 committed_size)
>>>                 * first access of each page:
>>>                 */
>>>          getPage:
>>> -             XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
>>> +             rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
>>>                if (rc)
>>>                        return rc;
>>>
>>> @@ -2836,7 +2854,7 @@ s64 xtTruncate_pmap(tid_t tid, struct inode *ip, s64 committed_size)
>>>
>>>        /* get back the parent page */
>>>        bn = parent->bn;
>>> -     XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
>>> +     rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
>>>        if (rc)
>>>                return rc;
>>>
>>

