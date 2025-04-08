Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5999E23C8C7
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 18:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744135754; cv=fail; b=ZuYn23RFwJk4vYgQ0RnPebgklJjrmBTSHwTnVeiH44fzTh9ByGZDIAlQVz0FFMvncOK8eoKFIEveT1xqAPUtDzwatjmGkuYLXNzjBvULexNsOKyIqlF7q1DK4AIG4JAfmvy/D5I+ATcn4wlbUM5mAnnA9t+HzKxXdZbCWIiEIYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744135754; c=relaxed/simple;
	bh=+lRLQAh8CEH49Hph7C9cC3+yjX+OmsTMH7ym2VgBxHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LG35oC8YnVWPJVsHM2XIoaKjhPmMxS5CPaxP7lkXV5S36ISeHcQU+VQf34yZGccBo0O7x1FIQUvixyoiO8I7dgXhB7VopSpZ9hQnyuNrNJXD4xxf/XQRr7YM78jap9anFWR1Jv9IQaFcOYRFObaAy6pkGRrl9lhIgdJ4OROlBlo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jrvi1CXM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Bl58z1Rx; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jrvi1CXM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Bl58z1Rx"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538I2vbt032470;
	Tue, 8 Apr 2025 18:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=YB0pCxQikRCfLEdfXI
	lmndYew/HebiQYGB2AylsXd/c=; b=jrvi1CXM1iN2Va0wdw03cg9JSkitNJ6F0s
	hrRTQ95jua6yrmfcSalKRvs8ErOz7GAJ03c364I0ajxf3MqXzZTt63no4r9wSag2
	GCibQxigjP5Dp+gv3fiHgIdqFF7pUsZUCEehxDKmNiJNGO+CFauy2adqlNUJ8vNE
	zpWUSpxYF+o6O/WDgnuA6POSkeaQ4bJbegvpaEqI5CUEyz6lF97FNhcV+EB1IjpH
	Q8TfrnDHTTuKugvZl1JqbnldzIFqhNzwFWYzg8LX+WFxasv237VCvGnfF/gMqlz1
	4uQ91/hHwvSaETGiBDygPeryBRGhza6smi5NloDXqMfsLhvMWXzA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45tw2tngqx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Apr 2025 18:08:52 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 538GaQoc013924;
	Tue, 8 Apr 2025 18:08:51 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45ttyfympt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Apr 2025 18:08:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YjY2QUPJVodQSDKvTRXv42ApBsYqerIlkV42KR/re9jpi+mC3aYzmHjiZOAwY+B+SFX361wUJOgrE1CPTEnnT2nvH4BWkf9x1zQJ3+sYVOlvr6p4hbLyAdb1n+TfQ/SUXWGagGI/l9Y08RAEIU94HUCxwg54GAbovw8mvdXjvn9eY3rMkAnyezkbMykuBtKc+Pj2rPKU9euktlZlR1qkRtl32c7MX0dRsbldNv+kJep6nTT6w2n2vD++Wl68bc+qXJkFxNevMGS91nx02sz7koHMFAo/kbyamPdLFH0wAc3Iu3X1NXOtlWtI9B/0KJEZ3KwrXi6oqZQudIjy3Z0HSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YB0pCxQikRCfLEdfXIlmndYew/HebiQYGB2AylsXd/c=;
 b=tsNx6RBdkPBJndl4A2po/Yp/CAkEK5DfBsBN/1uBfyZiNSkMMfsRteSMONly0Bx7oeZT15OegXv+ADe4Qty/SNbey2oqgKdDPo4xCquXbEiqSvcKZ4+L21lPQJek10+UpJ3/eGlAls8fd2OJmFh0AYpFE1J9GG7nshHsQGEW/YVRYOgGL+aBMs/bIeC3JRN8YS7qelQkS5DWLNmbUz/87Oeegj/+dE0skTh5ggnfxcdvHro1+rzTZLwYB2ulztEUEzrmsniO/Rj1p9LZ091+lsUJSZ6wzKid714ASUHzcM/tSywtlYcT4JNMpSEuXupXZgwduV7ocWlFeNkZP//uNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YB0pCxQikRCfLEdfXIlmndYew/HebiQYGB2AylsXd/c=;
 b=Bl58z1Rxjq5JDUQlfjw5n3Hf86FaRhPc53Jy4ywurIhYDnf8HgZn63IFjRIHeva24bfiR7T9e9l9hmWaDfK/nizchdwsxYRZCGeXsfjJuLiYIiOLgL8YKAZZk7aOlP8kJc28JR2TlXJvYT1qelcpLlAThrYIUQ7EEMjdfHTWv7Y=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by PH7PR10MB7055.namprd10.prod.outlook.com (2603:10b6:510:278::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.20; Tue, 8 Apr
 2025 18:08:49 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%7]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 18:08:49 +0000
