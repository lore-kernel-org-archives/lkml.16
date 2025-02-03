Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CAC522A
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 20:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738613651; cv=fail; b=f477N7ellTVzB5Z8ErbwnMbJLc6W5kPM1+BlW52svGDbTWNtpVjmaoIQbjXsMKrx608+h7cRjNZNtriDgVwokubl15ZO+FIMREfib6147npRoAP/P0DPxHkbWtC5ihaNAQkx7V+YqSa1uDZH1kaNkZ4ypfelI2L8FNrAG9b/SfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738613651; c=relaxed/simple;
	bh=OsNXwlGY7FskWiNRXJiLk0iZGGTmNdvHT9q0GbPGzfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sr2XaIxTSizjaz6poOjE6BO21fFzZ3w1jwh9++q6Vt0Mi7ENoLfihUlUFLY7dBYEtb2Ft8hA9a5WbjaWdWGpHOktgDCWtVUSFPUr0/IHWr/3IdUvGZJ3SmLVjw9/00GHuSNZFs+krzTc4OXqdmrboEWEWt4BIM9Wkp04n0302FA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MBePbr3i; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KEaWsGk1; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MBePbr3i";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KEaWsGk1"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513JMtpY001035;
	Mon, 3 Feb 2025 20:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=9dVl9XEk/8aFS2PHwWyZvn1MVW8zsEfNb3hj7VCvWcs=; b=
	MBePbr3i0PAcyuiN1L8GOKkFRTUH4DE97+vWE9AKSMbaWJPqeJv6wLCTMKiTnFGB
	7wH4Io+8dQI7l4KI9gEtcgpl6evQ2UWrkjJLVGaL0fhzxaZjOzargAw6LsLpnTeF
	RQ+MuncT1tzELxaQKqgOaS/kL+FIvLJXZTZ33YT7TmhbID8lugQe57X/nSmK9BvZ
	yO2RnDh6ctWaNR/jTaCCkPNKJq7PYe1hT26g8ylcitpwD0KeYRxZJzRMltpm4UXG
	2wgTXlOy6nz4TefiAFKxuaVJVExb2HCK2o2QO4ioivJPkuk7rpgzEqcFFcsFWzO2
	aJ3p89qRzYDT8MIfE2YV2Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44hhjtufmb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 03 Feb 2025 20:13:59 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 513J0Wh2030745;
	Mon, 3 Feb 2025 20:13:58 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2045.outbound.protection.outlook.com [104.47.70.45])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44j8dkc3nt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 03 Feb 2025 20:13:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wQlDl/LVulKHZeZcCzzHeNV0hQpgBEFD7gr3KOM3mFSlw48dW1DOIW9cZIKXfbivVcgJfgjglLs6HNIk9hmJCS8wlXyH5vzZn3uFuvTXwqhcl5gwzsQMAXyZtXMJzKKt5Pb5TUKl6m4LD802Nb/Ulx6Bm46zW6yPmB366qB0+59Wwow1H90ApUlWc9c/z7o/++bxBW7WQZ22tKdAqoF50g/o7jVHv6ruQwyCAZ51DIK4u9whrD2heGzlV6qhAqVL8MGyJTqUssQWO8YAE4xBSMe4mYlyeQAbIjfkdUA/OkPKM9tcFPKCsYw0PUv+AkTc5UebuMXuI7vqmQ3XOxmu/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9dVl9XEk/8aFS2PHwWyZvn1MVW8zsEfNb3hj7VCvWcs=;
 b=b+qAXRARDKAykR1fa3IvnGjp5pqKqHkRPxIoaF3+tHfoojjtU+3EqiW7x4NvJAKz8pOuswiUuLHx6c9PKCHrsQJaSWQ+g0M/lpjFCcZsFjpWSNOxhz+q4o/j/VrudA/lrAMMJAl0DPkPtOIyflt7llEbtPjA8TWMRR0HKGVBvW0QzOhepdoWHSvgVGy2Vc5lNrTXLqHVv4Ul7LYIbpLeRf6R+F/+lYFIiH68TZW7Qi/0r4/BlRbGF/f6ialVQf/fG9XTbuYE/lML2WPNvrI0mNEEP3DqvF0ChhxM5n1DuESypON0R09XmRbceq5tRpgu0QaLEgTGOOxqOEyxULGEtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9dVl9XEk/8aFS2PHwWyZvn1MVW8zsEfNb3hj7VCvWcs=;
 b=KEaWsGk1c3B4Z0MzXyQDjFebnwF8aquyF5LmRwwftqDyKu9uMN78DLDk6YuGSqig1AYuQUQnkJ7f6XURycYH/DqaPSjA8IIn5W661yTyaNX8Fq/h9TcbkEr4g/+k5a8YGnnUWxL++aIdUs3vAR/4x05tifnXhn61t9Y5BLYfdqg=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by CH3PR10MB6809.namprd10.prod.outlook.com (2603:10b6:610:141::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 20:13:56 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%4]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 20:13:56 +0000
