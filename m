Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1443A25D532;
	Thu, 15 May 2025 18:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747334248; cv=fail; b=ibg7BsRcXolvnP9lMNbb6AwgFZm6MvttrYwtpv+1mp2w24FI+es2caBeiIg7NqqGLllfnpO9pAcRe+8kXg3eHFh9desDSeUmpBmPecbJwupzw/68I4cOHko1Ppx7A6b5wjuw4f4ANdBQyuHQGoydghZV5i1sHM/irbJoUs7VF1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747334248; c=relaxed/simple;
	bh=9BmvsTxnjlQLn4xCYG7Hk/dfZFXdmipm82DS5mXq8+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aL8Iw5NzDsiiYziMUg2cxbGfVE5I/4ODiYXt1zEAbtjAj1wTBffhqG6NFNrvpW1xNb3uNlTC/w+g4H+XTw+/qQCa0vHjHjxxCFDWK956SfqYvgk/5yLwPhol40fwiHsnxCiCXWMBjO5OC5/McfehmRbpistGgIlfQpv8DCrt2AU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=E1Fx9z33; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MtXhOyRm; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="E1Fx9z33";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MtXhOyRm"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FF1nF2028458;
	Thu, 15 May 2025 18:36:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=I6PYbwsyyNqRYUfA5Fis4h/e7If5TnE7VQ5hDoFCwEQ=; b=
	E1Fx9z33HCT0yYv/6ujq0vz/OLs5Cuhx6SAsVJKdCids5QhGgK+AYBdrvySM0G9A
	54PU4196kr7b1nWzeqv5htlM7M3lbGGh/gKMyz9UdD8mIGsIfuyC/X+ilHWOgh2I
	286LdpzDHlxufSQg+QGaeKpBTuD/ycWHpE6d3gGlNbkXe6OjxapSC6eR2i3acaHl
	+iQP+nslEyFan3a2Q9ZfybHI42tMIQzH6x3n5RrEcHiFbDgp3rqro7yqBOJJismi
	YsbkvFjGZ0O7Pb5awC/TwigOeMz7z7GQuu8qwJdC7szeVAd/hFRMZih8dS0DyyQ8
	QdOpbdn864jaOaNHblpJWw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46mbcmmxcf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 18:36:42 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54FIKdGR026169;
	Thu, 15 May 2025 18:36:41 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azlp17011026.outbound.protection.outlook.com [40.93.12.26])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46mbt9qdg4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 18:36:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AC0xP5v0/V03zYFuOV4+C5Wtt0SB4Nhew3OccdRczKrgnv+VEHLc2pap14Yogfmw66RoWwHx4BRv7PqQKNABBFL4jVYgaLOJl5rXFtQ2UZYwhE3db/r4T3rz/9ElwzbWnSrFmpiVvqYeoaWAUEM+LI7qlepKu4Z0J3hkZfOWm5V4WQK84cFaTqcG5CpY/wh4D7MATjfrrL7NJTgS5P15yeNXpbbv75SpisSAf3sBqM08ERa/AHVRZBqbXC5AU4YMGDRTZUxhgjIQAS1DXLF79UZB0FG5tGTJ9RS2qR2m9tSGjKfQKMaxMCMA59l4TMz2T0bnmziURwH2AaknnsTPhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6PYbwsyyNqRYUfA5Fis4h/e7If5TnE7VQ5hDoFCwEQ=;
 b=RC8pTpNZp0eLkY9izOgdB03C8PFSVfJ9fM3lIwb5hsy6bIPkvbhcRQzkpnylCvQ9xnIYLFGLEUAx+9E05yXl5YdJkVfujU5mUNwFFJ5BfljnFizg/e9RgZo5Wi5/j3hT4XWz7xfrzXOGb0tIjt7K0NDN/5HSPeG3jV4VuTK8OaJYLYrUNaz7tP50kN7oHFB3aW2cvjNsIeriBMV+bi11XStT2rw+Any21xoFMoeCpXd/UpUt3XBzC727J9IEQ8SOsSwr9zFYq4pmm3LMtAxgW1KnTN/zN14tbeAqsAwawNf03JYDKKAZ/H26m7Ro+mw1KPz1lgSEb+xcC8ABMprohA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6PYbwsyyNqRYUfA5Fis4h/e7If5TnE7VQ5hDoFCwEQ=;
 b=MtXhOyRmczEqY5nQR4Uk7GCBc6zfgkz0WUgVMk3rQQpGD0hw7vbx8IABTcm7wYtHYxHV64sWbMinmKzleRCMf4t5SK08jnAKWnElTlY5h6GHwFBfHQd14EI38YGeKphF3X5dG52jOGtvU5d4lb4vKR9ttKwb+E1KQ9t1gGKI2B4=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH0PR10MB4743.namprd10.prod.outlook.com (2603:10b6:510:3e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Thu, 15 May
 2025 18:36:37 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8699.022; Thu, 15 May 2025
 18:36:37 +0000
Date: Thu, 15 May 2025 19:36:35 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
        linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
        riel@surriel.com, ziy@nvidia.com, laoar.shao@gmail.com,
        baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/6] prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the
 process
Message-ID: <6c66e167-1be5-4298-8131-5434d9ff67df@lucifer.local>
References: <20250515133519.2779639-1-usamaarif642@gmail.com>
 <20250515133519.2779639-2-usamaarif642@gmail.com>
 <c0af0eb2-d10f-4ee3-87dd-c23cca6cfd1a@lucifer.local>
 <ddc0dd46-8541-4d4a-ac59-287e11e1d3ff@gmail.com>
 <02ead03b-339b-45c8-b252-d31a66501c39@lucifer.local>
 <732ff995-0e18-4e8c-a0a5-14da400d4078@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <732ff995-0e18-4e8c-a0a5-14da400d4078@gmail.com>
