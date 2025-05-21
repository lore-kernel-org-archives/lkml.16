Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5109726462E
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 12:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747831749; cv=fail; b=loUERVmkxOhJU1u7ywtt+npSq4ITkxfM3gEqwH2aMB5ys4Nc1siZyNm+Skp0Mpuqj7IAyqcdYM1ba8RbYeZyVpBt9mFqUHYVv7x+YXu8mufffchlh7qqPefGnWa2ozpKXmYHUYRMSaq8N6nWN/O76NV7E+rCJXmHR2zYSPXAOAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747831749; c=relaxed/simple;
	bh=DdrR0cbIxfTOxk67VkTx+NCn4ZI0iSqVTWhs7iniThg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=izeUge8s9N7aOsXWYrOB8HvUVGJXvoykuG2F9YMedSVMxYQmSYLxUDSnXT97sPTGDB/wzAuhu0ABMmXP8wofrkvUTj/+HLXxbgyuYZz1/cjCgWOB5mYlH/5X5H5858JWBl6fGdBgRt6k7TML/5vhuwzhU7HBJ0RWxbqcQwyGVQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=F/gysjMZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=0F4KVDJZ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="F/gysjMZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="0F4KVDJZ"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LC7vCM016566;
	Wed, 21 May 2025 12:48:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=uNZJigumJAMkb27tWD
	VjNseQxwJYJeAnmZilyc6jis8=; b=F/gysjMZxmC9T9ynRyBYkc1ReWS9zPSwqD
	Ts6x84r0x3rdBuGPZwB1SxHxM5eo3On+UvZxdAcvT/mvjLw82bYaccNFd0YOEbPX
	7yn8YtnhO3PMVtDoImy3yuEo9KkR/HKLfVFnq5ae1F3YA3UDgYUcakjLnqCC1Hv0
	Dcscbwm94naO04rwPxiXWUdNoQ1TQ9I3+ZXr58RL3lxWs32stz2/bkzxD2hV0xgb
	X/yM+hqqqVf4YlaBYbeoI1LQTmSYFle7+PXMOki0Tq54Iw1luHiyMjfnIxDjizIU
	Dx6g6Ds5EmFUY2M19o/MWh61vS6GIKQg8XuwxsdgDEGzSwbdnqrg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46sdw0g688-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 May 2025 12:48:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54LC9E5E032075;
	Wed, 21 May 2025 12:48:50 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2081.outbound.protection.outlook.com [40.107.236.81])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46rwema98p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 May 2025 12:48:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=appyCmoudwuoWEuuff2yDgvh0v/6WY7d5EPcHyWxHq3+/YeMYGa60JGx8neUxAn1yuNYFAW5XZfaMoVQSUnEAam2o/6POBgMW0z9bmQiXUQQTmKkv2vJ/JVsQRKQtlHOWeceE5nM5tB1Ptwvu8/n0yTVj1YU0FRi/luBbEZRDtE1DI5kVBu1qDHTpH2JJaIgPLmDjs+PXC7pLFxMcZMHK8Jay7oqcxtSqPDTzbBzLPx4BvVS2DvcanpMWjhS2a3K6Ito+QIXKpadZIsOCB9HD/dwprfRirfNs+a24XkWNRy85GHLVf+Hlv3+xC/J30R+r2TWIVx6xNvBeYUYcns7GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNZJigumJAMkb27tWDVjNseQxwJYJeAnmZilyc6jis8=;
 b=SAbkgZeaKeMzonGH7M+FBuNYgy4urVsNISRAe74FegYzpVJhy6jb2g+XCQAK1FPHPolbl1QHPwVRz2dBdyLhsxOeHzhWHryhSc45ENZEfigBEzwwxzdYeh3cGuQaNWNwn2g5UEg8Z+SkJBV7CQrDqF2BfCQ2u867h2wLmmrtEVYuZyTlG3cTNeLauFe4HURao7ZdBNX9wNYjIDS4krH7XZAV6b1vNG4F6A4t90U7Wkdo5UCZwmI2bLhNaD1WBRXP4iiBca8/g45GdL2AeK0WpPPejg4SmEENfi/n9uKbhggWHGtwxSXpeYWhwfYzNayKmfeaeUkk+KrF+riwW9UVfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNZJigumJAMkb27tWDVjNseQxwJYJeAnmZilyc6jis8=;
 b=0F4KVDJZpU8bg04CyZjDAanQ5UZMv5uSAF0TJHnDr8Xf468s5BBJ0vaYyXwLolIR+33YVvRARA2ir6aRW/dzo8jbmdFFiFShwosBncY+9coM/5a/ubDkj+t9vsQ1CfgVfdJjrTUwl+mC89BJs0eR38Xa2pv4omysopDAzK+Fe5o=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by LV3PR10MB8082.namprd10.prod.outlook.com (2603:10b6:408:27f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.35; Wed, 21 May
 2025 12:48:47 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 12:48:47 +0000
Date: Wed, 21 May 2025 13:48:43 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Ye Chey <yechey@ai-sast.com>
Cc: akpm@linux-foundation.org, david@redhat.com, Liam.Howlett@oracle.com,
        vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: fix potential NULL pointer dereference in
 pagetable_alloc_noprof
Message-ID: <257c094c-522c-48c8-9bc2-70571dfb276f@lucifer.local>
References: <20250521124008.36139-1-yechey@ai-sast.com>
 <206c6dc2-792b-4c73-a922-eebd03864d2c@lucifer.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <206c6dc2-792b-4c73-a922-eebd03864d2c@lucifer.local>
X-ClientProxiedBy: LNXP265CA0042.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::30) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|LV3PR10MB8082:EE_
X-MS-Office365-Filtering-Correlation-Id: 60117e3d-5e40-4a69-d348-08dd9865d406
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PalNMqffcNXYYFe2Yr3gET7XZR42+fj/zYRS5VYRFCDTAtxWnLBAFG33l+Cq?=
 =?us-ascii?Q?g/gQASQ1Ts8ZbG6OvjGu2fIcgJ9aG59i5bLW3pMK+WS9Nx6NqgXZtJ0x88bF?=
 =?us-ascii?Q?+bo8QEptXTZuDrEmq4leIaliPm1W5DA6O5wvuvSc9/YrPXRXmq+bQF4VTXj5?=
 =?us-ascii?Q?Nf9Vsrhn1LYVTMKcZm9+Vn5ANcuPExDdVAvgdDwS2xLJtaUJmsPCV6VdSEJb?=
 =?us-ascii?Q?b0ses7GFgI60LsLqm6IjGjZQLxsUxyjAb8+fseZVlVYg2xSGChhZYcP9HuDt?=
 =?us-ascii?Q?vSmZMDfSl48AVoRs/glnWmBjCc0k6Yy5WiJrGFFnOIXq0oLmlQNQwxuX2DQQ?=
 =?us-ascii?Q?Zd0mUcIVUdd8F6a/E43uP5qg4hUm11jAHFxcWAi16/kUHM5dC6y2YysZaTHL?=
 =?us-ascii?Q?VZQUihrvNpxkllGrf63eS5wVZadwdTAutZZWGy/jaS5133klAbEtZfSvZmQv?=
 =?us-ascii?Q?C/pb5SxKlEs8LGBIlxy45YPIrjC3Pm18Nevit6QIji364OyvdHrDRHwSR10h?=
 =?us-ascii?Q?a9Y+jR3USquHkTF1ZS3uMH1NujYkCL8zY0Rqmd8CgoOLX2c5u0g42eXBxZBq?=
 =?us-ascii?Q?+JooSegISQDTDxCsI1l6GggAc9AQ6DKwNNryiGOo3eCRgAC6+aGB3mKka6bw?=
 =?us-ascii?Q?liVWou8VBPwijOB6TqZJQg+v++8e84/1ss/jI24yl9qoqPxLmBbvIv9eeSoT?=
 =?us-ascii?Q?rSTrPB+d5QZQIi8RKupf49SnzXO0cB43Un5tNPYqPZKdB4FslHpc9cOVH7dF?=
 =?us-ascii?Q?xzKRkjDEhqu21mVLYKUIwWK91HfPKj95GbTuXRMp2VB8UBACdfVvoTkqGZVJ?=
 =?us-ascii?Q?TSd3urW+MsWbM+fhzrgVtHd4FNM39oBF0mzN8SINu5jmsmzkfZmJsrLz+qmC?=
 =?us-ascii?Q?idmwdGbOy52cc+imDeIhPvt5dD3NYAZXsUNTBOU88YhUull24qxGKk+z9lpe?=
 =?us-ascii?Q?F1BwAXxGAEQ8r11udT3/FDtOcPaSPQTlwt3rzjTqwDqIRylBKdMwd0Wc3Vhe?=
 =?us-ascii?Q?1LP6RWTn3cAecmzhWTCHuIdfiLJGPY0tlPzDxIfWM6GRnZ+MuWzCI32w/+Am?=
 =?us-ascii?Q?2FdCYAWq4K7ZPDN92l+uCVgqRnfpQ0cz3AvE/KjCj+L6YtnqMgAN/Kx0NuHo?=
 =?us-ascii?Q?RGuosVLH0GEJU5baGfZB2Kf+8i1GImV/Z2TKeziUOQJvLy1Xod5WyI6P0xgu?=
 =?us-ascii?Q?9mt0VeAjv6ziqRONtA8oGMLLEniVErhf1TH8znVuGL7a4aK5ryuwdBNIdlOu?=
 =?us-ascii?Q?XfWNKluyLzKb5k5ZHKvpBOSZaJrSL4Yu3SrWIbnb6RgoLeQF/4aHtWE2z1Hi?=
 =?us-ascii?Q?JL5ooWorDLCwyCuxIQ2Q4ACbzXWDAHESahsIBDyvLZhsLN7JluvkcC1Z9qW2?=
 =?us-ascii?Q?mlxgWFMLoA3CBv2SfGyLQ7ktoiO7GMJF3JaArKiBFAG/M4bY9qEbl9rHJdaM?=
 =?us-ascii?Q?4ql0wl2raRA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Kx4jg3y5PYIjFty/I46cpZhhaQBtxkIX5xi14Rs0qP+DKqXdQa/CqlghFaEA?=
 =?us-ascii?Q?Ja5kKI3M/taasTWo3TPn8OnXVx7/cTnrTvcSNBjHeUwkCdMtV9xhCEgSA9jq?=
 =?us-ascii?Q?drsDtKdVDPSaUGe/hdaL5r7W/grIbXrL5MulwLrMCPAsGkJF0HUenfRScJzU?=
 =?us-ascii?Q?0r4bYIvNBTSY4qTD336hBGLmxDaCysvpXGeZmRyZTcOXxK8vgu5SYRpXwEcL?=
 =?us-ascii?Q?3gK1i5W5//gc3rL0zfosJDUL3gnntirX2uzo30CuoLONteI79pINwEDIrdwk?=
 =?us-ascii?Q?ncKqnh3jzutROaxlphIVQcb6YHpPV66rLQHKQg2CbK+Xh1ji6qEczKShjAE8?=
 =?us-ascii?Q?Udj0wGK0vuj8TInK3OtGOALOb0R9v3zidqsLSLATgFhhiK5kQfa3o/YdEp6u?=
 =?us-ascii?Q?E6jMLxXioTekNUoea+3JBOfBqzWSrnwTUIRKjbaHuf+TXfoerJNWq2Ream3x?=
 =?us-ascii?Q?4iSaQWK0mGqW1X2trE/+yrH65Kt64IQXyPJJYbwcl3lLFO3RApqai0ZnTn78?=
 =?us-ascii?Q?eeZu/+0r5xzEU0Yzz+KxIL24/VAYNe4lGUiK0sOex1VboR8Wxj9aZB2iMzCM?=
 =?us-ascii?Q?ULUlWvGk3hzt79e4S41Np84N/tI2GxA+WgQ/zkkQHIVA9kFwFn3MElHisKeR?=
 =?us-ascii?Q?U0pcgOXBPQQonavOhTwvrFiRhtku7UFv1FGpeicj+BlofF9Ei6ZD3Qskx1l7?=
 =?us-ascii?Q?WrWtBkNKm1kh3CPHRXFt7CnF0QrLSjX6svERNhOX5uCg88jvvS4m2cXeKK+b?=
 =?us-ascii?Q?4zaTOVg1zcBl5QeNbiep/8lMIDHmB8NMhis22Ypxfp4DmoukkNyLDKT+fiLa?=
 =?us-ascii?Q?alwkvKKnIW7p+xN1u2z3dWnO1r/Wn+Clh9YCKkhMqFf/YJIMcbSuk4YHxzYD?=
 =?us-ascii?Q?6L++0W5KV1lk8WNdYIgdAFDkeEZI6+ywjgSCKUOYJ9ZhPoCpZgkF9SaMa72Z?=
 =?us-ascii?Q?0+v+TWbBsg6vGNPnSFYrB1F+v6TrX8g/hAGpwL/vS+xQ66M9/pgdFk4MYwTJ?=
 =?us-ascii?Q?ZQMstjDtLYZNB8yfnA6QG0OS0/ll2CZe+oVM4cILRw+MDAV/oVYRJfoBCUbT?=
 =?us-ascii?Q?+EZozpUd9QqPGfBcCorMh6yeFxc2rlsMhrfFCgwjq/5TI1JjCwBWBJnfXBrH?=
 =?us-ascii?Q?VwrZL0meciHUpYsVdXg38WUQQxObr8Tl2JTh8ZAi3h/pngNZVdI2E83Oij8T?=
 =?us-ascii?Q?5lwss9csJ6Rg1gpgUqSrnONsU85kzkFAt7ihKex0LfmBzRvhXmCV7WfAYFDe?=
 =?us-ascii?Q?PQGADjXYvB9MJjunaZFceMko5LST6+2yOYGjIxoHeroX6rG1HeVhYqpwwRxP?=
 =?us-ascii?Q?NfMfPPY8cBVkJivC9TGfp9OfzzffYohZwlevM/k4FBRbb67cgTtMQeuR30lN?=
 =?us-ascii?Q?cHDWk14bU4MAJjd23gmhZlWrupxg7RwtlEc8pZC4uOE9QfVR0r8bdXXp3yMR?=
 =?us-ascii?Q?IPZGQiG6ShdtUjiVp2fNRWksIgqcRMllz0TYheEy7LnZb1lGaruxv5Ej8+bj?=
 =?us-ascii?Q?HL7RVQDZBRMLJXhikD85MUfbl52XgomTqjJ4/S9GmrgJzfSaKBbUKoHHye1M?=
 =?us-ascii?Q?ummSUdl9MaT6eZGZR6tDz/4WlZzAN/rzb3RpUJMCfo8QRlgOAbRWqctGxD0R?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/UCaAcbCTt89Tc0GQw8fVlf0DYRgFX5MUuTVP3XFQxfpytXJ0lhl+cLXxadRrOxVBtrDwPYMom1Utc5BAmMOPgfn60Ml5AxVFvMC7TN3wQxkXt24iryFzeBk3AFqDllutbY8T6gYKZpa5vVXoECgSm1v7NlUUUrl0zFVcvN58g22zyOnfVIn/j91EmHghFeFtHjrg4annci7fpKgtpw8cLV+j7Be0a9PajPk7l/NfhE/PC1vwN30Nr3IFPFYGX8LGZPMJirYCXbZY7yg7yxB0B4IFD4XbymFds62vyxnlmd8PWA137CDtxCt7T5okzoVG3Js56c/gz+vH1XdzquCeQgogxfTeKDgImiihnfbAZYce4c+krXHQXH12cVJbbMAdnr6LiP6gtjsK+R2KiRnHNy6NQ4cMCDh8WSGkazjBOV+fOeuF3VOuzvBKQoR3qKnNMaAY4JsbM9+y7u3+jMlJFRDnf9gWmALvyUfWABItnY6afl1rbZv8W2uAuv7CPYMsKs+w0P5Y08NtRlKV+m1kor0SXsZdHSB/aht+BnUm0s0O5dQykG46haQQ2Td8tEocVX2pFGGstH6ZGH7PHG5zbJFtdynQT9JFS+fL8YNURQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60117e3d-5e40-4a69-d348-08dd9865d406
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 12:48:47.3488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: snKI2uTyKZUK4JaAy8BFlZvmOtAqF/k3eLzywB9ufWNbK+jbNPJCjQenCMe+4eP2AKMBC9OaSrXZwAA0x/6Hq9tuX8KhZ9xNMfNtQvhs3Go=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8082
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=944
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505210124
X-Authority-Analysis: v=2.4 cv=ebE9f6EH c=1 sm=1 tr=0 ts=682dcbb3 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=j-zONnZCAAAA:8 a=V9BAjf1h7JFwefHQV44A:9 a=CjuIK1q_8ugA:10 a=fKQJICQELZFyWpZ5J2Iv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEyMyBTYWx0ZWRfX8O6N3l3LEMmx UX2cZWDTxfkaFuvmU4stsM1IZH0d4k0T76Q0kLiet/VaVWlc9Kbm7dViwhVcP0fgCKPVVSeUaMQ f1pv1cbccLuTC0p6QQjOEiyXoOUmCLWTEXztiW6Yni1faOwwjetdSlZE5lGFFiIyV53KBkH3bi2
 VoPu263XVY6MfKWGgUpP0nDt/ZkHcqb8AudD9Mkpe4VhGCqGaqHTqKgImV79VAdE3tC2cv40h9G 2h2wD9keiiJZRyB2Ofo8PQMbJDSA25Ngmvqm9+eUPsgvlKmexL/qtXoKyU/b+tiN1bWLi+XQd6j 6J6AeWW6gSAeROclRagJj/uea4F0XNojcwbREjJy3eVNbzGGjXJSKO4AedDHK7MF0NT10YOc24L
 K+CPzhfCb8yx/rm3F3/QkLBrSJoUC66jVxPn7KpTGi6HStHTKKt5rp5x8BD7wqQgg/tW62Y6
