Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9961EF080
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743517179; cv=fail; b=ULq9gaKVE9W45+DNn+2zZKoE6uD/65lgxA/mMfzAe0NEdD5w7lDEeY1roPE2yvmffO34B8VajfTddFCfS2D/XWjX/utvwEFq0ZFv0sS4XT92wzvGobngZS8EZp7vX488Ln6PXSsg3rvF6j2/P+gOgMPoN6dILmZWDd+JDxmDE1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743517179; c=relaxed/simple;
	bh=Rf7fOFJMz3rbl+i0B4fWb6diyqUIqucWFIYzKD4/wcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mN24Fp2V1rWBe5E0wptdJp7hkOsJLRsPJilUP1kYqktkera+pbTuF+JJ4qo1O+Fs1M90/j66Xr6cImwuXc9WWY/oElG+Gxqeh3W9EWlYpQvM3oH2Y+Kjaakr5xG2VBbHxFiWU3Np2vmBY1vTzNUy+0Gs3pg/DR9yF0zE0wL5D24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=W5E9d1kG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HetyIDk1; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="W5E9d1kG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HetyIDk1"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531D9Lvw011814;
	Tue, 1 Apr 2025 14:19:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=6tch8SSrVfS/X8UQox4tP0b7DDsep6IkgKCuqW5ZbRQ=; b=
	W5E9d1kGoTjtrtxBMcU+cG7XgDyTNe+Xlw0f68gTAxwkniA5ytvni7mn6A5M/P9U
	u3f5et+dTUB+JKKvrNIPpzDGvyPSKQi5Ov7PYB44kZpm+8G0rcRAvz45XSRIPrP9
	LRwOGLQeDQERFMrX6uuy+l+TzPzz2QGqjuEt2/nYRO24ref474QdRax6YeN1oevU
	YlDqMW+MupCNG0i/OmAW7MqmdhlEQj9SyWZgySBK4fwuV530Aq5koK9tY9WN+XvZ
	A5Y/itrzU74VT/0UYtDwzIiApbeEp3Kf5ZEj02sNEYcGImZbKHDcvNmMhswjEYgX
	GGcIJiT/eVO2fCnMoNgGtw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p79c8dxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Apr 2025 14:19:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 531Din5k033541;
	Tue, 1 Apr 2025 14:19:15 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45p7a9fcng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Apr 2025 14:19:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nrwbds+JWF2TB0qiS+zL6pLzSjNXYQ2NG3pSxVnvHwLNOQUiJJGKphK/EZlcM4I0QllQHz2JRXxMYLhIJQBZOsKLVYt2wMx5TfeE2za5vmKrqj5z2DwowYL2iBymixwhIhtDzpGEFsxlEqejl91i2eMS/uFyJbrYUpIHQK4Gbs8LSt3MyNoqzHvxbb6sD7pgYfEsMakzibCmAWrbQR2bdLjZhkqwv9WvKPqaFG4qZWjQoVnb3Kjm525QoagFWA/uzEUviBsrXS5XIVn2Q8sgrYaRZ8yMzqTRy88JzMBm+v3/rEzz0yOsFeCOqNSUnATeVqvasN8e3ZHX+XxOYaCl3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6tch8SSrVfS/X8UQox4tP0b7DDsep6IkgKCuqW5ZbRQ=;
 b=mrD5NE8gjw1hXNo7tWUQTZGBzqTEaKkoUF44pXpbVIFhlR3EwzMbZuyy/jIq3sj/xS+cJiMRooNGWRyNMYAUwo3scbcJTb29wEBvr543MCuOcb4JixfJUk326x8Pxp9DXLfEDSHtWb172K18zDfjgF6VBLtcEHxf83sNsnjm9Fxp/nVAkRFiS/I7QHHOr6uozbQX4cvwmn3n6ctSlBJCLfLlP/ccsBliit+BLNwE/VkESyvZMbcKEZO2WXBw1RYKgFNhF69ZV6h/if9Q8WToTeiq/idw8ofIdBB4eNMipAcHLY355Jwn3YT5lqEmTngS1dCCDCoA6fuzLOJCs/MqGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6tch8SSrVfS/X8UQox4tP0b7DDsep6IkgKCuqW5ZbRQ=;
 b=HetyIDk1j8VaWhwGTz5xgEos36gBP/cZXAKMlDwiJEr9JTNj3u580GtCgGlFBRx/zrdVXMwgg0YnMetiyJsq7pWLRfi74wAmGJGo8lvHpuQxVB62+JX2ucoes17PPXpq92FI3w+QEl/Ifts7+l/Noq6vOwd6nSBU6By7iEWoB64=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by SJ2PR10MB6989.namprd10.prod.outlook.com (2603:10b6:a03:4cf::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.36; Tue, 1 Apr
 2025 14:19:12 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23%7]) with mapi id 15.20.8583.038; Tue, 1 Apr 2025
 14:19:12 +0000
