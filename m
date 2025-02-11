Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629691F4299
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739270103; cv=fail; b=uwp/ztu4qlXcfDY8nRDWo5QUxNWN67zH/e+8ini+zETuUx3z1buQty0aNJklwmZMgUJbmwbxTeSTjCaBSlHL3/uhmVCDTkB2LM5U7H+FLEu9z4B146fNwr0sSyqAPt+jW587rQ5joDjbanlCKfIvrfU/0zUFL/KzWpr3dmZ9Krg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739270103; c=relaxed/simple;
	bh=n2A5SECcGLZ/6+q55Kdr1TR2Vr1IXSrhv3i12fN+CXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=epuXw7piE2ugLQNtBCLBNqLj99cfN8Qtn27aZjiOXw4ZWPcbNUKezikRwSglB0t0hXvwhH7sVEq7h6p6eJ3zZV4hlUEOXJ/yrn1znVvMnMfUQU8YDOil1CQZqKtkReD5ECO+orUN6nPbSjwp1tRaBPBoWfZJLwYf0zZcaYpgKTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=f1/1lCpi; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nh2OWpNn; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="f1/1lCpi";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nh2OWpNn"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B7toi7006038;
	Tue, 11 Feb 2025 10:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=rUVGhtcbdm9FYd/kKN
	/gW/wvDpEyDnoGC+qPX8/5POI=; b=f1/1lCpie6XbMIuD6BxDlOjv7oOllNF3tX
	eFIK5pMdGk+ACAxy1PmioWMfbatZCr1qjDva3T1SccfKfkuWJmZePDrOIPyB6zJZ
	nHI/SXO55lrZ0nxPHcseWaMwm/UzUGaspXiH4V/uSTh1TtoNRMyVUZII+ixzDHTR
	bjz9VtqFKyL9716iXeTVeXJXjR3A6U4VK0qUupntdWKWs7g80QU+ET3gsBhdXHt5
	XKj/y04HrPgZYrULVRLHXJL3BCksoTn3Xq4a/+qD2q31mhdULzZmk0AzieIcJgYK
	81nIZEQji5P/xA47268s73whTvbf/ZheNJHYNx1dBH04lYTqa/Sw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44p0q2cuv7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Feb 2025 10:34:35 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51BAUmDC026942;
	Tue, 11 Feb 2025 10:34:34 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44nwq8k7u7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Feb 2025 10:34:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uljlKp01uSmIRFVDIdZH2EVVoUGHhZVpwPNYJ0iQzeB2NVq2C4VobBtTjUXiin/a6xO5DUliDsyF+CckVy9ufnaqivYV43o4NvUulGT4EZQ8fKBo6j8bWXjTNN/O3SFm2oioXHEx2KpLAtOrOXrGjzR1BJdRDNJu7GkWvTjMBAVoNFtjmmdw4GXmiy/GvXhTisKJpBqtnGw8dtNzZdYMiiZBMjU7bdT3UoeJCdQGfyHX1bWYUQ1b4gGNwyNRHCP+u1WbyQi7VtzL5RnaBOavXezrCzRDnEkcfXeG18o93miNHsiud7kXlN/eJrZVMBz8/1q3L4WuCKLBwXdKvrBEHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rUVGhtcbdm9FYd/kKN/gW/wvDpEyDnoGC+qPX8/5POI=;
 b=quuU5UixmWudvSoTqs+Y0S88tEVXrSi3SpsMPjo34Nt9mhCHFdxZdIX12T/gRHjWcqAqIwpQlwXtMevJe9okC9vn/30C2ULN1IeebFDUeduU1vTBF0kP3kgg3l08PrdsoW0JR3BMV3z+1mwg1qKPW0MpFRfxHykC7nz8xqwPyuSSHoght7b+c4qpc88HEs6H+9o4M2LatS5goY+JPT//GqQnc/vsevuD9/PFTzgW/HltL8/DIxwRF7lLOMqjIhlF9g3yn22Jyr10PqB0NY0xnXJCjKza0N4oVyjtu40NZAmYrYylippqVs38OfmnHTgaNo7ojTk9/kNTqvFMRprKtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rUVGhtcbdm9FYd/kKN/gW/wvDpEyDnoGC+qPX8/5POI=;
 b=nh2OWpNn7KUEDhM7l3m1nqpHFiiJoEyBW8XfCi8PME2fiV0n7FvpiS7NxenRhSD5CYT6CbYNDmeUpbC6LXSb6Gl8afUSTcpOcS+JtMYMsPVWvR7sSEqiRCNTsQc8HjmrPVIhXGdpfKHnZoYQq74IewyJz8WXoXLHp/zLjX7HEz8=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by SJ0PR10MB5549.namprd10.prod.outlook.com (2603:10b6:a03:3d8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 10:34:31 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8398.025; Tue, 11 Feb 2025
 10:34:31 +0000
Date: Tue, 11 Feb 2025 10:34:19 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: "Lai, Yi" <yi1.lai@linux.intel.com>
Cc: SeongJae Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        David Hildenbrand <david@redhat.com>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, yi1.lai@intel.com,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 4/4] mm/madvise: remove redundant mmap_lock operations
 from process_madvise()