X-ClientProxiedBy: LO4P123CA0340.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::21) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH0PR10MB4743:EE_
X-MS-Office365-Filtering-Correlation-Id: be7c7e60-e0f0-446b-c476-08dd93df6cf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L2h0ZjBKamR0YjBpL3E1VVdsdExId0tYL05EM3ZqMHFiV0NTMGlMVFRBWDRj?=
 =?utf-8?B?SmkzdVhFV0xQb2JVbjY0TGtpMVlGU0Voek96WVpZOWVIQS9qYlZGSitBKzlL?=
 =?utf-8?B?SndpNGsyTW5oM0ZSbTZyaWp1V0p1S1VaOVFCanRnN080bit6eVQwYVFQd0Qr?=
 =?utf-8?B?U2dwaXpQekZWNVNraUx1cXJnUXE4UHM3NWxzbVJOODlhSy82eW1sS2hJZXlj?=
 =?utf-8?B?Z2xRWnVkUnI3RDB5clA4MTZadmNMT2pFNnVRVXVLNngza202WkpRek5sY3NM?=
 =?utf-8?B?ZlMvWXlvU09YdXJhNU12VnhYcmYxazhIWUY0empJVmRQK0ZGVTZ5R2NRTGJE?=
 =?utf-8?B?c3FIcFVCTnFMRkRpb2s3TG5CSkpHWStydWtQeHE0ZU9LVXhoUnhLQXVqS2Zm?=
 =?utf-8?B?cW9xLytNNTFxZUt3WnRPaEdGTTFJaUZIYlBOR2ZnS3loYWwwUUpYMHFhemxm?=
 =?utf-8?B?ajI2T01Ya2NVR0pzdGdFL3BESGFVRDlCOUlqdjltSytKL2hYY2NmQ3FQYnZK?=
 =?utf-8?B?RnU2UCtLMEIwUyswNFo2d2FaaVpYTVNIMjhyV3Z2THFxclRTQjQ2c1FwVTRm?=
 =?utf-8?B?dlptL3BhWU9kTjhaZEl1UU04S2d1YXZUZjZrdzR4UTd5NXd6VDRkRGZTWGds?=
 =?utf-8?B?S0NJUm42TjRXWm1KKzRjN3pQRjJvaWNENSs3T29oMDAxVk9uaGsyUk54ZUZn?=
 =?utf-8?B?KzFEb3ZlSzUrRkh4RUluNy9VL1JiKytUNzhCN0dKbi8xT2lqZWdqNXhMUURI?=
 =?utf-8?B?TlhPdjRUYlNYQm14aDFZNmFiRjJqclVUdjJsTkFCZTU3MUExVSsrSmJXalFS?=
 =?utf-8?B?b0p3eGFvYVEvNUdrS2ZkcGJJZlRCYWowcWtnc040TU9NMTBIUHI1aEI5Qjhx?=
 =?utf-8?B?K3hEaE05R1JubWpXNHAwS2I5VHhpQ200ZEIwMitEcEROWXUwRHdUQ25zaEtq?=
 =?utf-8?B?UG1vZXBsYnZUMEpGY0Nyd09kZ3pvNUp4OHdIMGJQWVZVNVZpUzRoWXhrNmhk?=
 =?utf-8?B?SWdJejZYTXpLOElHRUNnSXNpQ3pVMHhsd3VHNUpZd2VkWDQ1Y2wxSC96VXZr?=
 =?utf-8?B?Y0lPTkxDNkRaQ0pkV3M0YzBZNXZ6YURvNFFPUEtSVEk4NGRwYmxCZmF5ZzJQ?=
 =?utf-8?B?clVJbXhqQTkzRG5OTytVV01zY1FyOVJOMTVhQ1BkWFE3UkVBT201eXNRUFAy?=
 =?utf-8?B?c0dVajF6Rmlva1ZjWDZRZThjQWxZUFQ3eXh5ZXA3TWZJWTBSSlNrOVhpMEdp?=
 =?utf-8?B?K1BYWkFFd21IcVJJMElYMGlWUzd3TlQxaEorUHRTVHM4S04ybzZncm1meE5N?=
 =?utf-8?B?Z2s0ODkyMjI0WW9XRk1FbExMa2ZBVW5jWTVuSE9sQUZjWmxUQ1duREE3OTJs?=
 =?utf-8?B?VUQrWjF4aU1OODlBSVBXVURmZHRyd0Z6ZUNhNXFWOGwydFNxVEkrNE9VRXZn?=
 =?utf-8?B?bEplM2hZczJhOVJ3NlR3ZEZYSmpKTDZtcXo1UlRXZ0RBYlBqZkZDWjg0VVNI?=
 =?utf-8?B?WU5mODRZT3RHWm1vMkpCbno1TmZjZ2hsRWFsdHJxdHNmeHRmOWl5Um5uWUJj?=
 =?utf-8?B?S1lXTWF4K2M2MkZvbm9TbWx6RWFiN2xqQi92OXdZNXl3SGMzcjJRMDF3WXRk?=
 =?utf-8?B?SUtnTzkrMHROTDQ2M2xpcDdleWtTWHRZOXpSSlZacGFwN280eDEwcEQ3am9r?=
 =?utf-8?B?R1h4M1Z1R1BqSjdPR1RzbVlBK28zM0NNVlpZelduYnpVSDVNNGtTeWhyNXJU?=
 =?utf-8?B?Rm9MRGRnUzY0bHBzTG9wZkZVNjZzMVAxMHJTMnJaTFJQWUx1dUpCVG1IdTVE?=
 =?utf-8?Q?rrUDUsj0o4OeBoQSqO7np9SFEdQWddqW8bTzs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTZRWFN1TlA0TVRnTjZqYXE2a096V2pGQU5EcGJFTnhROGVlWHozUTNObEM2?=
 =?utf-8?B?eURKVzExWDZZQ1hQclZKc1ZucnJDSGpIekhLWG04STZBWlArOFJQaUVtcFha?=
 =?utf-8?B?MzVaV05hbXV6aFNvQndMay9SeUhkNVNENWJieTN2ZkhocXQ5N2VXZjVncVoy?=
 =?utf-8?B?RFRaOHFCc0xHd1A0a0FYdTZSVlRxVHBCNE5QRGlRUFBWOWhVMDFja0R5OUQz?=
 =?utf-8?B?cEdPbjVWaHRzdVVuUmlPbENZMFhaT003ZXhJWGtQa2NJb1BJWDcwUy9oeU4x?=
 =?utf-8?B?KzVwUHk0dEFLeUE0MGo1YUNLUDJtNFhaZ2pEbEp2R0xpcVdaVEt4Q3hIQnVV?=
 =?utf-8?B?Q3p2THBJdGFXYmRqNVlTd04rZndTTTUrbUE5MGgvbWRONktqSUVPNEVhZjc4?=
 =?utf-8?B?ZGQ4VzRBU3UxdjczdUhxRjB0QkE5U1FrMy9POFB4QVVBZ0pkclJFY2dXWmRM?=
 =?utf-8?B?Y0tNcjhDTU0vTS9aT1dHQngyUm1zeEZ4OU0rSWxYRFJOcUZNcEVDc1hSeTFR?=
 =?utf-8?B?WEFnbHFhNmlmNStlSWhJVmVFWHhvb3VmaDlHZ1FyaXdSYmxudDdPNlJjWTRG?=
 =?utf-8?B?THNlYjQzY281YXYrM3N6ejJlWStidk9pU0t6akQ2L3FFUE42aFBsRk8vdE1U?=
 =?utf-8?B?d2NrUWNoTlM2T1ZQT0lLSG5UVFA0azVFSThDRmRWZFAvUGVJSWltQmZ1M0FW?=
 =?utf-8?B?TUxaSlIyREFRZTBKSkhwTklZWHFDZUxreHJwMGwzWXkzYW5oYmNFSG9CQmxX?=
 =?utf-8?B?SitRc09nSEtMZ1pOQW9uY09qbSt6Zy8zWlFxMklnMjlPSWFqZXRrUlRlSDR3?=
 =?utf-8?B?Z0Z0bXJ6ck5xaWw2TWtZeFFCQVhwT0RiQmVtWkkwNU1mVUlJajJQVW5pM3Iv?=
 =?utf-8?B?Z0dKaDVoaG9yQ3B2YjBYUjRqSzVva2hTQmlzbHF6TFVuSzNhQVA4R051Sjc4?=
 =?utf-8?B?L2RSSWFvUHhxOStwSGpzWXhHbmNNUXZ0VmpsUkpVakpQRnRkcjFuMWhsbjJR?=
 =?utf-8?B?SmpmM3FXRlB0VnJrKzR6VEFsdmIyNEJPRmY5a204RzcwUzh1Ty95ZUwwcWhV?=
 =?utf-8?B?QmNOOERPTHY0KzVNWno3bmgzZlE3OUdndmpJVHNScWJ6STRFUVI0V0tad1h2?=
 =?utf-8?B?QTY2YlNadHdDR0ZFajZROGxsSWphL0tZcGxFclhPVkNlTkQwQXZNd1BZZkVl?=
 =?utf-8?B?bUtPaCszbGFSK3gwQUFMRU44SDlwdk9CQkZ4blJSNjJJQ2JHcTVzMTkwR00w?=
 =?utf-8?B?Z01QOVRocklYS2ZJMWxUTUNMSzlzYnI1VVd1Wnpkak1XMGFHeVFBY0dCSzlR?=
 =?utf-8?B?UGpFVkVLeUhXLzJIZVplaEVDdnNmanp3Qms3RHNUUGxMdEk4UFBveGoxVm1x?=
 =?utf-8?B?R1RsaXlFdGdheU50KzduZ3lTdVFyYVNHNkg1Z0RBSzZIV0tBWjcvOGdDTGtG?=
 =?utf-8?B?SWZXRm5CVkRBU1h5L3duemVDbG9CclFDWEtpaGZQNmt2Y0tsZ1hqYXFoYzF1?=
 =?utf-8?B?ZkdWZWEvSTVoL0lCWXYyZ0ZzaXl5bjIvRUx5N1dlbGJCQnBWdGo4M1QxNUEv?=
 =?utf-8?B?TE11UytvTHNrbTM3dUdGVlI1OHptWXRQdFBjTTExQjRTOUROZHBaUDFtcGcv?=
 =?utf-8?B?RWJrYjVNbHQrYnBIbzBEVUVKcDY3WUQxK0EwTmpndmh3SXliVTVKVkpzUXVC?=
 =?utf-8?B?eXhrSWNyRnA0cmU2K3MxVy9ab0FPMkt1Zm82ME1pU0RGR0NabEpBL1JyVzkv?=
 =?utf-8?B?UVRjd0gxKyt5S2dONzhTRGxWUko0ckVNa3Q3SG0xWTNTUlFWd3M2OGhCT0ov?=
 =?utf-8?B?RnVxaFFsU2h3Y3BPb0FXeTA3VFlnY09xR0lVZE1hdWJndzBZVkZpdjVtSzQ1?=
 =?utf-8?B?dUVlTXNOR2w0M3VESUtFbFdqc1I5SHYxOUYwUHB5N2g1NEpkR0FFT1gvUVRw?=
 =?utf-8?B?M3psY2hUbFlkUkZvQmwyVEk1VjcvOFhXTE9mV3lYbWIxdzJHbFNIUFhQeE9q?=
 =?utf-8?B?KzNnTTF4ZWNjZGJiMDdvUXVzL2s2NlBLSmpqcklGQjdtVzBPSU1zaE9GZ3pz?=
 =?utf-8?B?RlpDOFkxZk00bHBmazREc0Y3OEdadk85RVQ2cHJjWmZ4c0pPU1dWTlhOanZV?=
 =?utf-8?B?UGNPczlUQ3FqUlEvTWlVdlBEaU9ndHJrNUJFT0N6dEd4L2kzejROZ3pXblZK?=
 =?utf-8?B?TkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ujHxBIKFR5BEFIwvU66wYCDYhToLnNHtIedgQULMTHeDK40OSShIudthpzPCDGVl0XUT4RlkBabcwuPzrS++3E1B5ojqO01B4MUJyy/o0Oj91I9EE6DkKOKPWyHmfP1bzRtxPkNn6TIfp8lJIXd7UcTY2XkyK7LQFmQibtGKTrBQUAuZ+uMfZbllcGSEzNMlkO/gtFIz9s59ITz4mSQi3HYs4mW1q8cHY1B1jBKOmrb0fxqDYcbJCruIVAiF9vu2sE616995DAqublRn/2t85m7yPmh8Cx3HPNh4idkCJCwuRBClKkBoCvX6TGv3w8Rh/iMHH06oZuQ+cBsXLTVwDYxyUsKqew0WCl3ASkOVbvq84RZYxpmopnFSiZtt7x2qzRga88kq4s78oZ1OaW2HhMgjmnD//qxZYPF85jaoHlUOH3YXsm5tFnqenasrnlq7ar5W2L+IchMIBduhBHF3G/d1ZRpKgekpnbC/CB7XujTgbLVfpDEQGz5ObFAfOLGPlJecWxe6MbYDrgEBQTeUV4hMxmmMiz3iJPBNbbeGPoir9z9sSBFyj58rYbcoErw7MFLlR1J4LEYMxGedc0nIXhv7WlqLng0ruCz9ch5AEis=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be7c7e60-e0f0-446b-c476-08dd93df6cf5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 18:36:37.3604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: glCv1GUhTBYPGEhLxwvlZWahPE6Pd+JVdhWPaSCbczTGMOrgA/+FOCfbsuoSpLQdTTjoRsnYgVRUFUv8c+bAWjwPdwV/WodqMkIh3hOO2N8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4743
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_08,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505070000 definitions=main-2505150183
X-Proofpoint-ORIG-GUID: bhzZ9W00BiaIYxMlF5jlD7TqWkIOOi6B
X-Authority-Analysis: v=2.4 cv=f+RIBPyM c=1 sm=1 tr=0 ts=6826343a b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=P-IC7800AAAA:8 a=pGLkceISAAAA:8 a=BUA9_GdV-2484w0fnq8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22 cc=ntf awl=host:14694
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE4NCBTYWx0ZWRfX4JP73HH8ehq3 YuXB48v6HeCgQFgQXpN4z8efGDXDBcy5hRWKLSWe5B8kJvjh5wvclsGHnuUTzXWNlLLwAs8ocKO lvAALRb8T4b8kIzNZL0DRGFb2AuSEG9QkkoYPyr2nXKmszeH2f3aaiWOmb1ZuY6cTgK/z7h2VWH
 26Ir1bVPZim0hXG/jRWr+t6Q3DEZPzD5sd1k1sNGS2vg+EE9+ChUmt7DJ8QXVkPJNU9EKqb1n5f N+qh6CK8Zw6o3c8wO3Y+7vT/Xc5moGZh1b/PnnEEwpbtZzBpi9r0Vg98TgDENT8V/TZX7Dpj0Xz EGyhusA17XzKY8CovUzg+EXi1BfJ1lz2e1Xl4eTgd3UsnHUYaLUu1RAnxWCGa6BZCNMaG+86+Ir
 X/Orts8jI4w3Eyg2WEEypc7iDf1URNj/i0fxgM+s51yNAfpOdMJOwCLU4bODfhWkULar5gSr
