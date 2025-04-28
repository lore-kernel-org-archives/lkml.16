Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C111F4C8E;
	Mon, 28 Apr 2025 21:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745874454; cv=fail; b=Bif3TqBfZP5DGQabXO6dOnt2iyxt4+SCzaOVmFg0bSspDWGlOsFnzutwAQymPgoZsh0XwGIU8TdIKTkkCVWvZkLovvvDhlLrAHMUGd+lVrG20q3qcEfMdXY8vVyyu8xhJtTT9EnYH3kP3VGeKSEvCigoVGuGt4CDenJv9n3qMFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745874454; c=relaxed/simple;
	bh=a4pEyfVA7ETmpqb79t4L2r0cXOl/zs33dlGdsh6tkjw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IvEVNz1F031TJbseRdys7/s3BeMw6Niak4CtVzerLBEeMItAmZVNRniom3qgM9MRr5j4Rnwzw2B6mWxR26ZVL//MoW1rN8X7B9D6xGeDSste9Smwhyzg2uSzAhTBQAOPjUP7KZIleFOJtLGbZp33HWrbkop4Xu0tak9Dkcz4pxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EYLdwrEN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CKVSmEDX; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EYLdwrEN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CKVSmEDX"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SKVuaZ029894;
	Mon, 28 Apr 2025 21:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=Cht49A5gIspLiRO2i1pHbjrPytEkDiT+4OfKrIsQ3wI=; b=
	EYLdwrENKTA8gkn5shj7JbyPu34Fb2nW3CQ7i9fxaqCyB3Ie6062+5WdVZgeXqoz
	LFO6nPA+8baA8bHUF32ftDLN9WZqJeUoUPUfMQTvSG8GFa4NI4092ioILFEGx2Kt
	2DdHEeIv54mOLtC1cmfj7wav89LDI97/IvQcqrGgeLF0dvFH7UCgmjn8188GMxqx
	fo783OCqb8WEhDqurxfZp8Scr8QvGvfy9gh7PQfSJPR61lpb9eV1Z0JqWNHWsfMF
	HtAM6jcuEr734j7MvinBMaKvTYdXU8KaWrAnvwpipESylzTNfC77n0Y8LsPSZWCA
	7kpDlxCVSzrj3blh81fHiw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46agsug1u1-8
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 21:07:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53SK85DQ013809;
	Mon, 28 Apr 2025 20:57:43 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 468nx8yhad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 20:57:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WTBdYBOEFFQHC+OUVhstUr/xylRGSgRdECVdIYuncBwXZ3Ioid8qClPxmHcSx0ngQfax+Mih84ZN6pJn7g5fivT/iB7MYpUCdljn9EAfkTtBJMgA6ZrLR4fqQYZuxKBpLcLI/OFt6ZfdeU1OFYRIKP+8Sc/20t3SALtib8cyoiTMHK0SV1q5NzF4gXBDvLZp3djINJl/4CESwLU5Nk4dnE5hLZzRC1fnyhcCj5wXfQYH5MShZAAt31XkLjywLdryTuvdLQiW1pEL0Z4SWn/fz//MmcVRPm2SjSFFbrkAAVp+rCoLEGmud/1VaddP2UnsmZ/smhbXcZhhza8/+P4IGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cht49A5gIspLiRO2i1pHbjrPytEkDiT+4OfKrIsQ3wI=;
 b=I5MxXgWsB0m2c5QsX+7RAe1McCaCLhtPZTgu3qws9R6LFG2vkP9zU83ZLAKJ/T8HFU9Q2y1JO3ongaXKTcp9FMS0NHB+RTve0+RoH/PThywCRWyhvxoCMOCtPOmcq+voprtjfbZ8rcCoekdCx7m1AaklSWSbqExgbLDhnPyHhcEw0BmEWMs4HhoeYk0RJXVDMsCHbYb4ix4AVS4bz/y3Yf8bojs//9TL6ztyj1N32XvJ0dIzESiW2CMKLG/j6DtGMQ1sF6BvVi/BjwB7Qwr6+A1rGkTpzthLJTYLpevASFtIZI+RC1i+9BxuJ2qyzCm8rhmMKYZDYMkiODcditnBqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cht49A5gIspLiRO2i1pHbjrPytEkDiT+4OfKrIsQ3wI=;
 b=CKVSmEDXo6cMXPqwWGU6JeQPqvdwFCQTPgt0qMEsaWcTaUr9r+gwuri7ZQkb3U6dPUjQwv0FGUNVhX+mps/yNctZ/zEis8Q/yBfoIuwW4VSHe6mbrRtLkwyWLwNMipo2d11K+tasQJVdwduuR3Ll3zJ4Q+ypbfZhQ5gyD8dNuGY=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by IA4PR10MB8544.namprd10.prod.outlook.com (2603:10b6:208:56d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Mon, 28 Apr
 2025 20:57:39 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%2]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 20:57:39 +0000