Date: Mon, 3 Feb 2025 15:13:39 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: ebiederm@xmission.com, oleg@redhat.com, brauner@kernel.org,
        akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/6] exit: hoist get_pid() in release_task() outside
 of tasklist_lock
Message-ID: <2f3gjvg6zwp2xpkhb2e36ux2resnjdtxuinbbgnr57jdqesrm6@oau2dgx63fxy>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Mateusz Guzik <mjguzik@gmail.com>, ebiederm@xmission.com, oleg@redhat.com, brauner@kernel.org, 
	akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250201163106.28912-1-mjguzik@gmail.com>
 <20250201163106.28912-3-mjguzik@gmail.com>
 <eqoac7dyanvez62nc5ge3lfxxxbjcln3k6nrz4tkrg67v55sdb@sosx2sguy5f6>
 <CAGudoHGXR-vnYm-wMs5c8EE448UeuEps3ecrf_g22Mw=9oQtLQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAGudoHGXR-vnYm-wMs5c8EE448UeuEps3ecrf_g22Mw=9oQtLQ@mail.gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0052.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:111::21) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|CH3PR10MB6809:EE_
X-MS-Office365-Filtering-Correlation-Id: 9729b3fd-2f88-4956-f18c-08dd448f49bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEg5Z0hWdTBvU1NDamtWbFQ1eVF5RzB4SEFZeXRnWkdxQ0dCWlFZZktpUkln?=
 =?utf-8?B?RG9yazNBd2ZlcXc4d29hakFRSTJiY1o0SHRNcFB3WTNoTHlGTWp6N3Q0K090?=
 =?utf-8?B?RkVvQ21oc3ZTcitpOFZUbEZDN21zc216Qk54cnJyeVJFNnJieGgzUEJBZm1i?=
 =?utf-8?B?T0FWLzhoYlU0NitvL2xaeEd0Ym1BY1lUQ1l6RjFjSGdQMVJnWnZtQm9aQlBm?=
 =?utf-8?B?WWFFeXBjYTFXcXpKQ21yYnU2djFKSjc5ei8vVnI3UjBGWVFJbWgweFFoTFhX?=
 =?utf-8?B?UXYvSlFXaVM0TThCZGpmT1Y2Zk9iVFFXRU11M2dTR3RKUVV1SnArYWxhZSs5?=
 =?utf-8?B?cldRRlIrNHRFMlloaTNOZFlqYkhOQUE4aW9yWUswZUNWaEZ6OFNyYnNhL215?=
 =?utf-8?B?NngyVDV3Tk9ENnlwd3JnTnpWT0ZzdG1sc1c0UUIxa1luUUtJa1JXMWZLd0ox?=
 =?utf-8?B?Q05OTFUrRHZscSs4dkpRSU81aXpvSVFIWmdyTlJEQUxSaW16OFA4ZHh0T01w?=
 =?utf-8?B?cUU3K0xIZDNDbUVLb2hWSVZ2OERTdTJDbXduOU9ORzN2TzR0UlpPeHRFTGo3?=
 =?utf-8?B?WFNDRHFPclh4aHpPWmsrM2V2MVNmeWZqUjlTaVp2cmxjR1pLNGF1T291YUNi?=
 =?utf-8?B?OWhRS3dSR3A2K0lQZHg3V1BpL2JrTk9HWXNRa1FzRkwvbVhzRzZEYmp4VWE2?=
 =?utf-8?B?MzNNMzBmY0hlVnI2Y1ZiQ3kwTzJOOE5FSXc3dHFNd1BXbzgzZHdYTXY1UG9K?=
 =?utf-8?B?aFNVbU5rQUhGa1BycDBreG1GejRyU2xMVVRwTHJMU3JrZWdmcythL2JpWGNy?=
 =?utf-8?B?UE5SSys3YWhVNzFxRlJGVjF3SnF0aEgxNkFvV3VCaE9nbGswRHBzdUpib3Nn?=
 =?utf-8?B?Wk5lYlZVc3dRSEZwM25uYXZmMDVjRjFBaHFUZ09aQ1IzUjk1RTkrUm5mK2Fq?=
 =?utf-8?B?R200elZ1THJJOEczSkNPZnJ0S2xtVmJJbVhCMjhLZ3l0VnkvRklnNE10MDVC?=
 =?utf-8?B?WlNMak4vWk45Zm12ajlaRXdRaTJrK09BUWJHY2RiTGlEREZqdndFVEZtbERM?=
 =?utf-8?B?RmRFQjBVOENuaGtaaWJ6NHdpbkhoa2xjZ0Z6MEg1V1pteUNiYTZxcERrTzVN?=
 =?utf-8?B?ejJKaEN5OWZGNnFyU3VOL3NzZkJNL3hIcGw0Z0YzaVBKWGc5WTFlS05aUkRZ?=
 =?utf-8?B?T2t2bUpCaE5aa3dmTTRsdDlOTkg5anBacThEQ0pJd0VId1QyQ21XbDlrMnht?=
 =?utf-8?B?L1dOTmF0QVFUNER6bTJMMllsOUpERy96cXVQL2xDdlJZT2tHaTV1ZmxQUEVH?=
 =?utf-8?B?ZEdpVGFzUUNYSGRPbzNFcjhkc0E4VjdGUTFQT2U1SFBuZ1IrRjRqUjZlYlZO?=
 =?utf-8?B?TDRtTEY2QlRjVTNnbTg5di9ROVV6clpBYi9qN0JEZm9abEQxS2Y1Z1pUT2Zo?=
 =?utf-8?B?TkthN25QZDIxL2c3ZGMzOE1MTmVPRDBPRUxIeHo2aHZDQkx1RmpzcWpMZ3d2?=
 =?utf-8?B?M1QxbWJ4NjVpM1RTUEdsdWRTQ002Q0pQcE1tTnY1VmN1K2VXNUN1NHVXZy9u?=
 =?utf-8?B?ZFc1Y2JrOUtEeGNPREIwWHFNaGVsS1lhTDdRWTExRUtrVUhncjFDUzh5SzNk?=
 =?utf-8?B?RUdSUEpmVEhvZm44Um15QVc0a2NsS0h4aitQSU5TdVBqWXdLZFkydm8zUnpw?=
 =?utf-8?B?ZzJYak1ab1ZnbXdtNUtsVFErUlFHYmU5N2dVbjF2ZWxwdnNmL2hNZm5xRWRB?=
 =?utf-8?B?UWVVZFBmUmdqL2k2L2RQUEtVUytyS2MxNG9KbWtJMzJYc2ZyVjZWYkllRTFu?=
 =?utf-8?B?Wk1wcjdTN2JjMldZS0V3aXlVMVVxU056bWliMW5SdmFkazVsQ3lvOHJiTy9h?=
 =?utf-8?Q?neJR3v8muPIUy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1ZWbVkxdFE1MUZCK3g4Ly9mblJkWG9MYnc1ZTA2ejhiQnYrQk1WTnBEbFlu?=
 =?utf-8?B?RUllenJOVUxnclZSb2d5dEZZTVh0L2UzRFpJMkhYTmxnZHJtZVgrY3dXeHFh?=
 =?utf-8?B?RHBsRkxKMTg5cklwRG50VTNaZjcyMlV1S09GcCtWMndOcW01TitnM3pPZUFt?=
 =?utf-8?B?TytIamltVnFlQ1k1UFk2eEJaRnp3Wld5dUFFaGtnNHBkMFNISUtKY1dDTVFm?=
 =?utf-8?B?R015YnFOcjVRNVNNWWpNZ0hZcmJHdFFYS2crbWxMRjFzR1N0Rkt5SEtmeW5N?=
 =?utf-8?B?cEMraE1ISWhnM0p2MFVpZVZ1cjJMNVFIL2MwRVJSLyt4Tk91dzJ0ZE1YK0Y2?=
 =?utf-8?B?SWFOdjZ6Sm1VT3IydVJ6TUU4cmpwQ2pWM3lrOEtmN0czcVA0Q0V2WUw0TzVp?=
 =?utf-8?B?T0ZvMkNmeVRUeTFNc0x4bGg1Z1g2VGZlZU5qWEVnMW5mTk04THMyc0I0Q3R2?=
 =?utf-8?B?eFdQT3ZZc0ZSMlMrdWdLK1U0UEdxSmpJYnYrK0VuUllEMWQ4ZllHLzBUUHRv?=
 =?utf-8?B?cm1YNmRURTMwTUJGR3RPK3VOZWNnRnRTTGZzU1ZlQzdPWVRrRTFOcVpDSnVp?=
 =?utf-8?B?dGhXLzhDSlE4ekFva2lRRi9KQ05WcHpyRUlPTkI4dFdSams3a2s0RU5OSVQz?=
 =?utf-8?B?UzV4dTF6SUh6T3hLYWpmS1hTdnRnRHZyTGFUa1lqNjlybFQwSVY1UERobjUr?=
 =?utf-8?B?UDNGdnYzU01yVGNoYVlqbUh0VUNVV1I0UUNzRkpkTDdKWEdGbGQ2aTQva3Vl?=
 =?utf-8?B?eXM2S3hTY1JyQllBaDl0d3lYT2JtYWNmWUxGdkhoSDVoY1lsdVJCdTc3b2tR?=
 =?utf-8?B?UHBPMmIwdU1wT1hxZmIrdzZlelJuMzU1a0FQWDdZU3BBN1FYTTRZcXpQUHdt?=
 =?utf-8?B?SnZyY1FlMVJJR3ZvTUFLMGdWbTl5bytaMS81Z1IrRjZhYkJJb0I4bTd1b3FJ?=
 =?utf-8?B?ZjltZlI5QVBXdzFQZzJjYnh2Q0cvdWN5YnhyODBkRUlSM1ZIeFU5TVBhR2N4?=
 =?utf-8?B?YVRkOE5tVmhkWDBSOURVN1N3c2YrQVRUazArVStQMlFlbUFEaHFBRHVBeThI?=
 =?utf-8?B?TTJONDB5TmtONDNvNDdUOXZvNktOVUxaRkFPeEIyRnBIb3BJL1hENFZQOWdp?=
 =?utf-8?B?RVNmWlAyV1dTQnE3RGo1U1FST3lKQzFERVdIZ1RMVFRGMURIOXo4eE5Mcmkw?=
 =?utf-8?B?MTRPQjdxaGxPRUhiVXg2VDY2M3VhY2pjbVpjNUJOZk9mVUNFZGJwVEFZM3gv?=
 =?utf-8?B?V1VBeExhUmRFNVJQWXhkOXRKdzRoV05zTjViMC9hZnV6WmVjWkNkM3pNRVU4?=
 =?utf-8?B?NkNnNzVzVHpnZHFJUDByL2NkWkFSL3hjT1BPMmZrVUZGSm00WGJ2YVZNUUlX?=
 =?utf-8?B?bFUwWXB1cGtIVlBIOHNrNkpwb2pUTHpNN0VJSmNBbVo0S25KaWRaaGZsRE52?=
 =?utf-8?B?UmVIWERlYzQ0ZWpPa20vTVZlK2RyUk5aMTVyRFF1bUpseU9Xb3MzZW4wbXpQ?=
 =?utf-8?B?enFZS1F6cjgxL2s0OUJocFdwckYvU3MvWlplNWhRZlJ4d244U3dwOExuaElR?=
 =?utf-8?B?MUVPV0hBdjFyUmplOWx5djgxREY4VXBuVXdlTkloVjJRblUrcHd2aGtKWlVR?=
 =?utf-8?B?dkZBSzNHR3g1YzJIWmNPLzRwbzBQRG5TWWo2ZFBqT052SkN5Rm1XMGJhVmFR?=
 =?utf-8?B?enJYWUtwSTVGRmlRMXpjMEtQTVBLQ1QxRklvNDZ4ZngxSGZ3RkpubUVZeGcr?=
 =?utf-8?B?WGk0TEF6V0ppK0oxZGd5SWFjcmY5U2FsQmE5bjUxc1lEbTZRMzdZd1E4dXM2?=
 =?utf-8?B?VXJTOG1yOXdtd3ZqUnFYQ2JzUDNQVXB0MzZIQzdtOURRUy9FZjBLdWJoTzBq?=
 =?utf-8?B?alFydkc2NDBqdWJCZXhUQTV4SXNMTDJoNnREa0NoQXpxcGoxSEV4REc4dGRD?=
 =?utf-8?B?VnRVaG1zekw4dWp4NU9sMFFGSFphdmZRcjZqclNTRFVGVnk2N21rTTYvRHhz?=
 =?utf-8?B?eVgxMnB0YXNaR0lqQkhXV3RRa01Qb0YwaW1Ec05jcmMzczdzekliRHFVanYw?=
 =?utf-8?B?TmFCUENMRUpYaWVrQUZnWVk4TkdaNnZDdTNqTDV4Y2dGU1NkYXBUV2ZRdEc5?=
 =?utf-8?Q?AqdQQXUIlPOI+IO7zFWBbBxad?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lwvGlFJdnpZIASKXenQ6Cy6aXbd6VMaL3yuardt7JoCUww4lQTf4Hix/TP7EmEdHk9jkvQTaStxvcGeN5YwZXCVmJTluK/QCkaQk3e8chXYclTa8AoMx7DaYfJoLpM/4Bjmb8S//nZd/6cUwSQ/wr+pmDDTKPQ3qGsDLqREo3u/YrT6qqEweznXjVIbeWh4QN8LA9vp+S3EIrUukI/eRXxBoI2E+9AlSqzYNUKeG2EyQ9g5Y79QKKlwpiovEQxxLOqYa+w8DHhjThGszFWV8mNZyu1eC4o3Y43FENdRAGJkhdPbO2CnKDT3uyjuJ7NcCbXV543J2VGkFlhIZJGEczlXjkzHx4FyBBAKOA2cojp5wCtMawAAXol4Vg3aMFGxcyxBDyd5l7bCDbKHs4wyDt7uKpWHMkyPSBf+QazqxIY1pfT3+ehEeVuyRchaFpEWWEPQBn2vV3laFEgaRx+7+/kXX4O9mn/Bvlo8wMz5lGY7rtvN+Pz8MCxG1NKNVT8JwkU6tnpa6gx7HPDSV5f7fY0eh4aQXZz5+Ifp+cpAEaE240/s/oJOK2+L+Bx2i94+CI2AXxcNk7Q0730YX4RtMUOA/Yi0AVGu6NK83qPpdEc0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9729b3fd-2f88-4956-f18c-08dd448f49bf
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 20:13:56.5905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f/6OhtOy3bTV2W6Qpe16JrxAXOqvKOsVkRu5vIODRd6UTWooHszAKehWZjW4f6wLJPoNcXzasMBC95A09fbO0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6809
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_08,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502030146
X-Proofpoint-GUID: QOHM7yrfjfybATv6OtpuzCNLCu5v4jP2
X-Proofpoint-ORIG-GUID: QOHM7yrfjfybATv6OtpuzCNLCu5v4jP2

* Mateusz Guzik <mjguzik@gmail.com> [250203 14:36]:
> On Mon, Feb 3, 2025 at 8:27=E2=80=AFPM Liam R. Howlett <Liam.Howlett@orac=
le.com> wrote:
> >
> > * Mateusz Guzik <mjguzik@gmail.com> [250201 11:31]:
> > > Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
> >
> > Change log is a bit sparse?  I get that the subject spells out what is
> > done, but anything to say here at all?  Reduces lock contention by
> > reducing lock time or something?  Maybe even some numbers you have in
> > the cover letter?
> >
>=20
> I did not measure this bit *specifically*.
>=20
> As one can expect get_pid issues an atomic and that's slow. And since
> it can happen *prior* to taking the global lock it seems like an
> obvious little nit to sort out.
>=20
> I would argue the change is self-explanatory given the cover-letter.

But when you git blame on the file, you will not see that cover letter.

>=20
> --=20
> Mateusz Guzik <mjguzik gmail.com>