X-Proofpoint-GUID: bhzZ9W00BiaIYxMlF5jlD7TqWkIOOi6B

One thing I wanted to emphasise - shouldn't we invoke
khugepaged_enter_vma() for VMAs we set VM_HUGEPAGE for?

I note in __mmap_new_vma() we do so for non-anon VMAs _prior_ to invoking
vma_set_thp_policy().

I _really_ hate putting in conditional logic like this for specific
cases. Feels very hacky.

On Thu, May 15, 2025 at 05:47:34PM +0100, Usama Arif wrote:
>
>
> On 15/05/2025 17:06, Lorenzo Stoakes wrote:
>
> >> Its doing the same as KSM as suggested by David. Does KSM break these tests?
> >> Is there some specific test you can point to that I can run that is breaking
> >> with this patch and not without it?
> >
> > They don't build, at all. I explain how you can attempt a build below.
> >
>
> Ah yes, I initially thought by break you meant they were failing. I saw that,
> will fix it.
>
> > And no, KSM doesn't break the tests, because steps were taken to make them
> > not break the tests :) I mean it's really easy - it's just adding some
> > trivial stubs.
> >
>
> Yes, will do Thanks!

Thanks.

>
> > If you need help with it just ping me in whatever way helps and I can help!
> >
> > It's understandable as it's not necessarily clear this is a thing (maybe we
> > need self tests to build it, but that might break CI setups so unclear).
> >
> > The merging is much more important!