X-Proofpoint-GUID: KmUBA-txX6u0nNBGs2OI-SXKlMuknXtw
X-Proofpoint-ORIG-GUID: KmUBA-txX6u0nNBGs2OI-SXKlMuknXtw

+cc mailing lists

Please ensure you always cc these when submitting patches by the way :)

On Wed, May 21, 2025 at 01:46:48PM +0100, Lorenzo Stoakes wrote:
> On Wed, May 21, 2025 at 08:40:08PM +0800, Ye Chey wrote:
> > The pagetable_alloc_noprof function does not check the return value of
> > alloc_pages_noprof, which could lead to a NULL pointer dereference when
> > memory allocation fails. Add a NULL check to prevent this issue.
> >
> > Signed-off-by: Ye Chey <yechey@ai-sast.com>
> > ---
> >  include/linux/mm.h | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index bf5520693..9052bb531 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -3000,7 +3000,8 @@ static inline bool pagetable_is_reserved(struct ptdesc *pt)
> >  static inline struct ptdesc *pagetable_alloc_noprof(gfp_t gfp, unsigned int order)
> >  {
> >  	struct page *page = alloc_pages_noprof(gfp | __GFP_COMP, order);
> > -
> > +	if (!page)
> > +		return NULL;
> >  	return page_ptdesc(page);
>
> Doesn't page_ptdesc() just cast the page to the appropriate type? And thus can
> handle it being NULL?
>
> >  }
> >  #define pagetable_alloc(...)	alloc_hooks(pagetable_alloc_noprof(__VA_ARGS__))
> > --
> > 2.44.0
> >