Message-ID: <794c4d29-8a75-48f2-a1d8-a519d0243290@lucifer.local>
References: <20250206061517.2958-1-sj@kernel.org>
 <20250206061517.2958-5-sj@kernel.org>
 <Z6rgiVp7221r4JZ5@ly-workstation>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6rgiVp7221r4JZ5@ly-workstation>
X-ClientProxiedBy: LO2P265CA0246.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::18) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|SJ0PR10MB5549:EE_
X-MS-Office365-Filtering-Correlation-Id: d4b5a88a-d83b-4c5a-31fd-08dd4a87ab52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cEykfTbAnNztYpzZJNNcF4Zrc54SZ+UAJrGh2a+0QnOfmmHO5wSa+rQCiduL?=
 =?us-ascii?Q?hZo9Wv6SnFouluJeuB64chP4tpWTWJxSTUP8QI7kiuGXyuM6zXzHIN1esIZU?=
 =?us-ascii?Q?mKvwpjcFYbfX68Ct6RD0l1M/5e76u0b87us44qqKccpwd5W2gojK3q4bzf/F?=
 =?us-ascii?Q?+QyPcVsIID9MkNufEtBS0BNOzQo2KMRjHdqjZMAm7esp+ACuamzPOiZSwXed?=
 =?us-ascii?Q?5/RgpsoKOMLe1Mo3JNOmho6QSZt/jGU/Js3+6kqj+zKGznUp8fDp7xIf55i4?=
 =?us-ascii?Q?zPyaHPUMrePdxJqGVDQtpN4KLhUR+dyJja81Lv1PC9LXTLJOrSVitQI8qaaC?=
 =?us-ascii?Q?bU5QwwqTK9gUt7m05l3n7jVC/m1gXSC473xV8V5qR+zEfX1/L0D9fe3azUJ+?=
 =?us-ascii?Q?O/sN1JxdiBg90IO/jhKoesdAqE4tEacm4n9LdOc/7iWH6mi09gsvuB86F76g?=
 =?us-ascii?Q?U8Jw962tePNQt3l4ZPPE/76sQK2me5cthO9CkK2GdUnkYM8pVHYXpjBS7Yrw?=
 =?us-ascii?Q?PrvqzISsMnI3BtEq/gVgXWAMiNC5C+L8ILThbo3pS3vUYJ6NcNl4065Tqa2+?=
 =?us-ascii?Q?L008uriQD91D1tzbz8SPDZwSx4oI/0bgZfqF/7KUytLwhzWCEsUTEASmyWk1?=
 =?us-ascii?Q?QMwGdDUotfK2NkndD221pQZLwl7z/O+KE+M+KpTEbLAwGdFANAjkpCyaCTk7?=
 =?us-ascii?Q?K/OctJNPDyBA5XpK/ytFhMlq5iSvv9Kimf3YV7EjWX7eGu/CXm0Hwx4T3fau?=
 =?us-ascii?Q?umsdXpDsP6uMt0Yj3ZKR5UYbRV68sG3XR9bWVm1mJ9NfxV1iT0mMBRaFEtUy?=
 =?us-ascii?Q?5e9Ddj3X4wBYEgcaTU2SXj1SuO7MrgnyyAcmobu1Fc8UxPv7Upv+ftO28TdO?=
 =?us-ascii?Q?27z573gIr7O4SIROXfsy/PFInrVwNVxGVOkanAzQOMCI6EwPDvzLJq4/9zkk?=
 =?us-ascii?Q?3vHT2AwAcsmLItvGneggbSQzkWPxDivCkZi3FQzSqukXRthN4iGDhrZnd8L5?=
 =?us-ascii?Q?rh2hw/RZsO7NrZOCtWQoePfh5oOxYpHcwxu3F6+ZyKpF2avy4GMviVcr7e1m?=
 =?us-ascii?Q?Diiq6ow/TVsj4pl13yyiK6oqPHqipyQr8rIWCvmTBxxRnm5lesHrt8QZB4Aq?=
 =?us-ascii?Q?1DJBqOmLDN50wFtfzd92v+mQtndizCaROBfgZv9zlZywEOZGUv92IrZUF/02?=
 =?us-ascii?Q?SxILogl1iOLqj76N/DP5jxRUiDWtRCTU5nu+BV5mFTwGUY2ilKd1UV1035YM?=
 =?us-ascii?Q?l3ssIv+w7e5u0wsPVLb7kHJb9QWVrUbBfy5XuEMQQOH+iByBusLxWym1/kyy?=
 =?us-ascii?Q?oNFB5YCFQPAdb9YuGPZ1xXLd6N8mw++8wtwSLT7wt/HZdQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qpWUxrMWVVDq3kiyAbSu0iRkqKNHOxGNALvFvE/VBPbp5FeFBCpEiFXAp2tZ?=
 =?us-ascii?Q?opNaB+qUNB57jG/1ynhuaPrQdwrkOnbCBxFIM3ljRi4cfJXjbLAhoIGIDdiG?=
 =?us-ascii?Q?8Bt9zZCd8SsP9T8HnYu7IQF7Wvqz0Xfpesm9xQDlb+560jC/gm/dCvOvPzxO?=
 =?us-ascii?Q?XcdiaoWtl0AHmjT0FhuzyKuLFEPfqiUJTjRmUYcn5UEUBiOvzGIVzuNUVHgm?=
 =?us-ascii?Q?DynDKcBspLhtwKDvVc8OGwiFwsJshLc7hOwHWRio5E0HuMsrTWYciI1Vqn5C?=
 =?us-ascii?Q?GjckwDIZpxdHFxcuY+fLc2jAQDew4n08l02wbmrFh+lBJdYRTsMcX70Taxc+?=
 =?us-ascii?Q?sbDraBNrmZ4flkYHSKvFFapxNk78QPEXn0hVHdIFTUh0IfH3aNR6+QRzN00W?=
 =?us-ascii?Q?lAD3s79blfbWX8N+goNrRb/I+pdRBrEUdyb+pfxriy6kVfJjyYgH5c/z7YiK?=
 =?us-ascii?Q?NXX2zU/PWBKx1tu8Gpi0YQqzI141HfuDpjN86KBzEAxqNLp3M2YjZuLrMU/m?=
 =?us-ascii?Q?8PCcbNLSrJqPtcFXRypW5xGLvaTWuAg0+6Q8ZXWtUOSzR3a2kHrCeHrTusgU?=
 =?us-ascii?Q?5Fwb+WtKmAAgrKt7dgnF4EjMHmBZbI64fw9B0w4CM70l25xcuQ0f32OX8lU1?=
 =?us-ascii?Q?tKnZq6Q7v6sUFMGavuPa0evzptiIgssJV8OBRDHkwCh9MkLw01Gmh5z1j2v+?=
 =?us-ascii?Q?7mtsrwiiuOj/u7eAmsavNYPngBL5tkJHyUTVTIT00sWh1Xu6JL4gVurEwSCa?=
 =?us-ascii?Q?tXWAQVS+fhQmUevLUo9A/0gnw4j/JqpPL90Il4xR48aJ8pf8Q7cjGLsgrmym?=
 =?us-ascii?Q?S6IFmz5UsH6Doq5nuPFLkNhaQy+5HJjODqQnp8nrELNUEAYhocxK7m47imW0?=
 =?us-ascii?Q?PBoKCisrlvWxliDhEDolGfewyJjgTJ4BrTO+ZLsdT7mTPdXRsDWI/FhMicEo?=
 =?us-ascii?Q?IsWVxRdriFcgvI4/sPr4TwL4otii/rZPA5dpSS5yya215drH2WxwrCQ1Z7AN?=
 =?us-ascii?Q?DHcdERNhxJUgvJZp06frDG92UnVSlULTbrANMP3NORegKUOdsvGzfk85kSOm?=
 =?us-ascii?Q?/7vrxAhDjV1wVhOtZoStdaSDdooSOkiA6ML122UOzYqRHgdLhESSYPmnuGN9?=
 =?us-ascii?Q?djYKxl2oOJQBRTCP1EkFofmpylQonyR3IBFmf8EJR1Qey1dRn6M6I+vaebW2?=
 =?us-ascii?Q?bOy8OVLlKUBt8EbYorjYADvoSzEjAc7URYl5TLxkYjQpDchbNxiQtsJ34IDC?=
 =?us-ascii?Q?drjv695RzjubMrRWRLhCJ6ytCnj4YSdP9CAgWrYzoTqFyf0LmgWSCGN/2vna?=
 =?us-ascii?Q?XNdAtHmYDt0d/jC0b/DHyhUxox40YlKu2QSxqHL94c+w379VvzceOdELCQ/4?=
 =?us-ascii?Q?k3Ks9rqLbEJjZ+XpQM43+flllp1tG/mCa5l6SH4PEa2cFhiQqKbXfATstWjH?=
 =?us-ascii?Q?6AnBwuujkf1Kee9OttxVhK60qDMYSe7Yw9o/CDZ2hzKbP7SpeaA6ot2EGUeJ?=
 =?us-ascii?Q?dJ7kcil224s5MQwBojetZVTJ6xH95p3eqx4AIi+NhELghIEgQFNcWvMPNayS?=
 =?us-ascii?Q?/e5y8Om7qGelxoZpPLP+l0phzwEVmAKiboAFfYeHpKCqWn0bgAICLFNJgvoE?=
 =?us-ascii?Q?6A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	J2iQIyJuPDkiiIext6Rzg0aSaN5dQ1XHFgjuQlCbLTLAX3f0orb64AfOlQLFUxI+vMQ/nFulAP8nNVjJK0BZ1xyPOMC+cutzXvZbpbfCZRX8aJ0uTflVwmwB1eoTy/4NEa1cZquyQjFCFiLeZY3jl5WLNXP1eLhEE38Q+ElN+PJ3BorTGFevhxbsEwl2v+DDewacJLbXQU86DYtZjdiVd+LZjn6sSoMm6MpeY+zf4plHtXgP9/RTFIVltmdBGi7ZXxQNgiKwdWKTyJEYFdxG07iHRZV6ewa/Rp4sHHfKBYhl+2HL8SzfDJqmZd9NvEumjjWXAKSk1ESJ1YYwz3DxElGfB1Z1NGOz2WYUHRZd56s2p6LLG4pyDYxS8QDtmS05oNYYA/M9qDv2PQFE2WQZXb41n0h9IJcUbKc62WXG4GK4u7AY5aSVldwe25o6+TqOPwKtuQiCDFEx9ES6XrlroA239WsyCIWDg5tyg7vPZW7f1A3unjaW0vksVzWYCZLw6TKUlL7W/wkE3c1kr99C1/x1iz39Q3WIFVAs0FFlQkffetbJvujspMMEKudJI3iopEk+DijJH9CqZcSBZi+z1zkVlyZ7zqgwaRqRjpZPU0Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4b5a88a-d83b-4c5a-31fd-08dd4a87ab52
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 10:34:31.5033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nK5rdzvNLQePVtBVbmc/Xh95UjXC/N5GTKxOmvXrYvU97qP0CciSMaPNA6jQ8FRYkVUkOHSL/kvSJU1cGfidOOyfnQXgt3uW4kNf44AJi44=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5549
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_04,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 adultscore=0 mlxscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502110066
X-Proofpoint-GUID: t7SX26MQpiaZyCyGNUGQ6epoB4Dt0SQ9
X-Proofpoint-ORIG-GUID: t7SX26MQpiaZyCyGNUGQ6epoB4Dt0SQ9