To re-emphasise ^ the merging is key - I will unfortunately have to NACK
any series that breaks it. So this is an absolute requirement here.

> >
> >>
> >>
> >>> I really feel this series needs to be an RFC until we can get some
> >>> consensus on how to approach this.
> >>
> >> There was consensus in https://lore.kernel.org/all/97702ff0-fc50-4779-bfa8-83dc42352db1@redhat.com/
> >
> > I disagree with this asssessment, that doesn't look like consensus at all,
> > I think at least this is a very contentious or at least _complicated_ topic
> > that we need to really dig into.
> >
> > So in my view - it's this kind of situation that warrants an RFC until
> > there's some stabilisation and agreement on a way forward.
> >
>
> Sure will change next revision to RFC, unless hopefully maybe we can
> get a consensus in this revision :)

Thanks!

>
> >>
> >>>
> >>> On Thu, May 15, 2025 at 02:33:30PM +0100, Usama Arif wrote:
> >>>> This is set via the new PR_SET_THP_POLICY prctl.
> >>>
> >>> What is?
> >>>
> >>> You're making very major changes here, including adding a new flag to
> >>> mm_struct (!!) and the explanation/justification for this is missing.
> >>>
> >>
> >> I have added the justification in your reply to the coverletter.
> >
> > As stated there, you've not explained why alternatives are unworkable, I
> > think we need this!
> >
> > Sort of:
> >
> > 1. Why not cgroups? blah blah blah
> > 2. Why not process_madvise()? blah blah blah
> > 3. Why not bpf? blah blah blah
> > 4. Why not <something I've not thought of>? blah blah blah
> >
>
> I will add this in the next cover letter.

Thanks