Date: Tue, 1 Apr 2025 23:19:02 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
        Hyeonggon Yoo <42.hyeyoo@gmail.com>, mkoutny@suse.com,
        Dan Williams <dan.j.williams@intel.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH 1/2] mm,memory_hotplug: Implement numa node notifier
Message-ID: <Z-v11je1uiSrp4nN@harry>
References: <20250401092716.537512-1-osalvador@suse.de>
 <20250401092716.537512-2-osalvador@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401092716.537512-2-osalvador@suse.de>
X-ClientProxiedBy: SL2P216CA0172.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b::18) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|SJ2PR10MB6989:EE_
X-MS-Office365-Filtering-Correlation-Id: d5c11859-a7f1-46df-2523-08dd71282cc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NHdNaXo2Q2pyZ2JrckYvdDZhWjRCNktjQzg3alVJQ0JqOWR6Q2VmNXpUZ25P?=
 =?utf-8?B?d0VhcDdJais3aEI4bk9xcnNWbWZmdFpldFdlT1NTRnlpNzNpNGZQck1wSVJG?=
 =?utf-8?B?Si9ONDlOSGRKMjV4WERZZXlhYXFlRXZtdk9JN3dmU2RLYm1wL2RNek1qalds?=
 =?utf-8?B?d2xHZUVvbms0YmFGQ0VwNG02NXNlMVZVRlZiTVhIWUtjLzBVU1VJNm1hUWNW?=
 =?utf-8?B?OEZIeFhzTFVNMithN1JSQlpDcms5Q3RqZnlOdlBHS1htVWIveUtmRnZ3K2pm?=
 =?utf-8?B?YTdBdjIrcStQY01UbFd2SmtiZ1k3cHZqVytseUFJZEZVS1BuVWN6NFJEWU95?=
 =?utf-8?B?dDl0N2dtU1VxTnhGdE9TQitEMjg2WVFkWHp5amtwSUZZdkc4TFR1ZkEySUNQ?=
 =?utf-8?B?dVNOZE15SGJSY0gvUjhnelVaRkt1M09yNjVVYVFuYUlEY2VJeDh3Y2lseW9u?=
 =?utf-8?B?MWRwWm05MHdOS3Fyd0svRFNUcXRRbzJxeGZOdEgvNXlQZW1RRG9lWEpEbG9s?=
 =?utf-8?B?M2t0VUg1c0hmWVQ4K0V0eEZIemUrU2hBK29HK3dNQkNSOFlKVU1KVWF1L3FZ?=
 =?utf-8?B?aGtjVHc1dXNDYXVuVnM4YllPS0xDeld5ejNHZEoxcUFybk1sRUNpODRpTHhX?=
 =?utf-8?B?N0hra1pzSlgyNDIyZmsvcjdZbldON3Z2ZHFYMW9xNEJWaFNkM0tPcy81LzJS?=
 =?utf-8?B?REFPQ1dmajgvT2NTY2dJZ2Mya3gwSllZT3FOVTZ6WmxIY1pTTVJmdnJ2MU5l?=
 =?utf-8?B?ZWNCWXBRVnpRSWJYT0tuV1RET0x2NU12VFhQT1N3NHZZVlJyMzVpOThJdWU0?=
 =?utf-8?B?Z00waHVXVzdvNk1pek1QdkhCdUo3OVdKaE9qZmh2aEFXdzhUb0dXR3YxR2J1?=
 =?utf-8?B?dEc1Q1FkcXFDdk00aXQzbmV6NVpjSlpBUDJ5eUc3K1dyWWVDZ1BtMVN0cXJ2?=
 =?utf-8?B?Q3ExK1BwOUZldzZDSERlbTJ2TU1EalJLY0V2VmJYZWJHN0k0a2ZhOFBDclpw?=
 =?utf-8?B?NkxWTUVUeHh6a1RzY0U4am5PdEdZS2NzV0lkVFI4R2dUeGlwM29SL3NoN3hm?=
 =?utf-8?B?TkFXdkNPbEhSdnNxdEFIREdKMUxLZnM0aEUyUGZ1a1Y3eEZXbGR1K3JMQVh2?=
 =?utf-8?B?UWhLQVZvZ1dRQ2tCQ1I3cEw2ZzY1OHBjbm1YSjlsUllpNngxQ2hObm94bEE3?=
 =?utf-8?B?Q3dyL3FZOXhPUUdTZnU5VmJQR2JpMk1NdWQvWklmUE54bmlVZGtJa0ZRbU5m?=
 =?utf-8?B?VERLaktlMUZPNDNrMDF0UzFmcmZGWDhkQm84MVF0VTVYTGVKZnNBcDNnT0I5?=
 =?utf-8?B?TXpZdVQxZzZxS1pVMDg0MzZlN0x4MzZFOThjYURhL1lJa2JMMzlXd2FWZWY1?=
 =?utf-8?B?RlpLY0Z1N2Izd2c0YzZjMmluMjNsWXZhUDk2NWxyWWdBZnMxREM1TzBqMTh4?=
 =?utf-8?B?aDBKS2NkTW03UVhEL2ZEUVlyNWdGdDNzZmJ5OFJrVEJRME1ORHBVcnBPbWZs?=
 =?utf-8?B?cC9rRXRidzZZdXpSQjFqY1BEVXpRZ1BKZWYxZFVFbUV3N24zQlpaYVhRd09l?=
 =?utf-8?B?RmI3U1poK1pyb0wwL1ZWYlVWMGwzZ1BhZ1ljZ29IZzd3UUlwV3ZFZyswdHNz?=
 =?utf-8?B?KzMwV1ZQUThJNzh1aHA2K0dIVk0xQnlVYnNXNnE2ck1rY1dhRHY3NXo5Q0tm?=
 =?utf-8?B?dmo2TE1GVURkbk1wUW5xNTVuOE5VTHJLTzlWWHJwLzc5c1B1Rk5pdUo3dDZi?=
 =?utf-8?B?L05OMWNpR2grdmFNeUp0Q2hXY0QxVDJtWk9lKzRFRnhLSTF2a1hCWlJUelRS?=
 =?utf-8?B?S0tFbkV2UlR4MUpzZndIMjVneWZ1UWtwUjAzK0NWa2FMbm9SSGZkMjdYcHpo?=
 =?utf-8?Q?FR7dLZxs7vkz/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTVYZnFrN2NuaGVpUWRlZysyV2JXaEZSUGhVb2NrM081U0o0UlJLQWhQK1dH?=
 =?utf-8?B?ZTFwKzZ5c1Y0WWltd2tveG1GK0w0bXhDNmFzNFBBNzMwUmVKdmFkMktqNFRD?=
 =?utf-8?B?NE0rOUl5RDgra0Vuck5EMDk0K3N6K29oeWxwZ3dKdlhCditQamRSajZTaytR?=
 =?utf-8?B?dFd1eksrdXZTdUlhckh4QlhCRDlFbmRYVE8rL3F2dDBTcHJTVVpqREdscWVy?=
 =?utf-8?B?cVRJbnJJZXF3RS9YeFg4aVVpRGlwRG8yZ0RLdlNlQ00vdGsvS08xQ3FlbmVI?=
 =?utf-8?B?NlMydGtiY0V4cDdZTWxrVnZaWVBEMmpINzVRZURBVDl4KzYxWEY2cXM1NUhi?=
 =?utf-8?B?NGQ2a0ljSngyV3VYakVEM0lKZnpSbmVLeHJ2Smd2WXFCM0toVzQxencwcTg4?=
 =?utf-8?B?RlhrM3hqRmxjY2tIL3FoSW9rNmhodG1jMzAxeHprNjEvanNpNWFaaFJBelpr?=
 =?utf-8?B?UFFnNnA5dHZyMXRkZnIvNzZWQXNvNEZVMnJpYXlndjFhNjBmT3VMb0RCWG5D?=
 =?utf-8?B?czhBR2I1VDFwMkNSeE5OZjhwK1lCQWdicmNYYmtHaDFWY0tqSEd1c1h1REoz?=
 =?utf-8?B?NkEraVJCVXBJa1Z1NTlOK3NGc0dXYUNONXlPd2pGK1c3clI4MW5yV3JTTzlP?=
 =?utf-8?B?c2dJa2JnelFvUWJlRXdncnhGZytubmp1VTJqeHMrM21VMkJDWExRc1oyNlZ2?=
 =?utf-8?B?ajZBRzhmRjhkeXpJdmZmbXNIeFNQb0tLbGhxL0U4MDBsRGczMDB6Uk84Um1i?=
 =?utf-8?B?NThPeWxzVUhyQVVYMGlkaVRiaEFtSWMxQWZaQVhmUkZLUFVVR1RQQldsdHVm?=
 =?utf-8?B?NjhXV09QSkMzWGIvSUMwZmNnVVdCU2FOY1pDdE9vb1U4RitJWnQydkJvYjZR?=
 =?utf-8?B?RGh5TFQ2aVpGUlR5VitHZldzTkgremRmOGxVdHdmRjM0eXJZWWdicmRDSmNm?=
 =?utf-8?B?NFRNYUt2TkszS0g0QWhYOVFTM2N6SGU0QnhVRzBqSDY2YWFrL2QxZFZxY1lV?=
 =?utf-8?B?WlBHYUQ1MkJnZFo4S1NwU0hNbS8zMmZrK2dnV0R3OVk3MGNWTmlNb0JvZ1Ay?=
 =?utf-8?B?UzFqa09ZN2kyREhuQ29qakJ6MC9ENzI2dGNhNExrMHFWTWF6MUoyTTkvWDZ2?=
 =?utf-8?B?dU1vRTY2TWlCTncwYzNnVjl3aU5jU1FTb0JrM0YzUm53MDJHSnBPZjA1cTZM?=
 =?utf-8?B?VHFpa1BVTEIybldIUnVGOFl2RlhQcnZHTzgwRytCdUFrak4wcDE1bWp4andi?=
 =?utf-8?B?MjVPSnVjUEZMWUlFM0VtSjRLUGx3RW1tL082K1VoZmN5STZsTmVqM0dFVC9k?=
 =?utf-8?B?OGVsTnJWaE5kOER2ald0OEU4RTN4Si8ycFIxT290Ym5NeUkwNUdpTDhQbGVH?=
 =?utf-8?B?cWdpcmpESDRjOTRPMFNUbkdmTHRoM251LzdSTmIrRWRkM0Q5ZTNoc1ZPYUlF?=
 =?utf-8?B?MnRUN3BDd1ZhNmxBM21scGZGRWxoZCt5TWpxZldmZDdneTFCaytSRElpSTcv?=
 =?utf-8?B?TisxTkVFTThTejlrcDZLNk5GUVEwUmIwRWNsSTZ4ek1wY3lLNDhQUGhJWUgx?=
 =?utf-8?B?RVNZZ1RDaXhUMnNqL3MxOGhJTldMelhFSEJqWGhVR3ZqVStQYnhxbUNDcGJD?=
 =?utf-8?B?Z2tTVUlWUE91dkV5YTVpbG9SSlFTS1FCeEp5dnhFUGN4cDBJTXVrUkp1Z1ZZ?=
 =?utf-8?B?NkdEVHF1T0dldTdTeU44R1Y2U2VSVzNZejZ5QzAzcjZFTDZUaXNaRFZJSXVO?=
 =?utf-8?B?aHdocUNpVExCazVDWTBldkEvZWkyNGl6MEtTbTd2WnBqV3c5T3BKWTFTdWVr?=
 =?utf-8?B?Y2piNmRnQjEwNTBFdTdSK1NBQXd3dWhmbURRRkxtSTlobTB0NmdEcEphNUdv?=
 =?utf-8?B?R1J2SWt2NmdFZ2dzTTRMakFGTGpEVDZhWHRNM3M4dW1BMmNWZmpJYlZqczJ1?=
 =?utf-8?B?UGV5Ykl0YXBkL0ZRZThoVHgrYlBaWC9vTnQ2VDJPRWdKa2I2Q21RaWc1T0hj?=
 =?utf-8?B?MnNGUmlMOHZJZFdsMzhHSFlPOHVpS0c1bzJBNXJMR3lpMW82Smd3U3p3eHgw?=
 =?utf-8?B?a25lTVAwd0dGK3krTEg0WThrRWJxdkl6aTNaUVNwUzFGZ2FVZS93MVJ2WTI4?=
 =?utf-8?Q?XVC2zbhMCU/h87oRvkRc8yYO7?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lJmmmH0uHRa3JFu+YlNmNxZXnnywIwpETbncmTeLLRh/oXogeF52Lw11Xpm//FAKD6XyPKmqZbE1ieYUXh8BoLQCLDghZg5XQ9E4Y2Pw9PHv6Z8HUiiFe1ZAhEs8CmN5c6eCPg8rx6/lPK1uj3kmaPkier0F/QBHCEgx1b99scbJreMj/O6Cy0H6O+m2QFpRIUaoHsDcm85Y169jcH4UpEMZ/gp0TiC9mcEMyOJ6uAi+rkbQYS+KCBOs5uK8Y2APOsqx7JsmzMmur3nEBI+RviT4PfezKgFjoDMabhnVEcCms4/iPPkaNPbYV3Bqs4jIxC7/NN++p70h/HCvoHDRuVCMlifIx9WspMzd7ag05zLAp5TWzSy30tqFZr9hfcaem/qop+VNC97Pd66UW+buPhFYd7aIGGTPUZmRu4RlFGSZo10pkGf70qy6/c6VlSBMjuPmFyUSONQrAe1O1/R8WWfCvD98oMGoHC348GT0oPm+29xOk+lpQ4DgmO9fXTU2+dNwQbKNU7ob0npF4x3vOuDNogPVfL0R5npFNWf7TwdUDBYlKd9J5WXTWdHjU4VhIAC+zdumyuvtGeQXLy59yJdkRDjAGvDSYT/6JgfMvo4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5c11859-a7f1-46df-2523-08dd71282cc9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 14:19:12.4630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5D41wrvGqYLAjpqkIK7VI+2zn1ixTcGCkSbvdl6pE0lnwcV44dtfR/vuVgpwMoqEse3LreU+6A3+3+Af+BUwGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB6989
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_05,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504010089
X-Proofpoint-GUID: UlLyEppXtZEDZVaeylzZQA5-M24J0r44
X-Proofpoint-ORIG-GUID: UlLyEppXtZEDZVaeylzZQA5-M24J0r44