+cc Naresh, as [0] does not appear to be in lore which seems to be having issues
(meaning I can't reply to that thread at all), also +cc Arnd for his reply in [1].

[0]:https://lwn.net/ml/linux-mm/CA+G9fYt5QwJ4_F8fJj7jx9_0Le9kOVSeG38ox9qnKqwsrDdvHQ@mail.gmail.com/
[1]:https://lwn.net/ml/linux-mm/fa1a7a10-f892-4e7e-acb4-0b058aa53d88@app.fastmail.com/

The report here from Yi Lai (thanks for that!) appears to be the same thing.

SJ - I think the issue is we're unconditionally trying to unlock even in the
case of MADV_HWPOISON, MADV_SOFT_OFFLINE. E.g.:

static int madvise_lock(struct mm_struct *mm, int behavior)
{

#ifdef CONFIG_MEMORY_FAILURE
	if (behavior == MADV_HWPOISON || behavior == MADV_SOFT_OFFLINE)
		return 0;
#endif
	...
}

But on unlock...

static void madvise_unlock(struct mm_struct *mm, int behavior)
{
	if (madvise_need_mmap_write(behavior))
		mmap_write_unlock(mm);
	else
		mmap_read_unlock(mm);
}

So we just need to insert an equivalent line (ideally abstracted to a helper) on
unlock also.

OK having just typed that I realise SJ sent a fix already. Lore being broken
means I can't link to it. Sigh.

Will reply there.


On Tue, Feb 11, 2025 at 01:30:49PM +0800, Lai, Yi wrote:
> On Wed, Feb 05, 2025 at 10:15:17PM -0800, SeongJae Park wrote:
> > Optimize redundant mmap lock operations from process_madvise() by
> > directly doing the mmap locking first, and then the remaining works for
> > all ranges in the loop.
> >
> > Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
> > Signed-off-by: SeongJae Park <sj@kernel.org>
> > ---
> >  mm/madvise.c | 26 ++++++++++++++++++++++++--
> >  1 file changed, 24 insertions(+), 2 deletions(-)
> >
> > diff --git a/mm/madvise.c b/mm/madvise.c
> > index 31e5df75b926..5a0a1fc99d27 100644
> > --- a/mm/madvise.c
> > +++ b/mm/madvise.c
> > @@ -1754,9 +1754,26 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
> >
> >  	total_len = iov_iter_count(iter);
> >
> > +	ret = madvise_lock(mm, behavior);
> > +	if (ret)
> > +		return ret;
> > +
> >  	while (iov_iter_count(iter)) {
> > -		ret = do_madvise(mm, (unsigned long)iter_iov_addr(iter),
> > -				 iter_iov_len(iter), behavior);
> > +		unsigned long start = (unsigned long)iter_iov_addr(iter);
> > +		size_t len_in = iter_iov_len(iter);
> > +		size_t len;
> > +
> > +		if (!is_valid_madvise(start, len_in, behavior)) {
> > +			ret = -EINVAL;
> > +			break;
> > +		}
> > +
> > +		len = PAGE_ALIGN(len_in);
> > +		if (start + len == start)
> > +			ret = 0;
> > +		else
> > +			ret = madvise_do_behavior(mm, start, len_in, len,
> > +					behavior);
> >  		/*
> >  		 * An madvise operation is attempting to restart the syscall,
> >  		 * but we cannot proceed as it would not be correct to repeat
> > @@ -1772,12 +1789,17 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
> >  				ret = -EINTR;
> >  				break;
> >  			}
> > +
> > +			/* Drop and reacquire lock to unwind race. */
> > +			madvise_unlock(mm, behavior);
> > +			madvise_lock(mm, behavior);
> >  			continue;
> >  		}
> >  		if (ret < 0)
> >  			break;
> >  		iov_iter_advance(iter, iter_iov_len(iter));
> >  	}
> > +	madvise_unlock(mm, behavior);
> >
> >  	ret = (total_len - iov_iter_count(iter)) ? : ret;
> >
>
> Hi SeongJae Park,
>
> Greetings!
>
> I used Syzkaller and found that there is WARNING in madvise_unlock in linux-next tag - next-20250210.
>
> After bisection and the first bad commit is:
> "
> ec68fbd9e99f mm/madvise: remove redundant mmap_lock operations from process_madvise()
> "
>
> All detailed into can be found at:
> https://github.com/laifryiee/syzkaller_logs/tree/main/250210_144836_madvise_unlock
> Syzkaller repro code:
> https://github.com/laifryiee/syzkaller_logs/tree/main/250210_144836_madvise_unlock/repro.c
> Syzkaller repro syscall steps:
> https://github.com/laifryiee/syzkaller_logs/tree/main/250210_144836_madvise_unlock/repro.prog
> Syzkaller report:
> https://github.com/laifryiee/syzkaller_logs/tree/main/250210_144836_madvise_unlock/repro.report
> Kconfig(make olddefconfig):
> https://github.com/laifryiee/syzkaller_logs/tree/main/250210_144836_madvise_unlock/kconfig_origin
> Bisect info:
> https://github.com/laifryiee/syzkaller_logs/tree/main/250210_144836_madvise_unlock/bisect_info.log
> bzImage:
> https://github.com/laifryiee/syzkaller_logs/raw/refs/heads/main/250210_144836_madvise_unlock/bzImage_df5d6180169ae06a2eac57e33b077ad6f6252440
> Issue dmesg:
> https://github.com/laifryiee/syzkaller_logs/blob/main/250210_144836_madvise_unlock/df5d6180169ae06a2eac57e33b077ad6f6252440_dmesg.log
>
> "
> [  135.191347] Injecting memory failure for pfn 0x8ea0 at process virtual address 0x20e7f000
> [  135.194964] Memory failure: 0x8ea0: recovery action for reserved kernel page: Ignored
> [  135.195584] ------------[ cut here ]------------
> [  135.195863] WARNING: CPU: 1 PID: 680 at ./include/linux/rwsem.h:203 madvise_unlock+0x17e/0x1a0
> [  135.196395] Modules linked in:
> [  135.196612] CPU: 1 UID: 0 PID: 680 Comm: repro Not tainted 6.14.0-rc2-next-20250210-df5d6180169a #1
> [  135.197135] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
> [  135.197818] RIP: 0010:madvise_unlock+0x17e/0x1a0
> [  135.198108] Code: a1 9f ff 31 f6 49 8d bc 24 e0 01 00 00 e8 fa 80 d5 03 31 ff 89 c3 89 c6 e8 9f 9b 9f ff 85 db 0f 85 1c ff ff ffe
> [  135.199154] RSP: 0018:ffff888022647e88 EFLAGS: 00010293
> [  135.199468] RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffffffff81e878f1
> [  135.199876] RDX: ffff88802264a540 RSI: ffffffff81e878fe RDI: 0000000000000005
> [  135.200285] RBP: ffff888022647ea0 R08: 0000000000000001 R09: ffffed10044c8f25
> [  135.200692] R10: 0000000000000000 R11: 0000000000000001 R12: ffff888021116180
> [  135.201100] R13: ffff8880211162f0 R14: 0000000000004000 R15: ffff888021116180
> [  135.201531] FS:  00007f0327a07600(0000) GS:ffff88806c500000(0000) knlGS:0000000000000000
> [  135.201996] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  135.202329] CR2: 00007f032773e7f0 CR3: 0000000021bd4003 CR4: 0000000000770ef0
> [  135.202737] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [  135.203155] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
> [  135.203563] PKRU: 55555554
> [  135.203731] Call Trace:
> [  135.203883]  <TASK>
> [  135.204020]  ? show_regs+0x6d/0x80
> [  135.204240]  ? __warn+0xf3/0x390
> [  135.204447]  ? report_bug+0x25e/0x4b0
> [  135.204692]  ? madvise_unlock+0x17e/0x1a0
> [  135.204937]  ? report_bug+0x2cb/0x4b0
> [  135.205167]  ? madvise_unlock+0x17e/0x1a0
> [  135.205413]  ? madvise_unlock+0x17f/0x1a0
> [  135.205706]  ? handle_bug+0xf1/0x190
> [  135.206188]  ? exc_invalid_op+0x3c/0x80
> [  135.206423]  ? asm_exc_invalid_op+0x1f/0x30
> [  135.206678]  ? madvise_unlock+0x171/0x1a0
> [  135.206919]  ? madvise_unlock+0x17e/0x1a0
> [  135.207156]  ? madvise_unlock+0x17e/0x1a0
> [  135.207388]  ? madvise_unlock+0x17e/0x1a0
> [  135.207623]  do_madvise+0x14f/0x1a0
> [  135.207836]  __x64_sys_madvise+0xb2/0x120
> [  135.208067]  ? syscall_trace_enter+0x14f/0x280
> [  135.208328]  x64_sys_call+0x19b1/0x2150
> [  135.208552]  do_syscall_64+0x6d/0x140
> [  135.208766]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [  135.209050] RIP: 0033:0x7f032763ee5d
> [  135.209261] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b8
> [  135.210261] RSP: 002b:00007ffcaafd26c8 EFLAGS: 00000207 ORIG_RAX: 000000000000001c
> [  135.210678] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f032763ee5d
> [  135.211069] RDX: 0000000000000064 RSI: 0000000000004000 RDI: 0000000020e7f000
> [  135.211458] RBP: 00007ffcaafd26d0 R08: 00007ffcaafd2140 R09: 00007ffcaafd2700
> [  135.211851] R10: 0000000000000000 R11: 0000000000000207 R12: 00007ffcaafd2828
> [  135.212248] R13: 00000000004016da R14: 0000000000403e08 R15: 00007f0327a4e000
> [  135.212656]  </TASK>
> [  135.212794] irq event stamp: 807
> [  135.212987] hardirqs last  enabled at (815): [<ffffffff81663b55>] __up_console_sem+0x95/0xb0
> [  135.213477] hardirqs last disabled at (824): [<ffffffff81663b3a>] __up_console_sem+0x7a/0xb0
> [  135.213951] softirqs last  enabled at (628): [<ffffffff8148c40e>] __irq_exit_rcu+0x10e/0x170
> [  135.214426] softirqs last disabled at (623): [<ffffffff8148c40e>] __irq_exit_rcu+0x10e/0x170
> [  135.214910] ---[ end trace 0000000000000000 ]---
> [  135.215182]
> [  135.215283] =====================================
> [  135.215550] WARNING: bad unlock balance detected!
> [  135.215817] 6.14.0-rc2-next-20250210-df5d6180169a #1 Tainted: G        W
> [  135.216234] -------------------------------------
> [  135.216502] repro/680 is trying to release lock (&mm->mmap_lock) at:
> [  135.216863] [<ffffffff81e87854>] madvise_unlock+0xd4/0x1a0
> [  135.217179] but there are no more locks to release!
> [  135.217457]
> [  135.217457] other info that might help us debug this:
> [  135.217819] no locks held by repro/680.
> [  135.218046]
> [  135.218046] stack backtrace:
> [  135.218296] CPU: 1 UID: 0 PID: 680 Comm: repro Tainted: G        W          6.14.0-rc2-next-20250210-df5d6180169a #1
> [  135.218308] Tainted: [W]=WARN
> [  135.218310] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
> [  135.218315] Call Trace:
> [  135.218317]  <TASK>
> [  135.218320]  dump_stack_lvl+0xea/0x150
> [  135.218330]  ? madvise_unlock+0xd4/0x1a0
> [  135.218341]  dump_stack+0x19/0x20
> [  135.218349]  print_unlock_imbalance_bug+0x1b5/0x200
> [  135.218368]  ? madvise_unlock+0xd4/0x1a0
> [  135.218379]  lock_release+0x5bc/0x870
> [  135.218386]  ? madvise_unlock+0x17f/0x1a0
> [  135.218397]  ? handle_bug+0xf1/0x190
> [  135.218407]  ? __pfx_lock_release+0x10/0x10
> [  135.218415]  ? exc_invalid_op+0x3c/0x80
> [  135.218426]  ? asm_exc_invalid_op+0x1f/0x30
> [  135.218441]  up_write+0x31/0x550
> [  135.218449]  ? madvise_unlock+0x17e/0x1a0
> [  135.218462]  madvise_unlock+0xd4/0x1a0
> [  135.218474]  do_madvise+0x14f/0x1a0
> [  135.218487]  __x64_sys_madvise+0xb2/0x120
> [  135.218500]  ? syscall_trace_enter+0x14f/0x280
> [  135.218511]  x64_sys_call+0x19b1/0x2150
> [  135.218522]  do_syscall_64+0x6d/0x140
> [  135.218531]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [  135.218542] RIP: 0033:0x7f032763ee5d
> [  135.218548] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b8
> [  135.218556] RSP: 002b:00007ffcaafd26c8 EFLAGS: 00000207 ORIG_RAX: 000000000000001c
> [  135.218562] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f032763ee5d
> [  135.218569] RDX: 0000000000000064 RSI: 0000000000004000 RDI: 0000000020e7f000
> [  135.218573] RBP: 00007ffcaafd26d0 R08: 00007ffcaafd2140 R09: 00007ffcaafd2700
> [  135.218578] R10: 0000000000000000 R11: 0000000000000207 R12: 00007ffcaafd2828
> [  135.218582] R13: 00000000004016da R14: 0000000000403e08 R15: 00007f0327a4e000
> [  135.218594]  </TASK>
> [  135.228272] ------------[ cut here ]------------
> [  135.228541] DEBUG_RWSEMS_WARN_ON((rwsem_owner(sem) != current) && !rwsem_test_oflags(sem, RWSEM_NONSPINNABLE)): count = 0x0, magy
> [  135.229541] WARNING: CPU: 1 PID: 680 at kernel/locking/rwsem.c:1367 up_write+0x451/0x550
> [  135.229997] Modules linked in:
> [  135.230182] CPU: 1 UID: 0 PID: 680 Comm: repro Tainted: G        W          6.14.0-rc2-next-20250210-df5d6180169a #1
> [  135.230758] Tainted: [W]=WARN
> [  135.230940] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
> [  135.231565] RIP: 0010:up_write+0x451/0x550
> [  135.231806] Code: ea 03 80 3c 02 00 0f 85 d5 00 00 00 49 8b 14 24 53 4d 89 f9 4c 89 f1 48 c7 c6 40 bd eb 85 48 c7 c7 60 bc eb 858
> [  135.232814] RSP: 0018:ffff888022647e30 EFLAGS: 00010282
> [  135.233113] RAX: 0000000000000000 RBX: ffffffff85ebbba0 RCX: ffffffff8146cfd3
> [  135.233528] RDX: ffff88802264a540 RSI: ffffffff8146cfe0 RDI: 0000000000000001
> [  135.233929] RBP: ffff888022647e78 R08: 0000000000000001 R09: ffffed10044c8f66
> [  135.234325] R10: 0000000000000001 R11: 57525f4755424544 R12: ffff8880211162f0
> [  135.234722] R13: ffff8880211162f8 R14: ffff8880211162f0 R15: ffff88802264a540
> [  135.235122] FS:  00007f0327a07600(0000) GS:ffff88806c500000(0000) knlGS:0000000000000000
> [  135.235584] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  135.235912] CR2: 00007f032773e7f0 CR3: 0000000021bd4003 CR4: 0000000000770ef0
> [  135.236314] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [  135.236713] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
> [  135.237114] PKRU: 55555554
> [  135.237276] Call Trace:
> [  135.237445]  <TASK>
> [  135.237580]  ? show_regs+0x6d/0x80
> [  135.237789]  ? __warn+0xf3/0x390
> [  135.237987]  ? find_bug+0x310/0x490
> [  135.238199]  ? up_write+0x451/0x550
> [  135.238412]  ? report_bug+0x2cb/0x4b0
> [  135.238636]  ? up_write+0x451/0x550
> [  135.238853]  ? up_write+0x452/0x550
> [  135.239065]  ? handle_bug+0xf1/0x190
> [  135.239285]  ? exc_invalid_op+0x3c/0x80
> [  135.239515]  ? asm_exc_invalid_op+0x1f/0x30
> [  135.239768]  ? __warn_printk+0x173/0x2e0
> [  135.240001]  ? __warn_printk+0x180/0x2e0
> [  135.240235]  ? up_write+0x451/0x550
> [  135.240445]  ? madvise_unlock+0x17e/0x1a0
> [  135.240686]  madvise_unlock+0xd4/0x1a0
> [  135.240913]  do_madvise+0x14f/0x1a0
> [  135.241126]  __x64_sys_madvise+0xb2/0x120
> [  135.241364]  ? syscall_trace_enter+0x14f/0x280
> [  135.241647]  x64_sys_call+0x19b1/0x2150
> [  135.241887]  do_syscall_64+0x6d/0x140
> [  135.242113]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [  135.242407] RIP: 0033:0x7f032763ee5d
> [  135.242619] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b8
> [  135.243646] RSP: 002b:00007ffcaafd26c8 EFLAGS: 00000207 ORIG_RAX: 000000000000001c
> [  135.244075] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f032763ee5d
> [  135.244476] RDX: 0000000000000064 RSI: 0000000000004000 RDI: 0000000020e7f000
> [  135.244877] RBP: 00007ffcaafd26d0 R08: 00007ffcaafd2140 R09: 00007ffcaafd2700
> [  135.245279] R10: 0000000000000000 R11: 0000000000000207 R12: 00007ffcaafd2828
> [  135.245696] R13: 00000000004016da R14: 0000000000403e08 R15: 00007f0327a4e000
> [  135.246106]  </TASK>
> [  135.246242] irq event stamp: 857
> [  135.246434] hardirqs last  enabled at (857): [<ffffffff81663b55>] __up_console_sem+0x95/0xb0
> [  135.246915] hardirqs last disabled at (856): [<ffffffff81663b3a>] __up_console_sem+0x7a/0xb0
> [  135.247392] softirqs last  enabled at (628): [<ffffffff8148c40e>] __irq_exit_rcu+0x10e/0x170
> [  135.247871] softirqs last disabled at (623): [<ffffffff8148c40e>] __irq_exit_rcu+0x10e/0x170
> [  135.248347] ---[ end trace 0000000000000000 ]---
> "
>
> Hope this cound be insightful to you.
>
> Regards,
> Yi Lai
>
> ---
>
> If you don't need the following environment to reproduce the problem or if you
> already have one reproduced environment, please ignore the following information.
>
> How to reproduce:
> git clone https://gitlab.com/xupengfe/repro_vm_env.git
> cd repro_vm_env
> tar -xvf repro_vm_env.tar.gz
> cd repro_vm_env; ./start3.sh  // it needs qemu-system-x86_64 and I used v7.1.0
>   // start3.sh will load bzImage_2241ab53cbb5cdb08a6b2d4688feb13971058f65 v6.2-rc5 kernel
>   // You could change the bzImage_xxx as you want
>   // Maybe you need to remove line "-drive if=pflash,format=raw,readonly=on,file=./OVMF_CODE.fd \" for different qemu version
> You could use below command to log in, there is no password for root.
> ssh -p 10023 root@localhost
>
> After login vm(virtual machine) successfully, you could transfer reproduced
> binary to the vm by below way, and reproduce the problem in vm:
> gcc -pthread -o repro repro.c
> scp -P 10023 repro root@localhost:/root/
>
> Get the bzImage for target kernel:
> Please use target kconfig and copy it to kernel_src/.config
> make olddefconfig
> make -jx bzImage           //x should equal or less than cpu num your pc has
>
> Fill the bzImage file into above start3.sh to load the target kernel in vm.
>
>
> Tips:
> If you already have qemu-system-x86_64, please ignore below info.
> If you want to install qemu v7.1.0 version:
> git clone https://github.com/qemu/qemu.git
> cd qemu
> git checkout -f v7.1.0
> mkdir build
> cd build
> yum install -y ninja-build.x86_64
> yum -y install libslirp-devel.x86_64
> ../configure --target-list=x86_64-softmmu --enable-kvm --enable-vnc --enable-gtk --enable-sdl --enable-usb-redir --enable-slirp
> make
> make install
>
> > --
> > 2.39.5