>
>
> >>
> >>>> This will set the MMF2_THP_VMA_DEFAULT_HUGE process flag
> >>>> which changes the default of new VMAs to be VM_HUGEPAGE. The
> >>>> call also modifies all existing VMAs that are not VM_NOHUGEPAGE
> >>>> to be VM_HUGEPAGE. The policy is inherited during fork+exec.
> >>>
> >>> So you can only set this flag?
> >>>
> >>
> >> ??
> >
> > This patch is only allowing the setting of this flag. I am asking 'so you
> > can only set this flag?'
> >
> > To which it appears the answer is, yes I think :)
> >
> > An improved cover letter could say something like:
> >
> > "
> > Here we implement the first flag intended to allow the _overriding_ of huge
> > page policy to ensure that, when
> > /sys/kernel/mm/transparent_hugepage/enabled is set to madvise, we are able
> > to maintain fine-grained control of individual processes, including any
> > fork/exec'd, by setting this flag.
> >
> > In subsequent commits, we intend to permit further such control.
> > "
> >
> >>
> >>>>
> >>>> This allows systems where the global policy is set to "madvise"
> >>>> to effectively have THPs always for the process. In an environment
> >>>> where different types of workloads are stacked on the same machine,
> >>>> this will allow workloads that benefit from always having hugepages
> >>>> to do so, without regressing those that don't.
> >>>
> >>> Again, this explanation really makes no sense at all to me, I don't really
> >>> know what you mean, you're not going into what you're doing in this change,
> >>> this is just a very unclear commit message.
> >>>
> >>
> >> I hope this is answered in my reply to your coverletter.
> >
> > You still need to improve the cover letter here I think, see above for a
> > suggestion!
> >
>
> Sure, will do in the next revision, Thanks!

Thanks

> >>
> >>>>
> >>>> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> >>>> ---
> >>>>  include/linux/huge_mm.h                       |  3 ++
> >>>>  include/linux/mm_types.h                      | 11 +++++++
> >>>>  include/uapi/linux/prctl.h                    |  4 +++
> >>>>  kernel/fork.c                                 |  1 +
> >>>>  kernel/sys.c                                  | 21 ++++++++++++
> >>>>  mm/huge_memory.c                              | 32 +++++++++++++++++++
> >>>>  mm/vma.c                                      |  2 ++
> >>>>  tools/include/uapi/linux/prctl.h              |  4 +++
> >>>>  .../trace/beauty/include/uapi/linux/prctl.h   |  4 +++
> >>>>  9 files changed, 82 insertions(+)
> >>>>
> >>>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> >>>> index 2f190c90192d..e652ad9ddbbd 100644
> >>>> --- a/include/linux/huge_mm.h
> >>>> +++ b/include/linux/huge_mm.h
> >>>> @@ -260,6 +260,9 @@ static inline unsigned long thp_vma_suitable_orders(struct vm_area_struct *vma,
> >>>>  	return orders;
> >>>>  }
> >>>>
> >>>> +void vma_set_thp_policy(struct vm_area_struct *vma);
> >>>
> >>> This is a VMA-specific function but you're putting it in huge_mm.h? Why
> >>> can't
> >> this be in vma.h or vma.c?
> >>>
> >>
> >> Sure can move it there.
> >>
> >>>> +void process_vmas_thp_default_huge(struct mm_struct *mm);
> >>>
> >>> 'vmas' is redundant here.
> >>>
> >>
> >> Sure.
> >>>> +
> >>>>  unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
> >>>>  					 unsigned long vm_flags,
> >>>>  					 unsigned long tva_flags,
> >>>> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> >>>> index e76bade9ebb1..2fe93965e761 100644
> >>>> --- a/include/linux/mm_types.h
> >>>> +++ b/include/linux/mm_types.h
> >>>> @@ -1066,6 +1066,7 @@ struct mm_struct {
> >>>>  		mm_context_t context;
> >>>>
> >>>>  		unsigned long flags; /* Must use atomic bitops to access */
> >>>> +		unsigned long flags2;
> >>>
> >>>
> >>> Ugh, god really??
> >>>
> >>> I really am not a fan of adding flags2 just to add a prctl() feature like
> >>> this. This is crazy.
> >>>
> >>> Also this is a TERRIBLE name. I mean, no please PLEASE no.
> >>>
> >>> Do we really have absolutely no choice but to add a new flags field here?
> >>>
> >>> It again doesn't help that you don't mention nor even try to justify this
> >>> in the commit message or cover letter.
> >>>
> >>
> >> And again, I hope my reply to your email has given you the justification.
> >
> > No :) I understood why you did this though of course.
> >
> >>
> >>> If this is a 32-bit kernel vs. 64-bit kernel thing so we 'ran out of bits',
> >>> let's just go make this flags field 64-bit on 32-bit kernels.
> >>>
> >>> I mean - I'm kind of insisting we do that to be honest. Because I really
> >>> don't like this.
> >>
> >>
> >> If the maintainers want this, I will make it a 64 bit only feature. We
> >> are only using it for 64 bit servers. But it will probably mean ifdef
> >> config 64 bit in a lot of places.
> >
> > I'm going to presume you are including me in this category rather than
> > implying that you are deferring only to others :)
> >
>
> Yes ofcourse! I mean all maintainers :)
>
> And hopefully everyone else as well :)
>
> > So, there's another option:
> >
> > Have a prerequisite series that makes mm_struct->flags 64-bit on 32-bit
> > kernels, which solves this problem everywhere and avoids us wasting a bunch
> > of memory for a very specific usecase, splitting flag state across 2 fields
> > (which are no longer atomic as a whole of course), adding confusion,
> > possibly subtly breaking anywhere that assumes mm->flags completely
> > describes mm-granularity flag state etc.
> >
>
> This is probably a very basic question, but by make mm_struct->flags 64-bit on 32-bit
> do you mean convert flags to unsigned long long when !CONIFG_64BIT?

Yes. This would be a worthwhile project in its own right.

I will be changing vma->vm_flags in the same way soon.

