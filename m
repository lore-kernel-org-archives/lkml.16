Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C6020D505
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 18:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743533904; cv=fail; b=LTSbSHVkoRIqsz5ZANvQ7/jl73PXQtf2KMWxpef66f32okcMKRj4nU204UELlB95aiRjSArws2EtzHP5xtsJfxlg4gaM3P+688Iq7XuAHWjvNtnCooF2rcd56Vu7nPP1s+zC8vb8ax6N+FYSYuT9CkzBMZ1idYGN5z2a18r3gR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743533904; c=relaxed/simple;
	bh=hrFpi3su1ufMaOn7JPli+UmbGDb4SncSzE61yUY+XGA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EhGH+ICQriuMflkUVeEjKE+dICZxpa3h+jpVMSmwbMEmiTUUvWojuUzyV1qWHBXuglRDHpL8MnSDC+5+bnk3K9FDYdJHWH3CSPghjpC4ka8oCdCF+oYYZleBIciv7txhaX9LllwFA+w6X1X1lAPlWfOiQ/9R03+FOoFBOjRsW/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Bi84/EJ9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=0LOx11YX; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Bi84/EJ9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="0LOx11YX"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531IJvNi030484;
	Tue, 1 Apr 2025 18:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=VX8tS3xInaIe29ZDTH+BUbgs3Ci5yk3R81gBw1phgBQ=; b=
	Bi84/EJ97NmdF0TXxDJ0yaZpZiQ1HTYnigNshjXDctvfKarj621/CNyKSsYmBwmG
	6neYqleIaclLCXQ40QeVk5u9MKiGwnJBMB6LMXW1NwqKcCeXIECkU+OHlEOAaH5z
	heeQION8/rWAofFQb//C7n/hCTiDbmWpyOxeVThLxCaMOvfLZs2Kjt0k4y24P1/G
	j2psFdH45mbmZ0pZdw9EbTVnyQKf4uXISOL0Krs/KH7ptN5OKilw6Oxx2aWzXuy6
	AQfAr+fsFPCc9vKk0hr5inY9fggmnDHkG9NRCJsD0tJ867V1tQ+pMwZ3hP535QNX
	xL8A2drBi5a+/NSPhWoqtQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p7f0gw6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Apr 2025 18:57:42 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 531HpfkT019894;
	Tue, 1 Apr 2025 18:57:41 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45p7a9mquw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Apr 2025 18:57:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SAq+udRBV5OHQ9PRopXHDzfEGlq4yZBe7ZXJibNnPQo4dnnxIQEgzRJEMkh9gcytPnfWkOt2eSm3UslYuRqcct7WXM6slVCI0OnqUxWvxe1TFsomZR9IBFSLSVeV1rRJWxzrf1wBt275RdG6WZQbx5SgQZBsC9vUPey9SZixpuF2slryB9mxnNJkXw/Zi+0xLgVwPCaQyhLNqszRfBVZNkWPKUxYNly977EkJ4HWD0M4sRhmLO6WQoFYMOWNLHkRzfG+pkZ9JDuYSx+PpVuznVACrE/hM6K0M2QUjghPcD4XY9lZTyJP62Vbk2A20tYzZ6uUzZBCOCLVQhsQOHR5sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VX8tS3xInaIe29ZDTH+BUbgs3Ci5yk3R81gBw1phgBQ=;
 b=P0Bo+RE7KG1qeJeK7mrVlyRphgd/z4vhjA8SibXMOKV+siy8jNXD+i5/JiMu6+FU8dtCzvpedtfy8gU2Sf27tP7AgRQVNXoBtW94D4r5RCnVNzNXeAwHp7DgcsrxqoqGcb5i0sQcc+rka+wMObWarr+TDR588Ezlafqw0IDqP5sf5bEAmCE1PnHGrppuO3+cazZ6GwsaeZht+1oJYyZqoJWG5JovV/Jh5d+haKowoO7GwXt7KhXt6rZLB5UsBucRaoz+QzPsrc2G20gqhFpuIh2T2i65AXpH6yYpNBDTeRO8RGxC3CgA7BfyR7CUeRjlq9oVw6EKFJQlCm9XMEw/AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VX8tS3xInaIe29ZDTH+BUbgs3Ci5yk3R81gBw1phgBQ=;
 b=0LOx11YX3uk8UC+xxIgU62FvhEHrn6270SUQBP+ov43bTh44pMiqjGLUSMsrxACOkJWEXPwcKWHQ/2yZaIXykrUCWN3flYxePN4GKmmT5AJCRu/2BxmLmniL+4Nq09af/YUPvg5GnWD7oCwyG6+eWdc+3HEArihGXjjV3hsw2Q8=