Message-ID: <b7d3a60a-7298-41ef-8f4e-7dc56c1ccc8a@oracle.com>
Date: Tue, 29 Apr 2025 02:27:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [External] : [PATCH v6 3/6] platform/x86: Add Lenovo WMI Events
 Driver
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
        Mario Limonciello <superm1@kernel.org>, Luke Jones <luke@ljones.dev>,
        Xino Ni <nijs1@lenovo.com>, Zhixin Zhang <zhangzx36@lenovo.com>,
        Mia Shao <shaohz1@lenovo.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
        "Cody T . -H . Chiu" <codyit@gmail.com>,
        John Martens <johnfanv2@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mario Limonciello <mario.limonciello@amd.com>
References: <20250428012029.970017-1-derekjohn.clark@gmail.com>
 <20250428012029.970017-4-derekjohn.clark@gmail.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250428012029.970017-4-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0306.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::13) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|IA4PR10MB8544:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bdeb463-988d-4b32-aad2-08dd86974fca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NzNGaTZtdFhEV1ZSK2pid05icUZ3TE5OYk5EZ0E2a0RQSlJyVXV6b3FTcHQz?=
 =?utf-8?B?UjhKb3JiSG5SMlNFYnYweVluaW9MYUZRZ0F4OFBjc0N2UVdVUisrdWhGRm0y?=
 =?utf-8?B?dkh1cGE4cUNzV2dWcjNDZk9DL21ncjRMWkpvcmdxYjlBeWVCRW5QbFBmV2lh?=
 =?utf-8?B?emxwRnZrVnZjSnY3bE9OVmo3M1FDbFo5VGY0NFN5VUhmUWc4QnhEYnRKcE8x?=
 =?utf-8?B?WDRzSm9ZNDRCTVBSWTQ4SzF3WlRCRFhaKytnSUJhZFQxN2UrTlZCcGVaMFla?=
 =?utf-8?B?TVlmTk5qYW9YM2tVQURRNUhrK295dmZPam00andRN0dkazBEQ1ZibVRkb2Rq?=
 =?utf-8?B?ZjdlaEZ1a2pXTmF4dnk2ZWpaOVB5NFRkL1NVYzBJcE9pcjRiNFZsQmhHczlh?=
 =?utf-8?B?V3VqN0ZMVzB0RDlJMXVJZDc2bEhBcVRmMEJudjBkMjdrbTMwK0Y2dWRLekFR?=
 =?utf-8?B?ZGhEL2Z1eGtyanlOck5BMG1GeDJQakJieEtxZXFDTzdKcC95V1ZlOVRsanBw?=
 =?utf-8?B?cWJ1K1VkdXMzZG5PNS9MVFdsdEZ5dGtUK2lUQ0xtNzQ5UytGYy84UWd6bVBQ?=
 =?utf-8?B?TmpwTkRBN3Z3MGZqSVkwM1loSTBuZ3Yyd0ZoS0pTZGhybjNxT0w5SUxKWm5r?=
 =?utf-8?B?bTZaRjlZeUtaYkxudEJLVHAzSklZRzdFSGZOSjNwa0dXczFTYjVPbFBFSndP?=
 =?utf-8?B?V21IRWtybkF1c1pWNkJINUhEVzhKNTg4MnIxYnl3K3k0citRbGcyZmZiNHYw?=
 =?utf-8?B?ek1XdUlBam5EbHBDbEN0eEZpcnB4ZFdzNXZQUURSL1lmTnBNYjdZVlJSQVJn?=
 =?utf-8?B?VG1HUmc5NGlPTklKdDU5eEhxWUh6TlRqUHFObzBwelhjeENRaHJwNVF5bWlv?=
 =?utf-8?B?U3Ntc0NDaTVNeSsrd1VyOVpTbnk1RWRIZ1J5ZjFYK2RDRCtidXBCOGxIU2lT?=
 =?utf-8?B?NWU3a1hYS3l6TGpLbG1lU2NOdFdEcjE0VkovU1haY3BKTUdTdzg3OElPOFZl?=
 =?utf-8?B?U2E4MkdNMFBTaHJFRmFmSEdRRzJlNGxBcWNxd1Rmd1pVMWdsSktIdmd0dEt4?=
 =?utf-8?B?eFljMjNaTjBQbnliQytFK2liMEp0MVg4T2p6NzB3RGpDbjRtNm96M1BpSER2?=
 =?utf-8?B?MXlaV3UyMG5JL1lRT2NwSGVKbDFKMzM5eXRqQTdOcXlFMzd4a0VBV042d1c3?=
 =?utf-8?B?Y2JsVncrdW1ESVdUUnBHdGZoM3MxeEtkVUNOOVZIZ3g3SHhNTm9PUnA0YjJB?=
 =?utf-8?B?d3ZBbW5DWm5mNkxicHdNRmlIRXlsc1gwdG53Q0hpTVhQVW56cHpCR1JRcmZx?=
 =?utf-8?B?QVBxS1VYaWtsLzVoOTVoTk0zVzdiY0dQcDhtZkRTMGF6TGlKQnNWRjRVUVM4?=
 =?utf-8?B?M1VNNjdtUGdhK2hIekg1cDFMc0tiRzk2cEk5b0ZlQnRIbzZBMElkSjJKVTJu?=
 =?utf-8?B?UTJoTnRLcDBBUWRCdGZmVlJEQXlFV1ovUlVuYW5ZVDlHSStTaks0bkNTeWcy?=
 =?utf-8?B?TWt1b3VUMzdvQTVGU2lLNEVyaXVBQ2xUUVllQ3BML2tMc01KcFhLTWZSUEFM?=
 =?utf-8?B?WHd0WlZBMCtYTlY0cFAwNklCQTVVMFR3QitmMmh5Ly92UTM4bVpOT3FrZ0tu?=
 =?utf-8?B?SnkvNFUvZFlSTUxhOWRDdE5DeHVLMFJrbkdNdmlKYjJaZ05GbHpTU3RDWXk4?=
 =?utf-8?B?ZlVLSDJIUjZnTlNBS2g3VDM3bjM5VHZXRmd1Q2Z2SVBQd3lyU0ZPemZEVmFj?=
 =?utf-8?B?bTZCWHhIemZZNjFKeHIxaURVcFd1RFZkbEtpUlZvUmVGUWdvWkJUaUNPOHMw?=
 =?utf-8?B?dUx4SFltZ2dPZkZpd3lvNC9jS3pvcDNNYXduS3c3QXRBN242SkFGVzJCamtB?=
 =?utf-8?B?andyU0hWd0cycWFoY1dUaktBdXRkZXVWeFJDNG9OcGJvWnowV0l4QVRoSmp3?=
 =?utf-8?Q?YBO3KMvMN+Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGlGZnNMcU0ydFpRNmpWZHM5T3FNY2I2S2k3QUNnNU9tNmhxbys3YkhTSmlT?=
 =?utf-8?B?R1JjUnJ4NllmMzRod0NvL3pqeWtjazM3a2RRVExsMVhoU1Q2M1pFY0xSeHVC?=
 =?utf-8?B?eWJSTW5YYWdWeGR4UUFWamhtMzh5STNOMnM3Y0h5Y2RtVXE1MS9NRTUxMXpD?=
 =?utf-8?B?WEJtdEErMis0ODFTVEdSbkRMV3RZZ09DRzBuWjIrVW44RzZCc3N1bnVteWl1?=
 =?utf-8?B?V3JQSm11QnJLTW9UNWFUb2NnamtyZE9zMDlXbFhKMXAzL3FGMjJPUE5qSEdr?=
 =?utf-8?B?cEp4amlkVUdKQlMyYkF5ZmhyK2FpWkNXUmYxN2JSb0MzcmNzUkJyVUx5NXdO?=
 =?utf-8?B?dTFPUUo0cklIK0JkaGZ0TXRMa1FveVZBNjVucHZ2c0tFTnA4Zk1hb2tkMXpn?=
 =?utf-8?B?UUg5Tk1GMkFZc1UxeE0yMXZONEZ4VmkxM21lcWFwc2w4MUh4bHFjc051bUdJ?=
 =?utf-8?B?dDc2Z0ozTTZyejY1RDVvTjFxRmZpOEpCbmVNTlN0clBtd2l4VDd3OWdYdVR0?=
 =?utf-8?B?bE82Z0hKNU1uUUtSSGtidytqa0ZxMVpCMHV0cUc4a0xDNWppaXFHUVBXVERh?=
 =?utf-8?B?SHp4SHAxdlJCMk84aWR6K2J5RDB6eEU4ZTNVcU90ZTRkQkl4ZXVLeEI4MkND?=
 =?utf-8?B?TW4yaHN5UVpXSnVScTZHRHFFTnM1eWttOEduOUNTdjRGMlltd1FMQUxtdkpy?=
 =?utf-8?B?YWFzQm56T1BMWVJYY0k5N2V3aUNjMHJSSEVvdWZiNnJ6eUpOTm9YZFFZQVBU?=
 =?utf-8?B?ZHZyOUNDblBrUVlXMFdUV0ZoQ1RCaWQwQlZhSE1xWHB2eGFuRTJPbk5VTEwx?=
 =?utf-8?B?UGJ3Z0V4THlqYnF3ejc4aEhSeERuZ21FclRsZWMybXRUdTVHRld5a05GbU9K?=
 =?utf-8?B?b1htd3JMdnYyNFBUSXJYWFR0NGVuZ2xhdVZZa0VlcEFPMW9vaXBGYzBVMDVq?=
 =?utf-8?B?YmlKelRFb3Vid2JpQ1RTMTlYRS9oTzhzMG9SM2JvQU5CYTBWS0pYUnlNa0Vs?=
 =?utf-8?B?QzZMSkQ2SjBFRDIweFpidmJadmlqTWZCWnFISTFhcXZCdHVLd2w1RGVBaSt0?=
 =?utf-8?B?VnF5dUgxWWJjYzFtRDZrSCszVFJwbE1MbDZVK0xiNUpUY00zdzFuZXUxQ3Js?=
 =?utf-8?B?THFjSUQ0NWJnU2ZNd0dkZHlNbElZY3kwUkpxemw0QVhMb3E2NklkNkNKVGJm?=
 =?utf-8?B?MTJ5NkNwS29CQnVkL0VGWFNZR0hoTENUc0VCMFdLbWlJWFhRZDExMjRRTlQ5?=
 =?utf-8?B?N25TWmVkUk95dnFQdTk2bE9XRUo3ano3SUZ1ZmhkeVFQMW1yUGJlRndDckc1?=
 =?utf-8?B?TnVTSTdTYjV6VTNTWHBvKzl4WkZTVUl3MXZQMm5rZ0FURFZ2T09RWktYWWJI?=
 =?utf-8?B?ZndwWUhsWGVMMFVPMDk1WjdkV2taYVNrbGJPMjdxZVEyWDR0SnFqaGp5MUxG?=
 =?utf-8?B?NFJUbEpWTk1waHUxQzVzUHFmK2IxL0k0OG9rbHhpazBrRm5aM3RIQXNhc3pQ?=
 =?utf-8?B?YlZVUjVYd0pCLzgzVjFPbDdiVmxUemZKOGZEWlY0d2FkWnJBcnlMUWFZQXhy?=
 =?utf-8?B?bFhaSjIvWHNseGd5ZTdDc3RxeWpRYUZkN0N6MUlCeDV1ZlpGQmQ3ZGFBbjRP?=
 =?utf-8?B?QVBITmJGTy9EVVFPN1krZWd5Y3BHRGRoc1FXRXZiTnd1b3FQdUdURDZaVTVk?=
 =?utf-8?B?a2p5cklYNXAvYmdLVzVpZmovNnlQSnRqeThuaEFnSXJjRVZpNkR2bmp0Y2c3?=
 =?utf-8?B?L3U2VEhNM2xjaERUWkF1QUVpZjJJVEZ6SFcxN3JFZUx4L1E5eWkxdmVtSEtY?=
 =?utf-8?B?ZjB3ZnI0UG5CbzdSU1hrZzNjVjZvbng0S0FOY0crRkdFcE11OGVaVzJVUFR0?=
 =?utf-8?B?YkVVb3A2ZmlRSlJCd1didlZPTUwzTzQzTnpXcGJKQldHaDJENEpSR2JXQm9j?=
 =?utf-8?B?ZkJmeDl0YTZ5SUlJN3hhZ0hlOXFvc0hLV2xPcmRWTW5PZzVYNWNWd250b3hD?=
 =?utf-8?B?QTJkeTNDelJlcDR0MUQwRXl2ekF0cVBnaExKK1drYzVrSDlXc2ZJTm9PS2Ja?=
 =?utf-8?B?KzF2VUVlQkk3cW44OU5NWUx3SGlMRTdCUittM2RYbEQrQ3k2MEhUTjVEbDJZ?=
 =?utf-8?B?SlgvNXNOQXpuaGNXQXhlaDBNZ3d2V04ySTNaUnVHWng4UitVRXZnYTdjSE5I?=
 =?utf-8?B?eHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YqztrEgLcvr7Zfyhm3XIRPSsc6rXYthG02jU5AB5h815r4tLXbHLed64uSEBjycxbr8J4GhTGDwWt+KhrfeQ4+9D9Urq585gcqq0tIh9G5RWG/RQkZ7KGHLex3j8PLACP0cALCU8NuUnq+MiMCLnk0FfiT//p4GG0v9g+l0Q/+pRix1j+domGgrYmotONjFmcBSfrzJl+obBGnlKAoMha9D3VjjhRh5MlTqwIwAZNGW8eoYPcePWmoFg+lEpoA5OtO17dwHunsSmlfuUUAlbe+5VAeqRIxdf7/sRwn8vUJcv/MgH1pMHazI24jCCVJtN3XqdvWeI/MEO6Gytk2RyHdA3NVLFEqIsqoyx/z3NX2DGOOcSmQPmXQDcBwtZsZX2Tc3063mRoSClIumBdEm5N+9wH+iI3gFZ+5Yz5WSN5PeONGdd657yxBRMl7ZVOVVn0HB8NkVHQf4KRWDi7/KuHiU8C1+iEdnoxZWtqz3y7rUrsH5Ooyy6DC9mIGNmB4ecePTlcKiRoCbp1lL8s5PnuYWd6j288xpdDEvJabnmviEiMHr1QPXoSqvDBWXytlQM5Zz8JSD8tSQKcyAEV77Q1b9W4lo+eCYcHkw8tXx1pc4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bdeb463-988d-4b32-aad2-08dd86974fca
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 20:57:39.7312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: goAWeLfOTTf7bO9b9514hHvJLD76hAQrbdFJg59tg0m8cWRE9uL1p37ZUaJmdzPjSJPKlKpYym+kFPVNIEO2lCjtoxuOn2o36aEZgCb+FSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8544
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2504280168
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE3MCBTYWx0ZWRfX9m/hqk6gaTyK CKu3GaXnHxmneyjW6/+Updh+4ovf545FMa0z+dwsmfIGQO6Sa3LAAlKEjjHR1DCm9npv46w0d29 u0BZlrHSoXEnonsENcIwApS21sGITP9CY0GOUD12Jpw8M+iJeaiMAz4ctvgzG18uYqXo2PTlAR4
 3vDIVDTPODEAYBxn2C8x8/qvhER2S3aNXs89VEpOA0z8mgSb14Uclk0uNCqXiIkRgiIJ7ZHflCo 2eKD55oJNEAd4wlaC9tNofekGMfXRCPVC/KSyI8x61LVJjdPbhMYl5V/XE9Mas3l2yqAAQ+AWbF MQBOF8+y0UOG0aUgMZ9A3Fusu13qjX1gaIDaAm4Z43BJVhkZtM8PxVbES43sSHKL0SMlHmiFxVO QbqV26z2