>
> > The RoI here is not looking good, otherwise.
> >
> >>
> >>>
> >>> Also if we _HAVE_ to have this, shouldn't we duplicate that comment about
> >>> atomic bitops?...
> >>>
> >>
> >> Sure
> >>
> >>>>
> >>>>  #ifdef CONFIG_AIO
> >>>>  		spinlock_t			ioctx_lock;
> >>>> @@ -1744,6 +1745,11 @@ enum {
> >>>>  				 MMF_DISABLE_THP_MASK | MMF_HAS_MDWE_MASK |\
> >>>>  				 MMF_VM_MERGE_ANY_MASK | MMF_TOPDOWN_MASK)
> >>>>
> >>>> +#define MMF2_THP_VMA_DEFAULT_HUGE		0
> >>>
> >>> I thought the whole idea was to move away from explicitly refrencing 'THP'
> >>> in a future where large folios are implicit and now we're saying 'THP'.
> >>>
> >>> Anyway the 'VMA' is totally redundant here.
> >>>
> >>
> >> Sure, I can remove VMA.
> >> I see THP everywhere in the kernel code.
> >> Its mentioned 108 times in transhuge.rst alone :)
> >> If you have any suggestion to rename this flag, happy to take it :)
> >
> > Yeah I mean it's a mess man, and it's not your fault... Again naming is
> > hard, I put a suggestion in reply to cover letter anyway...
> >
> >>
> >>>> +#define MMF2_THP_VMA_DEFAULT_HUGE_MASK		(1 << MMF2_THP_VMA_DEFAULT_HUGE)
> >>>
> >>> Do we really need explicit trivial mask declarations like this?
> >>>
> >>
> >> I have followed the convention that has existed in this file, please see below
> >> links :)
> >> https://elixir.bootlin.com/linux/v6.14.6/source/include/linux/mm_types.h#L1645
> >> https://elixir.bootlin.com/linux/v6.14.6/source/include/linux/mm_types.h#L1623
> >> https://elixir.bootlin.com/linux/v6.14.6/source/include/linux/mm_types.h#L1603
> >> https://elixir.bootlin.com/linux/v6.14.6/source/include/linux/mm_types.h#L1582
> >
> > Ack, yuck but ack.
> >
> >>
> >>
> >>>> +
> >>>> +#define MMF2_INIT_MASK		(MMF2_THP_VMA_DEFAULT_HUGE_MASK)
> >>>
> >>>> +
> >>>>  static inline unsigned long mmf_init_flags(unsigned long flags)
> >>>>  {
> >>>>  	if (flags & (1UL << MMF_HAS_MDWE_NO_INHERIT))
> >>>> @@ -1752,4 +1758,9 @@ static inline unsigned long mmf_init_flags(unsigned long flags)
> >>>>  	return flags & MMF_INIT_MASK;
> >>>>  }
> >>>>
> >>>> +static inline unsigned long mmf2_init_flags(unsigned long flags)
> >>>> +{
> >>>> +	return flags & MMF2_INIT_MASK;
> >>>> +}
> >>>> +
> >>>>  #endif /* _LINUX_MM_TYPES_H */
> >>>> diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
> >>>> index 15c18ef4eb11..325c72f40a93 100644
> >>>> --- a/include/uapi/linux/prctl.h
> >>>> +++ b/include/uapi/linux/prctl.h
> >>>> @@ -364,4 +364,8 @@ struct prctl_mm_map {
> >>>>  # define PR_TIMER_CREATE_RESTORE_IDS_ON		1
> >>>>  # define PR_TIMER_CREATE_RESTORE_IDS_GET	2
> >>>>
> >>>> +#define PR_SET_THP_POLICY		78
> >>>> +#define PR_GET_THP_POLICY		79
> >>>> +#define PR_THP_POLICY_DEFAULT_HUGE	0
> >>>> +
> >>>>  #endif /* _LINUX_PRCTL_H */
> >>>> diff --git a/kernel/fork.c b/kernel/fork.c
> >>>> index 9e4616dacd82..6e5f4a8869dc 100644
> >>>> --- a/kernel/fork.c
> >>>> +++ b/kernel/fork.c
> >>>> @@ -1054,6 +1054,7 @@ static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
> >>>>
> >>>>  	if (current->mm) {
> >>>>  		mm->flags = mmf_init_flags(current->mm->flags);
> >>>> +		mm->flags2 = mmf2_init_flags(current->mm->flags2);
> >>>>  		mm->def_flags = current->mm->def_flags & VM_INIT_DEF_MASK;
> >>>>  	} else {
> >>>>  		mm->flags = default_dump_filter;
> >>>> diff --git a/kernel/sys.c b/kernel/sys.c
> >>>> index c434968e9f5d..1115f258f253 100644
> >>>> --- a/kernel/sys.c
> >>>> +++ b/kernel/sys.c
> >>>> @@ -2658,6 +2658,27 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
> >>>>  			clear_bit(MMF_DISABLE_THP, &me->mm->flags);
> >>>>  		mmap_write_unlock(me->mm);
> >>>>  		break;
> >>>> +	case PR_GET_THP_POLICY:
> >>>> +		if (arg2 || arg3 || arg4 || arg5)
> >>>> +			return -EINVAL;
> >>>> +		if (!!test_bit(MMF2_THP_VMA_DEFAULT_HUGE, &me->mm->flags2))
> >>>
> >>> I really don't think we need the !!? Do we?
> >>
> >> I have followed the convention that has existed in this file already,
> >> please see:
> >> https://elixir.bootlin.com/linux/v6.14.6/source/kernel/sys.c#L2644
> >
> > OK, but please don't, I don't see why this is necessary. if (truthy) is
> > fine.
> >
> > Unless somebody has a really good reason why this is necessary, it's just
> > ugly ceremony.
> >
>
> Agreed :)

Thanks

>
> >>
> >>>
> >>> Shouldn't we lock the mm when we do this no? Can't somebody change this?
> >>>
> >>
> >> It wasn't locked in PR_GET_THP_DISABLE
> >> https://elixir.bootlin.com/linux/v6.14.6/source/kernel/sys.c#L2644
> >>
> >> I can acquire do mmap_write_lock_killable the same as PR_SET_THP_POLICY
> >> in the next series.
> >>
> >> I can also add the lock in PR_GET_THP_DISABLE.
> >
> > Well, the issue I guess is... if the flags field is atomic, and we know
> > over this call maybe we can rely on mm sticking around, then we probalby
> > don't need an mmap lock actually.
> >
> >>
> >>>> +			error = PR_THP_POLICY_DEFAULT_HUGE;
> >
> > Wait, error = PR_THP_POLICY_DEFAULT_HUGE? Is this the convention for
> > returning here? :)
>
> I see a few of the PR_GET_.. setting the return value. I hope I didnt
> misinterpret that.

Yeah I thought it might be the case. I reemphasise my dislike of prctl().

>
> >
> >>>> +		break;
> >>>> +	case PR_SET_THP_POLICY:
> >>>> +		if (arg3 || arg4 || arg5)
> >>>> +			return -EINVAL;
> >>>> +		if (mmap_write_lock_killable(me->mm))
> >>>> +			return -EINTR;
> >>>> +		switch (arg2) {
> >>>> +		case PR_THP_POLICY_DEFAULT_HUGE:
> >>>> +			set_bit(MMF2_THP_VMA_DEFAULT_HUGE, &me->mm->flags2);
> >>>> +			process_vmas_thp_default_huge(me->mm);
> >>>> +			break;
> >>>> +		default:
> >>>> +			return -EINVAL;
> >
> > Oh I just noticed - this is really broken - you're not unlocking the mmap()
> > here on error... :) you definitely need to fix this.
> >
>
> Ah yes, will do Thanks!