On Tue, Apr 01, 2025 at 11:27:15AM +0200, Oscar Salvador wrote:
> There are at least four consumers of hotplug_memory_notifier that what they
> really are interested in is whether any numa node changed its state, e.g: going
> from being memory aware to becoming memoryless.
> 
> Implement a specific notifier for numa nodes when their state gets changed,
> and have those consumers that only care about numa node state changes use it.
> 
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> ---

Hi Oscar,

Please Cc harry.yoo@oracle.com instead of 42.hyeyoo@gmail.com
in the future—I recently changed my email.

FWIW, I reviewed this patch and it looks good to me:

Reviewed-by: Harry Yoo <harry.yoo@oracle.com>

>  drivers/acpi/numa/hmat.c  |  6 +--
>  drivers/base/node.c       | 19 +++++++++
>  drivers/cxl/core/region.c | 14 +++----
>  drivers/cxl/cxl.h         |  4 +-
>  include/linux/memory.h    | 38 ++++++++++++++++++
>  kernel/cgroup/cpuset.c    |  2 +-
>  mm/memory-tiers.c         |  8 ++--
>  mm/memory_hotplug.c       | 84 +++++++++++++++++++++++++++++----------
>  mm/slub.c                 | 22 +++++-----
>  9 files changed, 148 insertions(+), 49 deletions(-)
>  
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 75401866fb76..4bb9ff282ec9 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -1963,7 +1987,9 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
>  	unsigned long pfn, managed_pages, system_ram_pages = 0;
>  	const int node = zone_to_nid(zone);
>  	unsigned long flags;
> -	struct memory_notify arg;
> +	struct memory_notify mem_arg;
> +	struct node_notify node_arg;
> +	bool cancel_mem_notifier_on_err = false, cancel_node_notifier_on_err = false;
>  	char *reason;
>  	int ret;
>  