X-Proofpoint-GUID: 47AaNMvK8O9QBGjSG3rIdts2QuiqUbTw
X-Proofpoint-ORIG-GUID: 47AaNMvK8O9QBGjSG3rIdts2QuiqUbTw



On 28-04-2025 06:48, Derek J. Clark wrote:
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-events.c
> @@ -0,0 +1,196 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Lenovo WMI Events driver. Lenovo WMI interfaces provide various
> + * hardware triggered events that many drivers need to have propagated.
> + * This driver provides a uniform entrypoint for these events so that
> + * any driver that needs to respond to these events can subscribe to a
> + * notifier chain.
> + *
> + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/export.h>
> +#include <linux/module.h>
> +#include <linux/notifier.h>
> +#include <linux/types.h>
> +#include <linux/wmi.h>
> +
> +#include "lenovo-wmi-events.h"
> +#include "lenovo-wmi-gamezone.h"
> +
> +#define THERMAL_MODE_EVENT_GUID "D320289E-8FEA-41E0-86F9-911D83151B5F"
> +
> +#define LWMI_EVENT_DEVICE(guid, type)                        \
> +	.guid_string = (guid), .context = &(enum lwmi_events_type) \
> +	{                                                          \
> +		type                                               \
> +	}
> +
> +static BLOCKING_NOTIFIER_HEAD(events_chain_head);
> +
> +struct lwmi_events_priv {
> +	struct wmi_device *wdev;
> +	enum lwmi_events_type type;
> +};
> +
> +/**
> + * lwmi_events_register_notifier() - Add a notifier to the notifier chain.
> + * @nb: The notifier_block struct to register
> + *
> + * Call blocking_notifier_chain_register to register the notifier block to the
> + * lenovo-wmi-events driver blocking notifer chain.

typo notifer -> notifier in all register/unregister

> + *
> + * Return: 0 on success, %-EEXIST on error.
> + */
> +int lwmi_events_register_notifier(struct notifier_block *nb)
> +{
> +	return blocking_notifier_chain_register(&events_chain_head, nb);
> +}
> +EXPORT_SYMBOL_NS_GPL(lwmi_events_register_notifier, "LENOVO_WMI_EVENTS");
> +
> +/**
> + * lwmi_events_unregister_notifier() - Remove a notifier from the notifier
> + * chain.
> + * @nb: The notifier_block struct to register

the @nb parameter is described inconsistently:
@nb: The notifier_block struct to unregister

> + *
> + * Call blocking_notifier_chain_unregister to unregister the notifier block
> + * from the lenovo-wmi-events driver blocking notifer chain.
> + *
> + * Return: 0 on success, %-ENOENT on error.
> + */
> +int lwmi_events_unregister_notifier(struct notifier_block *nb)
> +{
> +	return blocking_notifier_chain_unregister(&events_chain_head, nb);
> +}
> +EXPORT_SYMBOL_NS_GPL(lwmi_events_unregister_notifier, "LENOVO_WMI_EVENTS");