Received: from MW5PR10MB5738.namprd10.prod.outlook.com (2603:10b6:303:19b::14)
 by CH4PR10MB8074.namprd10.prod.outlook.com (2603:10b6:610:23d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.38; Tue, 1 Apr
 2025 18:57:39 +0000
Received: from MW5PR10MB5738.namprd10.prod.outlook.com
 ([fe80::187b:b241:398b:50eb]) by MW5PR10MB5738.namprd10.prod.outlook.com
 ([fe80::187b:b241:398b:50eb%6]) with mapi id 15.20.8583.033; Tue, 1 Apr 2025
 18:57:39 +0000
Message-ID: <3302a9a1-3901-47dd-9a7d-f1b9633b4f31@oracle.com>
Date: Tue, 1 Apr 2025 13:57:37 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] jfs: validate AG parameters in dbMount() to prevent
 crashes
To: Vasiliy Kovalev <kovalev@altlinux.org>,
        Edward Adam Davis
 <eadavis@qq.com>, Rand Deeb <rand.sec96@gmail.com>,
        jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org
Cc: lvc-project@linuxtesting.org
References: <20250310085602.953206-1-kovalev@altlinux.org>
Content-Language: en-US
From: Dave Kleikamp <dave.kleikamp@oracle.com>
In-Reply-To: <20250310085602.953206-1-kovalev@altlinux.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0082.namprd03.prod.outlook.com
 (2603:10b6:610:cc::27) To MW5PR10MB5738.namprd10.prod.outlook.com
 (2603:10b6:303:19b::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR10MB5738:EE_|CH4PR10MB8074:EE_
X-MS-Office365-Filtering-Correlation-Id: a328f581-2e40-4cfd-0c95-08dd714f1300
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cTl3YWhaSnhEbDZNT2pSMkNRS0hLTWVJcFlkeTU4dlhxUC93cGhwd251Ri9Z?=
 =?utf-8?B?OVpqcW9KWU5HTnNYT2ZGSlpTaVJ6MDdlUkxDYnFjR2xDWVZsRWU3T2xvOWtC?=
 =?utf-8?B?dWdpMnh6SHFyZXo4N0IvV2ZrNzJCY1JjNHpRU2ZYOFFQMCs0bEF3ekxjb0Nm?=
 =?utf-8?B?b1dwOExqMEZvVWR3YzlSZWhpNWMrcmRXdDBQQWEzcVRjN29vbEM0dGU1czVX?=
 =?utf-8?B?Q3ZxTTZFNkRoTXN1aTNuak02WEE5WkYzbDhSak5kWkQ1UjVHR3JsOEZlOUlO?=
 =?utf-8?B?MEJZV2p0KzAvY2RlN1VRb1FoVk8wL3Z5emk5bXJJQ0lGcGx2T0FwaGtsV0J1?=
 =?utf-8?B?SFc4WHkyZ0xheU1vWkpUTUZINytWQ3BKWGRoQlRCQjJmQTJvdWswb3BOTEwx?=
 =?utf-8?B?Q0h0RWY1TlNJcnUrWHhWVVRaRnFCTkxlM2dwVUtFaENWM2w3T0NlMmZ3TnVJ?=
 =?utf-8?B?T1pvV3BqR2tuZFFKTGlBYVpUc1BqUTM4RENkU3V5OXNsREluRnNjUGNaUzFZ?=
 =?utf-8?B?SE9OaExuY3Jyd2l2M3V0T2hTcXJMNnVmOVN6OUtBSWRZUVY3S0htNWZyTGhQ?=
 =?utf-8?B?QmV3MWJscHpySFpjODh5WUE2d1RFUVhHdUx4Sm50Zkg5OWlQanpuSHl6cU1W?=
 =?utf-8?B?TFVoeHJBNE5WUW4xaGxLam85WTBBQmJYUEtQSjJERG91blZSSk5OWEJIcTY2?=
 =?utf-8?B?QlZRNjBUMjNGM3h6WHVLc0NQaUsrT1hUR0FjS0ZCNXhuRjM0cjAxckF5Rlhn?=
 =?utf-8?B?RDhFcmFKcW5XR0hJcXVRcDR6dFduNGROUTJoc282VXYzblZEbklZWjJXT2VM?=
 =?utf-8?B?bjlEV0V4UzRlMU9jTWlITVhPeFVrYUEyZmV2QXdaWjRSNlZUbGQzR3JPa0R1?=
 =?utf-8?B?Z0VmdGxtWkY0dGVNZTBGbUcrb0FWaytac1EvcGdlRDJ6Y29OUm9LRHJ3YkFH?=
 =?utf-8?B?d0NkYnpmbXJvNDBCRDhTTSsxTVlidHRlSXg2YzFlekdleVU0Qlpha2dMNUpS?=
 =?utf-8?B?MTQrWnlUUEROWG9wU0l5SjlITmNtaERUYzhoZndHTTFDRmIvckV6ak8ybUlN?=
 =?utf-8?B?dEp6TWRReTVNM1JMRllhblNEWFY4Vkp5NGZtRDhtejZuRGl2S2JWNG4rVWdK?=
 =?utf-8?B?TzFxVTdzaEpzUmJybDdDWU9mTXI4bEhFTWtUSVVFSVFMR1Nkc01leHI0cXpW?=
 =?utf-8?B?NTByenoyVGl0UmJxVVRLZ3dQTzQzNHUrMmk4VFI4MktXRjI5TVpUZCtMejA2?=
 =?utf-8?B?MTNnOHM1MlpVcWRQQ2JzaDk2M2Jid254N1FDRklZSmp3UUNVZHRYMFBmSWxt?=
 =?utf-8?B?ODNDWExqVlo5TEhUVlNRMm1TQlVTMVJrR2xzaDhCa1F6cFdMdmpHYjBLeGZV?=
 =?utf-8?B?YTUyVHl4YUVuT3VlaTkyNmVXVEhSRE5YbGc4WUp3dmI2VVFraldWcENaVmlQ?=
 =?utf-8?B?VlArcnhnTDR5Z0JpcDJSTWdlaHZzd2srNzAzM0F0VlJUMjl5TklFS2s0MnB3?=
 =?utf-8?B?RERKV2l3RHk2NjBxU1c5UnFBNWI2eVY3QTcrazE5YXltOTN0TzFsbWlOSlR5?=
 =?utf-8?B?ZGtKTnRxd3UwZVpVRkpFS0t6R2JNbkZ6TTBwK0RZZkVUdGJXVVpPMCsrOTNT?=
 =?utf-8?B?RS8rZWVYd3JHdUI4RVVzenBWL0pwVCtBemFrOEhZSjlOZXl4YnpHODFick5v?=
 =?utf-8?B?MHVsL0hLdVpmYTlMKzZ4T3d1T3prZUE4RWtJSnBpVDM5KzF5cE9JSGNyeFhI?=
 =?utf-8?Q?asbOOudiy1+yyxHaHUN7aadQTUfsfIemiCHfD42?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR10MB5738.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTNrNTlRdDFaSkU1WkMwSmRndVZqSHV2ZWkvcUpBdVdkaGJ5dE0xNHBJejhw?=
 =?utf-8?B?R2tNTFFQQXFvWU9hQlZqdm4xU0YwQWlHaTU4bGEvenhtNGZyQ3AyZlF1YktU?=
 =?utf-8?B?ZXVIamR6V1dSRmVjckxGMmR2L0Qwc0pLSFI4UTNxR2FyWm96eDNTcEdVOVll?=
 =?utf-8?B?VEswRmpsMlAwSkY4bXhNNm5McndRT3JVcUtreWtqQmtXVUhzbGU4b292K2dS?=
 =?utf-8?B?MjQ2dk9JOW0rZFZUNWNadkVPWjdsVFU0VUc2R3AvQkRMNlIvSjd3L1J2MExo?=
 =?utf-8?B?YlN6cEVxZnc5ZHp3K3JDdnZmTTNHN0NYc1hRcWRETjRSTTRQOFM1ZzJ3NTJG?=
 =?utf-8?B?OGtlZEhBbDlqM0lFTjZCdnM2TnlXTVMwVU1ZVjJLUGg4VzJxZkdmNHBnMzha?=
 =?utf-8?B?QVcvOVhIMytwYXZ0VTBtQlpjVnM2QnpDVktLd1AzQnNzd0p3d2Zrb3BOMG9t?=
 =?utf-8?B?UHZ3U3lsUHExRXRlQTBzd0JQdmVuYTZNVm9xMU9EUnFkRW1IY3lBZ3l5K2Vu?=
 =?utf-8?B?R1JLY1hKUTF3dDJMYzM3Ym1OWnRsR0pnL0JkZW01QU1ZSzZIM0JjQ0haajhu?=
 =?utf-8?B?WVhFZHhBY3pnT29sQzRBb2F1ZEVmL2NrNjVzTGtMZVMyWDJYa1dwU3ZFTkZs?=
 =?utf-8?B?MHQxQU9WVkxPYWRNRWRWZ1Evb0l1Q1o5LzdHeDBEb1Y1V0I1UXhlUnF5eUdV?=
 =?utf-8?B?Z0wyVXdLTk9CRHhYNG1BUHZ2YU0vVzJDY1h0a1p5YmVtb2NPU1Z4VTc1U0t4?=
 =?utf-8?B?bjFZTFpRUXFoazlySkx4NGNxcENKUDJJcUlhZHp4UXZYaGZHZ0RGK2RlWlIv?=
 =?utf-8?B?RDRRTjZMclJCaG5OYTdUNG9oa1RJTXN0dC9qZW5PamdtK0J0U0FtQVhKYmMz?=
 =?utf-8?B?Nk9sY21PS2VYSkJWa2IvM25qSmI3elZQMVlEUnQvV2RIMlZqZ1R0enFFUHYx?=
 =?utf-8?B?cld4M2NKN29wUElWSHVkQUFLcDZUd3ZOSjRpSFRsR3RBQVkyVnNGSVJBbitZ?=
 =?utf-8?B?bmlLdUdkc2duMlpadVlDZ1ZncitLcnZlV0dZcUJvZXZtMDcvRFZTZVQyRVdP?=
 =?utf-8?B?aHlsUnVsTHdEb2RrTFFEZ3JDaUFyTmNHcUJ1VVFGNUZWRUN6dFlXSzdJQnZq?=
 =?utf-8?B?YitXVnlXYXVUZThXR2U0N3RibnVNTFZIdEpMZ0kvUWdGTU1BTmtYdVh4ZnhS?=
 =?utf-8?B?Mk5qSkE2RnF6QlJsSHozUW9MdlVmRjJWSGxrQ3pyZWNRWjFMMlN6eHpVVGdu?=
 =?utf-8?B?VVM5MkVNay81VTI1OHRINlpvM2tja3hqZ3lOZCsxamp3dEwxenZjSWo4Mk51?=
 =?utf-8?B?MFJqK1YzT0RWNVR1SlBqSlkvZk1iVlhVMFk0OWZuNmk4YnpxZXVVd2ROWWJP?=
 =?utf-8?B?MTdGMjhkNnB5V09ONGtrWU5qYUdWQ3ZFTVQ1NkM2T1JDc0pVS1UxSzFtVERw?=
 =?utf-8?B?RXdORUtVQmlBakhxNW5nMnlWdGxFQkFIZWp1ZGZ1cWZ5dDkvcFlOMDlQQjMx?=
 =?utf-8?B?MFJvNHhWbFdHcVR3d2dHaFRGZXVFNjlNNnJtclVXNThndnhMUEdKbVlUTzJL?=
 =?utf-8?B?UUljVjdiRE94Z0F2U1Fnbk53NXp0WWFuYnRPZjVVM3RldTdCcFFoVlJFUm1M?=
 =?utf-8?B?RGVnOXBhc0VkbmtDZzAwamJCdXZrcFFsMjZFNjZZcDZocEc2QzZCODdtb2xl?=
 =?utf-8?B?YldLTVNIRDdXUEIxeWhZN24waDZNS0dIdGQ5MnQzTDdtdnFpRncyWWhGZWNL?=
 =?utf-8?B?WS9CN0hwekN5VEpyUGUwd1JpQm00VEZaaVBQek0wWk5FQnN2cy8xZXhicWFy?=
 =?utf-8?B?a2dJcTZHV1RlRWJYR3cwODE2UEMzZFRRLzRYWlZhVzNnbVRxSUFMYW1saVE3?=
 =?utf-8?B?TnNNU05SakFhdzJ5UmtaRE1LenRoOTVFVXlpNFcxVWRKcmJqK09yWUZlbDh4?=
 =?utf-8?B?T1ByMGI1VmEvQklReEJrKzVsbGRLVTdXc2NZczJvVWo4VXV0WXFTMnloZVQ5?=
 =?utf-8?B?ZExYUG05dFA0M1dFaVcrSWF4MFRWZ05UKzVIaE9VdmFSYnBlcjdlYTNobFBs?=
 =?utf-8?B?NTR6Ty8xdFg0dkp1R2YvOEJYWEVwLzBSZG1UR01CbTJsdTFVUWorekptc3Zw?=
 =?utf-8?B?SHdHNWhET0tZa05ZOWFObUcvK3k3cTU0cUdVeWFhRmh0Mk9VWDlnUk1hYTVU?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aaw39lp9e5KGB4GZedNxrD5XjkwennElkm4gpFOhI94UXe4XJ3NzWCxj17vpF+cTNy6CPqGOHb4cZx59hhK2kAs6XsASjOE4wS0DeHi5uwbPfGkTRMDG4+HAoSKtysIKbmxpBnKvYSJkUPwXsnegxEIYD4goobnyB47h61rU+reJBjQ9ygr8amm2TVIbMyGLIrp8V/cP0V6XZcDrbYnRbM41NpJGAZZx/yDrLc/msT6oyTRzIqOcYWJLa5Uk7AyyIRbcA/qTsvWipmIxH6rk1iH/9CP4u16upk3a3FECKbsGK/uNa7yl3tiM9xO+oWqD5k9wRcOMMJsZylyWFRK7Z/NeFiT/iP9yjdS5+DbUogzlgFvd/VnLFJf+nJBvTEdEz2icps5aIRaTUuA7aV9hDQowIBUgUmStjaLezWQTOxPXEy8uDrWkMXcPaWRsh/m7MCyhJb1wUdbGC+Lds4Z34LWQdVR4mDAKnVuza8JERjh4gwlqsGculKQqbu4rvKMelNh95nICNI+ceCfYG3OoRtheg0PmJE8hd03c6TkLo5Ls3QTbrPLw9qPxWB/1jJ+vzAydR7dhJ4uRTUsaFGqLYQJaSLRqkeb2E62O0MXrVsk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a328f581-2e40-4cfd-0c95-08dd714f1300
X-MS-Exchange-CrossTenant-AuthSource: MW5PR10MB5738.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 18:57:39.3878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cdVC8cgszoknwdDg1jMefSkaiNi+Xr/jWNSQkwkJ0YK5AygGZiDhzzyq/pbEU0HBUhnouLXxazNaX9umJH23kS0FoCi4fvQ7W65M11bgwyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8074
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_07,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504010116
X-Proofpoint-ORIG-GUID: xlaJvjsVlTJOv3tiSW5AQXSDB4Wmcg5k
X-Proofpoint-GUID: xlaJvjsVlTJOv3tiSW5AQXSDB4Wmcg5k

Looks good. I'll put it through some tests and push it.

Thanks,
Shaggy

On 3/10/25 3:56AM, Vasiliy Kovalev wrote:
> Validate db_agheight, db_agwidth, and db_agstart in dbMount to catch
> corrupted metadata early and avoid undefined behavior in dbAllocAG.
> Limits are derived from L2LPERCTL, LPERCTL/MAXAG, and CTLTREESIZE:
> 
> - agheight: 0 to L2LPERCTL/2 (0 to 5) ensures shift
>    (L2LPERCTL - 2*agheight) >= 0.
> - agwidth: 1 to min(LPERCTL/MAXAG, 2^(L2LPERCTL - 2*agheight))
>    ensures agperlev >= 1.
>    - Ranges: 1-8 (agheight 0-3), 1-4 (agheight 4), 1 (agheight 5).
>    - LPERCTL/MAXAG = 1024/128 = 8 limits leaves per AG;
>      2^(10 - 2*agheight) prevents division to 0.
> - agstart: 0 to CTLTREESIZE-1 - agwidth*(MAXAG-1) keeps ti within
>    stree (size 1365).
>    - Ranges: 0-1237 (agwidth 1), 0-348 (agwidth 8).
> 
> UBSAN: shift-out-of-bounds in fs/jfs/jfs_dmap.c:1400:9
> shift exponent -335544310 is negative
> CPU: 0 UID: 0 PID: 5822 Comm: syz-executor130 Not tainted 6.14.0-rc5-syzkaller #0
> Hardware name: Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
> Call Trace:
>   <TASK>
>   __dump_stack lib/dump_stack.c:94 [inline]
>   dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
>   ubsan_epilogue lib/ubsan.c:231 [inline]
>   __ubsan_handle_shift_out_of_bounds+0x3c8/0x420 lib/ubsan.c:468
>   dbAllocAG+0x1087/0x10b0 fs/jfs/jfs_dmap.c:1400
>   dbDiscardAG+0x352/0xa20 fs/jfs/jfs_dmap.c:1613
>   jfs_ioc_trim+0x45a/0x6b0 fs/jfs/jfs_discard.c:105
>   jfs_ioctl+0x2cd/0x3e0 fs/jfs/ioctl.c:131
>   vfs_ioctl fs/ioctl.c:51 [inline]
>   __do_sys_ioctl fs/ioctl.c:906 [inline]
>   __se_sys_ioctl+0xf5/0x170 fs/ioctl.c:892
>   do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>   do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> Found by Linux Verification Center (linuxtesting.org) with Syzkaller.
> 
> Cc: stable@vger.kernel.org
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: syzbot+fe8264911355151c487f@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=fe8264911355151c487f
> Signed-off-by: Vasiliy Kovalev <kovalev@altlinux.org>
> ---
>   fs/jfs/jfs_dmap.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/jfs/jfs_dmap.c b/fs/jfs/jfs_dmap.c
> index 26e89d0c69b61..cfb21f15f5971 100644
> --- a/fs/jfs/jfs_dmap.c
> +++ b/fs/jfs/jfs_dmap.c
> @@ -194,7 +194,11 @@ int dbMount(struct inode *ipbmap)
>   	    !bmp->db_numag || (bmp->db_numag > MAXAG) ||
>   	    (bmp->db_maxag >= MAXAG) || (bmp->db_maxag < 0) ||
>   	    (bmp->db_agpref >= MAXAG) || (bmp->db_agpref < 0) ||
> -	    !bmp->db_agwidth ||
> +	    bmp->db_agheight < 0 || bmp->db_agheight > (L2LPERCTL >> 1) ||
> +	    bmp->db_agwidth < 1 || bmp->db_agwidth > (LPERCTL / MAXAG) ||
> +	    bmp->db_agwidth > (1 << (L2LPERCTL - (bmp->db_agheight << 1))) ||
> +	    bmp->db_agstart < 0 || bmp->db_agstart >
> +	    (CTLTREESIZE - 1 - bmp->db_agwidth * (MAXAG - 1)) ||
>   	    (bmp->db_agl2size > L2MAXL2SIZE - L2MAXAG) ||
>   	    (bmp->db_agl2size < 0) ||
>   	    ((bmp->db_mapsize - 1) >> bmp->db_agl2size) > MAXAG) {