[...]

> +	if (node_arg.status_change_nid >= 0) {
>  		kcompactd_stop(node);
>  		kswapd_stop(node);
> +		/*Node went memoryless. Notifiy interested consumers */
> +		node_notify(NODE_BECAME_MEMORYLESS, &node_arg);
>  	}

nit: /* Node went memoryless. ... */
       ^ a whitespace omitted.

>  	writeback_set_ratelimit();
>  
> -	memory_notify(MEM_OFFLINE, &arg);
> +	memory_notify(MEM_OFFLINE, &mem_arg);
>  	remove_pfn_range_from_zone(zone, start_pfn, nr_pages);
>  	return 0;

> diff --git a/mm/slub.c b/mm/slub.c
> index 184fd2b14758..74350f6c8ddd 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -5928,10 +5928,10 @@ static int slab_mem_going_offline_callback(void *arg)
>  
>  static void slab_mem_offline_callback(void *arg)
>  {
> -	struct memory_notify *marg = arg;
> +	struct node_notify *narg = arg;
>  	int offline_node;
>  
> -	offline_node = marg->status_change_nid_normal;
> +	offline_node = narg->status_change_nid_normal;
>  
>  	/*
>  	 * If the node still has available memory. we need kmem_cache_node

I was wondering if this offline_node check is still necessary after
this patch, but as SLUB is still notified for N_HIGH_MEMORY-only nodes,
it is necessary.

-- 
Cheers,
Harry (formerly known as Hyeonggon)