can be consider lwmi_events_un/register_notifier as static
if they are wrapper func?

> +
> +/**
> + * devm_lwmi_events_unregister_notifier() - Remove a notifier from the notifier
> + * chain.
> + * @data: Void pointer to the notifier_block struct to register.

* @data: Void pointer to the notifier_block struct to unregister.

> + *
> + * Call lwmi_events_unregister_notifier to unregister the notifier block from
> + * the lenovo-wmi-events driver blocking notifer chain.
> + *
> + * Return: 0 on success, %-ENOENT on error.
> + */
> +static void devm_lwmi_events_unregister_notifier(void *data)
> +{
> +	struct notifier_block *nb = data;
> +

if (nb) Consider checking NULL pointer

> +	lwmi_events_unregister_notifier(nb);
> +}
> +
> +/**
> + * devm_lwmi_events_register_notifier() - Add a notifier to the notifier chain.
> + * @dev: The parent device of the notifier_block struct.
> + * @nb: The notifier_block struct to register
> + *
> + * Call lwmi_events_register_notifier to register the notifier block to the
> + * lenovo-wmi-events driver blocking notifer chain. Then add, as a device
> + * managed action, unregister_notifier to automatically unregister the
> + * notifier block upon its parent device removal.
> + *
> + * Return: 0 on success, or an error code.
> + */
> +int devm_lwmi_events_register_notifier(struct device *dev,
> +				       struct notifier_block *nb)
> +{
> +	int ret;
> +
> +	ret = lwmi_events_register_notifier(nb);
> +	if (ret < 0)
> +		return ret;
> +
> +	return devm_add_action_or_reset(dev, devm_lwmi_events_unregister_notifier, nb);
> +}
> +EXPORT_SYMBOL_NS_GPL(devm_lwmi_events_register_notifier, "LENOVO_WMI_EVENTS");
> +
> +/**
> + * lwmi_events_notify() - Call functions for the notifier call chain.
> + * @wdev: The parent WMI device of the driver.
> + * @obj: ACPI object passed by the registered WMI Event.
> + *
> + * Validate WMI event data and notify all registered drivers of the event and
> + * its output.
> + *
> + * Return: 0 on success, or an error code.
> + */
> +static void lwmi_events_notify(struct wmi_device *wdev, union acpi_object *obj)
> +{
> +	struct lwmi_events_priv *priv = dev_get_drvdata(&wdev->dev);
> +	int sel_prof;
> +	int ret;
> +
> +	switch (priv->type) {
> +	case LWMI_EVENT_THERMAL_MODE:
> +		if (obj->type != ACPI_TYPE_INTEGER)
> +			return;
> +
> +		sel_prof = obj->integer.value;
> +
> +		switch (sel_prof) {
> +		case LWMI_GZ_THERMAL_MODE_QUIET:
> +		case LWMI_GZ_THERMAL_MODE_BALANCED:
> +		case LWMI_GZ_THERMAL_MODE_PERFORMANCE:
> +		case LWMI_GZ_THERMAL_MODE_EXTREME:
> +		case LWMI_GZ_THERMAL_MODE_CUSTOM:
> +			ret = blocking_notifier_call_chain(&events_chain_head,
> +							   LWMI_EVENT_THERMAL_MODE,
> +							   &sel_prof);
> +			if (ret == NOTIFY_BAD)
> +				dev_err(&wdev->dev,
> +					"Failed to send notification to call chain for WMI Events\n");
> +			return;
> +		default:
> +			dev_err(&wdev->dev, "Got invalid thermal mode: %x",
> +				sel_prof);
> +			return;
> +		}
> +		break;
> +	default:
> +		return;
> +	}
> +}
> +
> +static int lwmi_events_probe(struct wmi_device *wdev, const void *context)
> +{
> +	struct lwmi_events_priv *priv;
> +
> +	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	if (!context)
> +		return -EINVAL;
> +

might want to check context before using devm_kzalloc()
to avoid unnecessary memory allocation

> +	priv->wdev = wdev;
> +	priv->type = *(enum lwmi_events_type *)context;
> +
> +	dev_set_drvdata(&wdev->dev, priv);
> +	return 0;
> +}
> +
> +static const struct wmi_device_id lwmi_events_id_table[] = {
> +	{ LWMI_EVENT_DEVICE(THERMAL_MODE_EVENT_GUID, LWMI_EVENT_THERMAL_MODE) },
> +	{}
> +};
> +
> +static struct wmi_driver lwmi_events_driver = {
> +	.driver = {
> +		.name = "lenovo_wmi_events",
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.id_table = lwmi_events_id_table,
> +	.probe = lwmi_events_probe,
> +	.notify = lwmi_events_notify,
> +	.no_singleton = true,
> +};
> +
> +module_wmi_driver(lwmi_events_driver);
> +
> +MODULE_DEVICE_TABLE(wmi, lwmi_events_id_table);
> +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> +MODULE_DESCRIPTION("Lenovo WMI Events Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/lenovo-wmi-events.h b/drivers/platform/x86/lenovo-wmi-events.h
> new file mode 100644
> index 000000000000..e4c5459c2f24
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-events.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +/* Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com> */
> +
> +#ifndef _LENOVO_WMI_EVENTS_H_
> +#define _LENOVO_WMI_EVENTS_H_
> +
> +struct device;
> +struct notifier_block;
> +
> +enum lwmi_events_type {
> +	LWMI_EVENT_THERMAL_MODE = 1,
> +};
> +
> +int lwmi_events_register_notifier(struct notifier_block *nb);
> +int lwmi_events_unregister_notifier(struct notifier_block *nb);
> +int devm_lwmi_events_register_notifier(struct device *dev,
> +				       struct notifier_block *nb);

why devm_lwmi_events_unregister_notifier not here ?

> +
> +#endif /* !_LENOVO_WMI_EVENTS_H_ */


Thanks,
Alok