Thanks

>
> >>>> +		}
> >>>> +		mmap_write_unlock(me->mm);
> >>>> +		break;
> >>>>  	case PR_MPX_ENABLE_MANAGEMENT:
> >>>>  	case PR_MPX_DISABLE_MANAGEMENT:
> >>>>  		/* No longer implemented: */
> >>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> >>>> index 2780a12b25f0..64f66d5295e8 100644
> >>>> --- a/mm/huge_memory.c
> >>>> +++ b/mm/huge_memory.c
> >>>> @@ -98,6 +98,38 @@ static inline bool file_thp_enabled(struct vm_area_struct *vma)
> >>>>  	return !inode_is_open_for_write(inode) && S_ISREG(inode->i_mode);
> >>>>  }
> >>>>
> >>>> +void vma_set_thp_policy(struct vm_area_struct *vma)
> >>>> +{
> >>>> +	struct mm_struct *mm = vma->vm_mm;
> >>>> +
> >>>> +	if (test_bit(MMF2_THP_VMA_DEFAULT_HUGE, &mm->flags2))
> >>>> +		vm_flags_set(vma, VM_HUGEPAGE);
> >>>> +}
> >>>> +
> >>>> +static void vmas_thp_default_huge(struct mm_struct *mm)
> >>>> +{
> >>>> +	struct vm_area_struct *vma;
> >>>> +	unsigned long vm_flags;
> >>>> +
> >>>> +	VMA_ITERATOR(vmi, mm, 0);
> >>>
> >>> This is a declaration, it should be grouped with declarations...
> >>>
> >>
> >> Sure, will make the change in next version.
> >>
> >> Unfortunately checkpatch didn't complain.
> >
> > Checkpatch actually complains the other way :P it doesn't understand
> > macros.
> >
> > So you'll start getting a warning here, which you can ignore. It sucks, but
> > there we go. Making checkpatch.pl understand that would be a pain, probs.
> >
> >>
> >>>> +	for_each_vma(vmi, vma) {
> >>>> +		vm_flags = vma->vm_flags;
> >>>> +		if (vm_flags & VM_NOHUGEPAGE)
> >>>> +			continue;
> >>>
> >>> Literally no point in you putting vm_flags as a separate variable here.
> >>>
> >>
> >> Sure, will make the change in next version.
> >
> > Thanks!
> >
> >>
> >>> So if you're not overriding VM_NOHUGEPAGE, the whole point of this exercise
> >>> is to override global 'never'?
> >>>
> >>
> >> Again, I am not overriding never.
> >>
> >> hugepage_global_always and hugepage_global_enabled will evaluate to false
> >> and you will not get a hugepage.
> >
> > Yeah, again ack, but I kind of hate that we set VM_HUGEPAGE everywhere even
> > if the policy is never.
> >
> > And we now get into realms of:
> >
> > 'Hey I set prctl() to make everything huge pages, and PR_GET_THP_POLICY
> > says I've set that, but nothing is huge? BUG???'
> >
> > Of course then you get into - if somebody sets it to never, do we go around
> > and remove VM_HUGEPAGE and this MMF_ flag?
> >
> >>
> >>
> >>> I'm really concerned about this.
> >>>
> >>>> +		vm_flags_set(vma, VM_HUGEPAGE);
> >>>> +	}
> >>>> +}
> >>>
> >>> Do we have an mmap write lock established here? Can you confirm that? Also
> >>> you should add an assert for that here.
> >>>
> >>
> >> Yes I do, its only called in PR_SET_THP_POLICY where mmap_write lock was taken.
> >> I can add an assert if it helps.
> >
> > It not only helps, it's utterly critical :)
> >
> > 'It's only called in xxx()' is famous last words for a programmer, because
> > later somebody (maybe even your good self) calls it from somewhere else
> > and... we've all been there...
> >
>
> Thanks! Will do.

Thanks.

> >>
> >>>> +
> >>>> +void process_vmas_thp_default_huge(struct mm_struct *mm)
> >>>> +{
> >>>> +	if (test_bit(MMF2_THP_VMA_DEFAULT_HUGE, &mm->flags2))
> >>>> +		return;
> >>>> +
> >>>> +	set_bit(MMF2_THP_VMA_DEFAULT_HUGE, &mm->flags2);
> >>>> +	vmas_thp_default_huge(mm);
> >>>> +}
> >>>> +
> >>>> +
> >>>>  unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
> >>>>  					 unsigned long vm_flags,
> >>>>  					 unsigned long tva_flags,
> >>>> diff --git a/mm/vma.c b/mm/vma.c
> >>>> index 1f2634b29568..101b19c96803 100644
> >>>> --- a/mm/vma.c
> >>>> +++ b/mm/vma.c
> >>>> @@ -2476,6 +2476,7 @@ static int __mmap_new_vma(struct mmap_state *map, struct vm_area_struct **vmap)
> >>>>  	if (!vma_is_anonymous(vma))
> >>>>  		khugepaged_enter_vma(vma, map->flags);
> >>>>  	ksm_add_vma(vma);
> >>>> +	vma_set_thp_policy(vma);
> >>>
> >>> You're breaking VMA merging completely by doing this here...
> >>>
> >>> Now I can map one VMA with this policy set, then map another immediately
> >>> next to it and - oops - no merge, ever, because the VM_HUGEPAGE flag is not
> >>> set in the new VMA on merge attempt.
> >>>
> >>> I realise KSM is just as broken (grr) but this doesn't justify us
> >>> completely breaking VMA merging here.
> >>
> >> I think this answers it. Its doing the same as KSM.
> >
> > Yes, but as I said there, it's not acceptable, at all.
> >
> > You're making it so litearlly VMA merging _does not happen at all_. That's
> > unacceptable and might even break some workloads.
> >
> > You'll certainly cause very big kernel metadata usage.
> >
> > Consider:
> >
> > |-----------------------------|..................|
> > | some VMA flags, VM_HUGEPAGE | proposed new VMA |
> > |-----------------------------|..................|
> >
> > Now, because you set VM_HUGEPAGE _after any merge is attempted_, this will
> > _always_ be fragmented, forever.
> >
>
> So if __mmap_new_vma and do_brk_flags are called after merge attempt,
> is it possible to vma_set_thp_policy (or do something similar) before
> the merge attempt?
>
> Actually I just read your reply to the next block, so I think its ok?
> Added more to the next block.
>
> I dont have any preference on where its put, so happy with putting this
> earlier.