Date: Tue, 8 Apr 2025 14:08:46 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Sidhartha Kumar <sidhartha.kumar@oracle.com>
Cc: linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org,
        linux-mm@kvack.org, akpm@linux-foundation.org, willy@infradead.org
Subject: Re: [PATCH v4 3/6] maple_tree: use vacant nodes to reduce worst case
 allocations
Message-ID: <qs2hawh4p3knbajm3uxrw3esh26fbx4vm54ck5nvdg52fzn3tg@6f27fet5fh3w>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Sidhartha Kumar <sidhartha.kumar@oracle.com>, linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org, 
	linux-mm@kvack.org, akpm@linux-foundation.org, willy@infradead.org
References: <20250407184102.2155415-1-sidhartha.kumar@oracle.com>
 <20250407184102.2155415-4-sidhartha.kumar@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407184102.2155415-4-sidhartha.kumar@oracle.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT1P288CA0009.CANP288.PROD.OUTLOOK.COM (2603:10b6:b01::22)
 To PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|PH7PR10MB7055:EE_
X-MS-Office365-Filtering-Correlation-Id: 1853894b-3c4a-4a05-da6e-08dd76c86937
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?od7nVIP1OlUszkcc0vcfziwECszqz6RjzysncwneLzcNvKsilR8wBVq2Dpa2?=
 =?us-ascii?Q?rhAAtm42MNnGmjFdYjwmXFFWLNT7AEQpWx8LFb3GG9x7cRplx+KxNZ49ae4X?=
 =?us-ascii?Q?48wvdRN2Grq0pzhsJeiOQMdclQAj9RK6KE4rgMhrX9Km5WrpDOJVBfKkv/x+?=
 =?us-ascii?Q?IHMxg1IQIQ4ZpcNTjYm7kOZoNsOZ5HaJJC+j04qI4Jofv1nbYyKhEyDxXc6F?=
 =?us-ascii?Q?glKXqMd6JAEI3woZlwlfXu3fCdUZX6LbTdNUZJGsnZvPSa7RN6dY0HhSs/3L?=
 =?us-ascii?Q?KX6959hPXWxtmtWuSUF0fOcLhM6MpZR/QWpRRDE+7zAL+9gxL2r25ISQqGYU?=
 =?us-ascii?Q?fAcUxLu6+hcE97PjDEx2WSDxoX3zTg2tmdCNoSaOOturWMHNCnKf/3OnWfsP?=
 =?us-ascii?Q?i7umwfXBS21baPJBDCqftZ0Z+2aH2pHYJthWCb4+zk59O+EcQVVvYUq2wixk?=
 =?us-ascii?Q?0Fe0qbnpO3b66ClkX0RVuhkVSymFBrqNVYnBZNw7Up6rDmD1KAtTWKmIIrwF?=
 =?us-ascii?Q?egVZPCOcWmCkd7hUTdgAzLwJLLagBEXLbOYFz34rYk9q+Yn6sCBSAa7mwPOG?=
 =?us-ascii?Q?AWMhb1AmBsu0iltdb8gQTqocraTUtTrk+3jv1qtXw5FwPnl3b3RdGhIoPABU?=
 =?us-ascii?Q?Xx0AkIMAcDb0bktAw/6/HylGhfj3x1+XolbTMjaFIKOoGeJ2UACEtwkrQqqZ?=
 =?us-ascii?Q?i+mPlhabeTjZvDUf18ntS5jjYHKRwPA8fyqNPmQheW2mEvV0qqurjdk0w83y?=
 =?us-ascii?Q?x8Al+CdhNvS7AmSbN1DZdVOKLRaA0ogbgSVlzlMRlgG5wa5mDBsQl0FDbIDs?=
 =?us-ascii?Q?4vpnqHzsgW65RdMfuDw7NZL9uigp21VS4r17ZFT2mMGqz1sZ58h2BQgdJ2t8?=
 =?us-ascii?Q?7qirwiCocpjnQfztOrYDpEEHOaZpTAM0mPWmYO1J/WLiJpm0EnDvtGsm7NZG?=
 =?us-ascii?Q?YGJiX19PkDxF6Q9bhzl3RgZ9JybgWQX+J0MCxKR8U15XhVOIimFPM+MxU24M?=
 =?us-ascii?Q?4s6Tonw62U8GkUSfUekLqztrg+fgfykwQEK2Q2PcwUGSQKCCDW0oQdIvDfAa?=
 =?us-ascii?Q?AFy3x9gx02BdCGPBucS5B0mM9F5O0vzP0DUj8jeZU/29m3kwO7DO6ce7QWFL?=
 =?us-ascii?Q?Hihn57CFGn5zdq44AW0835vb2EE65tLX6X9K0OGXVfrEmbu+NZCM0vSlkRg+?=
 =?us-ascii?Q?qwptXyBeivupVkADx1UpDl6wbsrLf3h61aSssdwpylG/7UUiMt23SA9rBOzE?=
 =?us-ascii?Q?gQfoV8DTX8RFQC8btcjFStaTHKzA1daDm67cDznHucfkg7V4dg7v1QJUqxL3?=
 =?us-ascii?Q?4O0W9efSUiOL+Pj2JSHbA1reVBSY+4FAb9sgsDgkDuTDfYUDwEdLw2+4VNeB?=
 =?us-ascii?Q?oRK4krjvXD9VJDchON4pJuYPBtacnVQq6BawYbz8juCbc34BcA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bkZ+1NRvJzf499bKJ8hIAszCub3p/DXF1lNtbS+2RjvJn0Bh3HeNIzH8aNgF?=
 =?us-ascii?Q?QN4lGvTgT4lGmidpPRo9E2QoytsxtJ2G2JP1TQNpJoTzZIEuhxbAUtjC41wC?=
 =?us-ascii?Q?pyw+IUrkTaceAbQG7NLI6fnAkmTc1kISg8BMhlbyFNdgJ1wYPgcj5u6wO/bt?=
 =?us-ascii?Q?+eAAcCOcPSnERZTFoX9zbzNmGq2JlBvRTyUSOXz53mDHodQGaToWAru6trLk?=
 =?us-ascii?Q?HeLg7k38EZkRztGZtBihPWeVbvgdXVV6WNJ94kCY9duKg8Z6FkpDJQnM7B9t?=
 =?us-ascii?Q?LZoUzjb4jOpS60rYAS1uToBk5fzYg8+L9JOzAf+rcfMyI8TV1lrRcw0iEdx2?=
 =?us-ascii?Q?WFz4KSgVlnrsbgCF7GmOIP3R1rJ/dv4gXrrzg1RzsfkZ7VcOGyClL2GFZvOg?=
 =?us-ascii?Q?4i6gk8ZB2d/7YRTRW7ofscZb3QQyrDlkQ6fHZAZwVuIAyjbYWyclW8AVuB5+?=
 =?us-ascii?Q?9dekqBhTAMcM2mzp0r9EHKPQ8Q0CG+JkbmKX2Y8fsSCz/sokQ8nHgtlKqpp/?=
 =?us-ascii?Q?UL+qTP1WZWQNYQC97TZsCXmPAWpLrQTGbj1YpVhNzaFQNF3yUs6DKxlFZLTJ?=
 =?us-ascii?Q?Vr4SMBeniWbqwp45DqLzZC0GRYEjV1x0Y+oM+cA2a0NkZnMf1QV7W4u9fMmo?=
 =?us-ascii?Q?C1sNyIidxb3fyoWbwTbRk3ZOLTyp9Zh4E/uwtAZTJtKvz4HKkH8pW8aMZ+T+?=
 =?us-ascii?Q?cIsz8omMo7X31/xBHaXPQhwSK6F3q7zwOiw9w+bztk8xt++LLXLMyDTpJOZz?=
 =?us-ascii?Q?gaoYcLZ4a17zOb3hXuUmEfT8JF0jkTBEx9yXjxjh4+pNQUgrmrnxo7j/j++R?=
 =?us-ascii?Q?FPrXZ4o+DNGb7rqKZA1ROq3lnTZTDi4WKVOS11Focck8FJKPt4e9iBZESqsQ?=
 =?us-ascii?Q?DynDqWXcMU5Ac2Vy0PY53souXB+WGvu55oUnUTfhRAqprACRbFXafXGe/sXt?=
 =?us-ascii?Q?wr5nLlrzMWcVyk/UTPzVhdRaK93xB5grBUwe5HQEP65X2YBBLyJgy/SOY+i7?=
 =?us-ascii?Q?CrE2Y1BBl2FRcD91h9cXtilaXkFm45h/4u1PHd89muLF3kTYk1V9JWE66ON2?=
 =?us-ascii?Q?xgpWe/+rYNvmcrNG2ZsVU8tvj8o2J27X1Oh6k1xrq2FsdtDCEccuaYd3QBcZ?=
 =?us-ascii?Q?oz3ZYQp8lway3saF5nbFi5mQnXL3OexwMoXikJRIrhYddWHz4H6Nv4mk6h8o?=
 =?us-ascii?Q?ghlVyef09Fk2dQBZ/WUgsc/85678Ez36fMiaybu3WFiWONs+F5P98B4mPX7j?=
 =?us-ascii?Q?rsQAFAOBikmf89wN+GYlE4KHyA3dWxakOs+DwrWYcrSNm3Gzzl3pX/e5niht?=
 =?us-ascii?Q?bPbOSjVfSmUv1QiI9vxSwVpl28uiSlLIc67sQZ1tV9cOhVtMc2JX9jOOZcL4?=
 =?us-ascii?Q?FzlKBwKIBjRYMUbZACnfFSoheHgi7p3pqnYZKBevNk1u+fv+zU2Z6Vgf1JBm?=
 =?us-ascii?Q?fguqSpdNsvm+VDbG/oDy9b67QIYv8VDGcwdahWpW1H67KyPuOmhuq+MWqCUL?=
 =?us-ascii?Q?e9XkZUEIgcpAi6H1oOcXRS9ItlD/i8hvq4mEg/9Xw8ecX9po7mXSEpoNTr2/?=
 =?us-ascii?Q?+jbf79ID9gJZYV7XOA1wlrzOzOQeoLYWl+UaFhWS?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lu0wLyT+fSEhFwRW2P0MQRl/752l3owjMuahGnHElQacsuzfANJcMH5ukXmsUWNt6RZzEQRMu6pEAmlA/qnmxqeFkEFzqs3qECUfUtwdoRUI8d5xJUkd02tRGCIJ0k1dYkhsNwWbzMHSlaYEn5cj5ZOWRT8InMhr6kqZlAgBrWvCw3Die1rH1oovloVGZ0Yk8cDT0kBNHqvb46hk/BQp25XT8EZSVJ6p+DMM3r8UNgciEkC6BK3v2xoCp0CZWTm2IwzqQVxQPLrC23+KoLJw+8WF+sbCYj17LCz6el1gXhgemMPGGEXJwTOBv/gT8sgHGnXvG7oJX6/WBrfkzuF1Q47hlNCpb/MZ9mT8fMpow3PzelGH9O5H+Z8NDNOc6T+ONCdhcLxaIJYtrwVbkYmjABclkB1Ju+QUXrjRs0SBNeq6ipiXZFdm7uKFqDtPYkELSTunXL9vQhaTnMybEoOA+I98lFJDv2uiXZa3claPJprrRTbg2mwPlaOXwvKuTP/7RKnujA5tUJnxne60doepgOpMs/yUQvC3c/w9IAqfT9Ov5AHozKyrsuJ9C0HU4RDjJvt/DZ0aoYyAKZM5hw4+QZyabrBPp8554CABzO561QM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1853894b-3c4a-4a05-da6e-08dd76c86937
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 18:08:48.9527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jzPt9WgbYsOqdBObzlT+vCQf+LE4WgFjT4eoFW7npuu+z7dqTtJqaq/An+8VmFeCTVOx5J08MVyPxTsZkVafPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7055
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_07,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504080124
X-Proofpoint-ORIG-GUID: 5wNLHnVJ-ztlXA9yrraw_s10NsaWMtW5
X-Proofpoint-GUID: 5wNLHnVJ-ztlXA9yrraw_s10NsaWMtW5