Yeah, you can just do it earlier. But you maybe should just set the flag in
the appropriate field rather than using the set flags helper.

>
>
> > That's just not... acceptable.
> >
> > The fact KSM is broken this way doesn't make that OK.
> >
> > Especially on brk(), which now will _always_ allocate new VMAs for every
> > brk() expansion which doesn't seem very efficient.
> >
> > It may also majorly degrade performance.
> >
> > That makes me think we need some perf testing for this ideally...
> >
> >>
> >>>
> >>> You need to set earlier than this. Then of course a driver might decide to
> >>> override this, so maybe then we need to override that.
> >>>
> >>> But then we're getting into realms of changing fundamental VMA code _just
> >>> for this feature_.
> >>>
> >>> Again I'm iffy about this. Very.
> >>>
> >>> Also you've broken the VMA userland tests here:
> >>>
> >>> $ cd tools/testing/vma
> >>> $ make
> >>> ...
> >>> In file included from vma.c:33:
> >>> ../../../mm/vma.c: In function ‘__mmap_new_vma’:
> >>> ../../../mm/vma.c:2486:9: error: implicit declaration of function ‘vma_set_thp_policy’; did you mean ‘vma_dup_policy’? [-Wimplicit-function-declaration]
> >>>  2486 |         vma_set_thp_policy(vma);
> >>>       |         ^~~~~~~~~~~~~~~~~~
> >>>       |         vma_dup_policy
> >>> make: *** [<builtin>: vma.o] Error 1
> >>>
> >>> You need to create stubs accordingly.
> >>>
> >>
> >> Thanks will do.
> >
> > Thanks!
> >
> >>
> >>>>  	*vmap = vma;
> >>>>  	return 0;
> >>>>
> >>>> @@ -2705,6 +2706,7 @@ int do_brk_flags(struct vma_iterator *vmi, struct vm_area_struct *vma,
> >>>>  	mm->map_count++;
> >>>>  	validate_mm(mm);
> >>>>  	ksm_add_vma(vma);
> >>>> +	vma_set_thp_policy(vma);
> >>>
> >>> You're breaking merging again... This is quite a bad case too as now you'll
> >>> have totally fragmented brk VMAs no?
> >>>
> >>
> >> Again doing it the same as KSM.
> >
> > That doesn't make it ok. Just because KSM is broken doesn't make this ok. I
> > mean grr at KSM :) I'm going to look into that and see about
> > investigating/fixing that behaviour.
> >
> > obviously I can't accept anything that will fundamentally break VMA
> > merging.
> >
>
> Ofcourse!
>
> > The answer really is to do this earlier, but you risk a driver overriding
> > it, but that's OK I think (I don't even think any in-tree ones do actually
> > _anywhere_ - and yes I was literally reading through _every single_ .mmap()
> > callback lately because I am quite obviously insane ;)
> >
> > Again I can help with this.
> >
>
> Appreaciate it!
>
> I am actually not familiar with the merge code. I will try and have a look,
> but if you could give a pointer to the file:line after which its not acceptable
> to have and I can move vma_set_thp_policy to before it or try and do something
> similar to that.

Ack.

I wrote the latest merge and mmap() code so am well placed on this :>)

But I don't think we should use vma_set_thp_policy() in these places, we
should just set the flag, to avoid trying to do a write lock etc. etc.,
plus we want to set the flag in a place that's not a VMA yet in both cases.

So we'd need something like in do_mmap():

+	vm_flags |= mm_implied_vma_flags(mm);
	addr = mmap_region(file, addr, len, vm_flags, pgoff, uf);

Where mm_implied_vma_flags() reads the MMF flags and sees if any imply VMA
flags.

But we have something for that already don't we? mm->def_flags.

Can't we use that actually? That should work for mmap too?

>
> >>
> >>> We can't have it implemented this way.
> >>>
> >>>>  out:
> >>>>  	perf_event_mmap(vma);
> >>>>  	mm->total_vm += len >> PAGE_SHIFT;
> >>>> diff --git a/tools/include/uapi/linux/prctl.h b/tools/include/uapi/linux/prctl.h
> >>>> index 35791791a879..f5945ebfe3f2 100644
> >>>> --- a/tools/include/uapi/linux/prctl.h
> >>>> +++ b/tools/include/uapi/linux/prctl.h
> >>>> @@ -328,4 +328,8 @@ struct prctl_mm_map {
> >>>>  # define PR_PPC_DEXCR_CTRL_CLEAR_ONEXEC	0x10 /* Clear the aspect on exec */
> >>>>  # define PR_PPC_DEXCR_CTRL_MASK		0x1f
> >>>>
> >>>> +#define PR_SET_THP_POLICY		78
> >>>> +#define PR_GET_THP_POLICY		79
> >>>> +#define PR_THP_POLICY_DEFAULT_HUGE	0
> >>>> +
> >>>>  #endif /* _LINUX_PRCTL_H */
> >>>> diff --git a/tools/perf/trace/beauty/include/uapi/linux/prctl.h b/tools/perf/trace/beauty/include/uapi/linux/prctl.h
> >>>> index 15c18ef4eb11..325c72f40a93 100644
> >>>> --- a/tools/perf/trace/beauty/include/uapi/linux/prctl.h
> >>>> +++ b/tools/perf/trace/beauty/include/uapi/linux/prctl.h
> >>>> @@ -364,4 +364,8 @@ struct prctl_mm_map {
> >>>>  # define PR_TIMER_CREATE_RESTORE_IDS_ON		1
> >>>>  # define PR_TIMER_CREATE_RESTORE_IDS_GET	2
> >>>>
> >>>> +#define PR_SET_THP_POLICY		78
> >>>> +#define PR_GET_THP_POLICY		79
> >>>> +#define PR_THP_POLICY_DEFAULT_HUGE	0
> >>>> +
> >>>>  #endif /* _LINUX_PRCTL_H */
> >>>> --
> >>>> 2.47.1
> >>>>
> >>
>