* Sidhartha Kumar <sidhartha.kumar@oracle.com> [250407 14:41]:
> In order to determine the store type for a maple tree operation, a walk
> of the tree is done through mas_wr_walk(). This function descends the
> tree until a spanning write is detected or we reach a leaf node. While
> descending, keep track of the height at which we encounter a node with
> available space. This is done by checking if mas->end is less than the
> number of slots a given node type can fit.
> 
> Now that the height of the vacant node is tracked, we can use the
> difference between the height of the tree and the height of the vacant
> node to know how many levels we will have to propagate creating new
> nodes. Update mas_prealloc_calc() to consider the vacant height and
> reduce the number of worst-case allocations.
> 
> Rebalancing and spanning stores are not supported and fall back to using
> the full height of the tree for allocations.
> 
> Update preallocation testing assertions to take into account vacant
> height.
> 
> Signed-off-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>


Nit below in the comments.

Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>

> ---
>  include/linux/maple_tree.h       |  2 +
>  lib/maple_tree.c                 | 13 ++++--
>  tools/testing/radix-tree/maple.c | 79 ++++++++++++++++++++++++++++----
>  3 files changed, 82 insertions(+), 12 deletions(-)
> 
> diff --git a/include/linux/maple_tree.h b/include/linux/maple_tree.h
> index cbbcd18d4186..7d777aa2d9ed 100644
> --- a/include/linux/maple_tree.h
> +++ b/include/linux/maple_tree.h
> @@ -463,6 +463,7 @@ struct ma_wr_state {
>  	void __rcu **slots;		/* mas->node->slots pointer */
>  	void *entry;			/* The entry to write */
>  	void *content;			/* The existing entry that is being overwritten */
> +	unsigned char vacant_height;	/* Depth of lowest node with free space */
                                           ^^^^
					   "height" as it's depth + 1.
>  };
>  
>  #define mas_lock(mas)           spin_lock(&((mas)->tree->ma_lock))
> @@ -498,6 +499,7 @@ struct ma_wr_state {
>  		.mas = ma_state,					\
>  		.content = NULL,					\
>  		.entry = wr_entry,					\
> +		.vacant_height = 0					\
>  	}
>  
>  #define MA_TOPIARY(name, tree)						\
> diff --git a/lib/maple_tree.c b/lib/maple_tree.c
> index 236f0579ca53..203a1a529884 100644
> --- a/lib/maple_tree.c
> +++ b/lib/maple_tree.c
> @@ -3539,6 +3539,9 @@ static bool mas_wr_walk(struct ma_wr_state *wr_mas)
>  		if (ma_is_leaf(wr_mas->type))
>  			return true;
>  
> +		if (mas->end < mt_slots[wr_mas->type] - 1)
> +			wr_mas->vacant_height = mas->depth + 1;
> +
>  		mas_wr_walk_traverse(wr_mas);
>  	}
>  
> @@ -4154,7 +4157,9 @@ static inline void mas_wr_prealloc_setup(struct ma_wr_state *wr_mas)
>  static inline int mas_prealloc_calc(struct ma_wr_state *wr_mas, void *entry)
>  {
>  	struct ma_state *mas = wr_mas->mas;
> -	int ret = mas_mt_height(mas) * 3 + 1;
> +	unsigned char height = mas_mt_height(mas);
> +	int ret = height * 3 + 1;
> +	unsigned char delta = height - wr_mas->vacant_height;
>  
>  	switch (mas->store_type) {
>  	case wr_invalid:
> @@ -4172,13 +4177,13 @@ static inline int mas_prealloc_calc(struct ma_wr_state *wr_mas, void *entry)
>  			ret = 0;
>  		break;
>  	case wr_spanning_store:
> -		ret =  mas_mt_height(mas) * 3 + 1;
> +		WARN_ON_ONCE(ret != height * 3 + 1);
>  		break;
>  	case wr_split_store:
> -		ret =  mas_mt_height(mas) * 2 + 1;
> +		ret = delta * 2 + 1;
>  		break;
>  	case wr_rebalance:
> -		ret =  mas_mt_height(mas) * 2 - 1;
> +		ret = height * 2 + 1;
>  		break;
>  	case wr_node_store:
>  		ret = mt_in_rcu(mas->tree) ? 1 : 0;
> diff --git a/tools/testing/radix-tree/maple.c b/tools/testing/radix-tree/maple.c
> index e0f8fabe8821..e37a3ab2e921 100644
> --- a/tools/testing/radix-tree/maple.c
> +++ b/tools/testing/radix-tree/maple.c
> @@ -35475,15 +35475,65 @@ static void check_dfs_preorder(struct maple_tree *mt)
>  }
>  /* End of depth first search tests */
>  
> +/* get height of the lowest non-leaf node with free space */
> +static unsigned char get_vacant_height(struct ma_wr_state *wr_mas, void *entry)
> +{
> +	struct ma_state *mas = wr_mas->mas;
> +	char vacant_height = 0;
> +	enum maple_type type;
> +	unsigned long *pivots;
> +	unsigned long min = 0;
> +	unsigned long max = ULONG_MAX;
> +	unsigned char offset;
> +
> +	/* start traversal */
> +	mas_reset(mas);
> +	mas_start(mas);
> +	if (!xa_is_node(mas_root(mas)))
> +		return 0;
> +
> +	type = mte_node_type(mas->node);
> +	wr_mas->type = type;
> +	while (!ma_is_leaf(type)) {
> +		mas_node_walk(mas, mte_to_node(mas->node), type, &min, &max);
> +		offset = mas->offset;
> +		mas->end = mas_data_end(mas);
> +		pivots = ma_pivots(mte_to_node(mas->node), type);
> +
> +		if (pivots) {
> +			if (offset)
> +				min = pivots[mas->offset - 1];
> +			if (offset < mas->end)
> +				max = pivots[mas->offset];
> +		}
> +		wr_mas->r_max = offset < mas->end ? pivots[offset] : mas->max;
> +
> +		/* detect spanning write */
> +		if (mas_is_span_wr(wr_mas))
> +			break;
> +
> +		if (mas->end < mt_slot_count(mas->node) - 1)
> +			vacant_height = mas->depth + 1;
> +
> +		mas_descend(mas);
> +		type = mte_node_type(mas->node);
> +		mas->depth++;
> +	}
> +
> +	return vacant_height;
> +}
> +
>  /* Preallocation testing */
>  static noinline void __init check_prealloc(struct maple_tree *mt)
>  {
>  	unsigned long i, max = 100;
>  	unsigned long allocated;
>  	unsigned char height;
> +	unsigned char vacant_height;
>  	struct maple_node *mn;
>  	void *ptr = check_prealloc;
>  	MA_STATE(mas, mt, 10, 20);
> +	MA_WR_STATE(wr_mas, &mas, ptr);
>  
>  	mt_set_non_kernel(1000);
>  	for (i = 0; i <= max; i++)
> @@ -35494,8 +35544,9 @@ static noinline void __init check_prealloc(struct maple_tree *mt)
>  	MT_BUG_ON(mt, mas_preallocate(&mas, ptr, GFP_KERNEL) != 0);
>  	allocated = mas_allocated(&mas);
>  	height = mas_mt_height(&mas);
> +	vacant_height = get_vacant_height(&wr_mas, ptr);
>  	MT_BUG_ON(mt, allocated == 0);
> -	MT_BUG_ON(mt, allocated != 1 + height * 3);
> +	MT_BUG_ON(mt, allocated != 1 + (height - vacant_height) * 3);
>  	mas_destroy(&mas);
>  	allocated = mas_allocated(&mas);
>  	MT_BUG_ON(mt, allocated != 0);
> @@ -35503,8 +35554,9 @@ static noinline void __init check_prealloc(struct maple_tree *mt)
>  	MT_BUG_ON(mt, mas_preallocate(&mas, ptr, GFP_KERNEL) != 0);
>  	allocated = mas_allocated(&mas);
>  	height = mas_mt_height(&mas);
> +	vacant_height = get_vacant_height(&wr_mas, ptr);
>  	MT_BUG_ON(mt, allocated == 0);
> -	MT_BUG_ON(mt, allocated != 1 + height * 3);
> +	MT_BUG_ON(mt, allocated != 1 + (height - vacant_height) * 3);
>  	MT_BUG_ON(mt, mas_preallocate(&mas, ptr, GFP_KERNEL) != 0);
>  	mas_destroy(&mas);
>  	allocated = mas_allocated(&mas);
> @@ -35514,7 +35566,8 @@ static noinline void __init check_prealloc(struct maple_tree *mt)
>  	MT_BUG_ON(mt, mas_preallocate(&mas, ptr, GFP_KERNEL) != 0);
>  	allocated = mas_allocated(&mas);
>  	height = mas_mt_height(&mas);
> -	MT_BUG_ON(mt, allocated != 1 + height * 3);
> +	vacant_height = get_vacant_height(&wr_mas, ptr);
> +	MT_BUG_ON(mt, allocated != 1 + (height - vacant_height) * 3);
>  	mn = mas_pop_node(&mas);
>  	MT_BUG_ON(mt, mas_allocated(&mas) != allocated - 1);
>  	mn->parent = ma_parent_ptr(mn);
> @@ -35527,7 +35580,8 @@ static noinline void __init check_prealloc(struct maple_tree *mt)
>  	MT_BUG_ON(mt, mas_preallocate(&mas, ptr, GFP_KERNEL) != 0);
>  	allocated = mas_allocated(&mas);
>  	height = mas_mt_height(&mas);
> -	MT_BUG_ON(mt, allocated != 1 + height * 3);
> +	vacant_height = get_vacant_height(&wr_mas, ptr);
> +	MT_BUG_ON(mt, allocated != 1 + (height - vacant_height) * 3);
>  	mn = mas_pop_node(&mas);
>  	MT_BUG_ON(mt, mas_allocated(&mas) != allocated - 1);
>  	MT_BUG_ON(mt, mas_preallocate(&mas, ptr, GFP_KERNEL) != 0);
> @@ -35540,7 +35594,8 @@ static noinline void __init check_prealloc(struct maple_tree *mt)
>  	MT_BUG_ON(mt, mas_preallocate(&mas, ptr, GFP_KERNEL) != 0);
>  	allocated = mas_allocated(&mas);
>  	height = mas_mt_height(&mas);
> -	MT_BUG_ON(mt, allocated != 1 + height * 3);
> +	vacant_height = get_vacant_height(&wr_mas, ptr);
> +	MT_BUG_ON(mt, allocated != 1 + (height - vacant_height) * 3);
>  	mn = mas_pop_node(&mas);
>  	MT_BUG_ON(mt, mas_allocated(&mas) != allocated - 1);
>  	mas_push_node(&mas, mn);
> @@ -35553,7 +35608,8 @@ static noinline void __init check_prealloc(struct maple_tree *mt)
>  	MT_BUG_ON(mt, mas_preallocate(&mas, ptr, GFP_KERNEL) != 0);
>  	allocated = mas_allocated(&mas);
>  	height = mas_mt_height(&mas);
> -	MT_BUG_ON(mt, allocated != 1 + height * 3);
> +	vacant_height = get_vacant_height(&wr_mas, ptr);
> +	MT_BUG_ON(mt, allocated != 1 + (height - vacant_height) * 3);
>  	mas_store_prealloc(&mas, ptr);
>  	MT_BUG_ON(mt, mas_allocated(&mas) != 0);
>  
> @@ -35578,7 +35634,8 @@ static noinline void __init check_prealloc(struct maple_tree *mt)
>  	MT_BUG_ON(mt, mas_preallocate(&mas, ptr, GFP_KERNEL) != 0);
>  	allocated = mas_allocated(&mas);
>  	height = mas_mt_height(&mas);
> -	MT_BUG_ON(mt, allocated != 1 + height * 2);
> +	vacant_height = get_vacant_height(&wr_mas, ptr);
> +	MT_BUG_ON(mt, allocated != 1 + (height - vacant_height) * 2);
>  	mas_store_prealloc(&mas, ptr);
>  	MT_BUG_ON(mt, mas_allocated(&mas) != 0);
>  	mt_set_non_kernel(1);
> @@ -35595,8 +35652,14 @@ static noinline void __init check_prealloc(struct maple_tree *mt)
>  	MT_BUG_ON(mt, mas_preallocate(&mas, ptr, GFP_KERNEL) != 0);
>  	allocated = mas_allocated(&mas);
>  	height = mas_mt_height(&mas);
> +	vacant_height = get_vacant_height(&wr_mas, ptr);
>  	MT_BUG_ON(mt, allocated == 0);
> -	MT_BUG_ON(mt, allocated != 1 + height * 3);
> +	/*
> +	 * vacant height cannot be used to compute the number of nodes needed
> +	 * as the root contains two entries which means it is on the verge of
> +	 * insufficiency. The worst case full height of the tree is needed.
> +	 */
> +	MT_BUG_ON(mt, allocated != height * 3 + 1);
>  	mas_store_prealloc(&mas, ptr);
>  	MT_BUG_ON(mt, mas_allocated(&mas) != 0);
>  	mas_set_range(&mas, 0, 200);
> -- 
> 2.43.0
> 
