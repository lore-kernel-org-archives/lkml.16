Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE58F25C713
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751287978; cv=fail; b=oJMPFh6bCcu6TYshPKS4vBsM1NeUAhpgNNkvAoMm9vQxFVfqelhpwCxm0mqn1CPoBRDY5UA0dTnk6hnoKk6eL9vkDoD/s2i7rh8U996N39i+jxEYgox1zMSVz+i0nUc2Fi3MjSc7DdAtb+DQbzn4/IP3xakzO1iKeocvKJbhkts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751287978; c=relaxed/simple;
	bh=kvttpTbmxvC0Ik+UQ8hLWZu9vSkSGaS5pbnJ1+FEC4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UTo+cHETb0Q95fx2+tLmeDS3cuBPJYFj8GwALI/dyxvA9bt9prrCqPEKIaTlR6qeDxwdpq9W2sbQSq1ZTJyKTd/Hbv1pca4dKvEE2kr8n1Yn87fcQpNjwMVxT2PBkKbjqFuA8kJeKowXPOXRsefX4vnvGCZIFOdkXhhKAO0OmuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=L2dcPR0d; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=O5M7FFP9; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="L2dcPR0d";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="O5M7FFP9"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UCfhKN016609;
	Mon, 30 Jun 2025 12:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=u1Rnt4cRf6XO8xjWlp
	BXoABIu1cte7IUGPtWMpFtjzE=; b=L2dcPR0daco3AFQFCElUxIuiTv9jFKFEQx
	zmigHsh/nTcQNxi26uWZg+fX/YPofUBSOckxPkJgANwoieVFucHfsJTG+Pny/zpd
	q9ZvwY3pj9h8F98CaLhbgEwIJFMMv0Gswxs97lFJnY+se01vqvfwbu/UlSIodq01
	/Wfo/sfqctsiYt798aPYdT1BvGWvbTsfZDBhsgEpwFiY16gr1GPPjL88ZqT+KWip
	AvdmepQenm16wg8dZDarmLZ7sCiHiNcscSfoaxmhxOVMmKvZZdKmP277ZoJIosq4
	DHuElU18IityWQlsPux2lBGc+WWaxw8ZQHx51BWyZbteWcfYLmYA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j7af2ed3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 12:52:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55UCE8t2009044;
	Mon, 30 Jun 2025 12:52:24 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u8a6p9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 12:52:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OiKrD90F9FXcM2/9JBoJOgL8eOf9GBc91kkiehIm2Jopg3lxs0kqMBJLyEoI7wjLZcKdPZ1vVyIF4h2H7IqftzN6ulUgpmLmoXEnB0lOUgCYqev9sxxFGbcXDecWvxbnl62IZK4CdAxe9CQvSWKB2AhFx3jd1sAtQsDM9v7eDTm59Co8NrE+d6/EWsme2FgC3VyZX0vDjkmh1uuXcTKd9N9dNjGelIMqO545+rhfB+YoBLKJK29Us24MiUXpEbYpEuEEB28P1mK3QXLcG8KzD3z64d7CFL5LshMk9rySIj2xbx7BIWmNHzpKmm+Nkvqcr62ideeM9vGkhdOEAFaTsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1Rnt4cRf6XO8xjWlpBXoABIu1cte7IUGPtWMpFtjzE=;
 b=eRuEVwZyxhwhPYvvCpWEtKoj0gOJ0bRzNb4YQe2gyWaxW6PogKoZ4O4H86tBCkYd3lSZUZMGxjaGIn2BkHReAFcjgVIBBD5PbAlFVVOJJvxmKTP+UFlqUIeqNaPcKWZ9Y6g1aJIwi+BJJjxpJ2+7GBrVR/5/5LLmuulj3mb/xA5v5gHmfR9g3pZ5hR7Slevx3Gc7aACL4f5D7rrdoDeJtayK7jN6JpQ3GzUb7dt7tCm8jFketNw+H6b3dGuYywb2w4vZtADQllDWQIdPYPdizpBW3bGtCSi1b+tMuIvLKTYREIHa3w1ypnYaHtk3vAKFJizBPJfqjek3GC9TfQw8Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1Rnt4cRf6XO8xjWlpBXoABIu1cte7IUGPtWMpFtjzE=;
 b=O5M7FFP9Za3AgTcOXU/maNLnOu/Z/rJuWp8dt6ZOaWWmV5U8Ch4/hxOrY/oo8PPslaqcfAWLNs3CC797V3wIGuFLn1hKvtZ8+xf2MA+//qt8aJKtQ/v9sd/wJNDw7ITncP2Cb4+JCAOofJqT1X2fy2CLLvQF1puj0IGmXDrf0ws=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM3PPFB0C5EC304.namprd10.prod.outlook.com (2603:10b6:f:fc00::c43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Mon, 30 Jun
 2025 12:52:21 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 12:52:20 +0000
Date: Mon, 30 Jun 2025 13:52:13 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, david@redhat.com,
        willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
        vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
        peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
        baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
        christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
        linux-arm-kernel@lists.infradead.org, hughd@google.com,
        yang@os.amperecomputing.com, ziy@nvidia.com
Subject: Re: [PATCH v4 3/4] mm: Optimize mprotect() by PTE-batching
Message-ID: <0315c016-d707-42b9-8038-7a2d5e4387f6@lucifer.local>
References: <20250628113435.46678-1-dev.jain@arm.com>
 <20250628113435.46678-4-dev.jain@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250628113435.46678-4-dev.jain@arm.com>
X-ClientProxiedBy: LO2P265CA0184.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::28) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM3PPFB0C5EC304:EE_
X-MS-Office365-Filtering-Correlation-Id: 715c1fa2-6d26-440e-88ee-08ddb7d4f141
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3khjY0dHee88EsFwnEULeQV9WGA2Av248mTGRTGV3ndGd3/TU9P0R16NqTGv?=
 =?us-ascii?Q?dWLsLukvi0i6LedoAIfY8JHmXabW8epGHXRhoM9iRGed0DoFrqrw8EmqoSDV?=
 =?us-ascii?Q?hIZzmF4vmYjqjdgHElCVfZ/ODUdAgJG70ZsW+Oc10/A67I7RAUkmaYelZW3Z?=
 =?us-ascii?Q?m8CQenDlv2ZsMbH5WDDiAWYjurDM6UWAPo0xNTtIYy63WZHhQoaQlBPUEeUs?=
 =?us-ascii?Q?GoHtNgRVTh0FqUuXX69S8eJOpo5vdJP1IcZ/gH/GhWCbOe8hHHmKtSWDy3Wm?=
 =?us-ascii?Q?jW+AZW8pQRgCyWREiSuklD4QkvPAOVGW1IsOSJI7GDxUwDHdppDqwgy4RYQh?=
 =?us-ascii?Q?w1tJLaTDNDSNZMtG3xOihdZjD0iFLW1nMzXB5D9ypulLOH6JoouNC7dtqaSm?=
 =?us-ascii?Q?8rWiQ3wmv68GhRtTPfPAkFprdwieOFsfKWadDWsyYb2LaQ516+i0DPO2jyeQ?=
 =?us-ascii?Q?5dn9tdgafdug6+hUcAJTQUCAy8//Su2jld5rA5qz5LoOBZTvqpLK6SGiuV7U?=
 =?us-ascii?Q?wa7EKd+uwOaReBLMzy1psyPkO23MpMXQSZaW0Te2BbHcyxOPAFpbzsy+mnwz?=
 =?us-ascii?Q?DPhdUAUdMrZL0yO6Fq9k9dPO8puMnOH09tub34pEp/zSi/8NuUm6utpW6SMt?=
 =?us-ascii?Q?eroqlskx3ixp1s17T7m7n2G+O5qiaXXYDTfN7ysqwspKm5Ob4zBuYxvbzCBV?=
 =?us-ascii?Q?0OPbslq4DMdZHT+KXoKh6XrdqAwLPMVXqZjzxJb7tOBIkVujCBoCvuF9sDub?=
 =?us-ascii?Q?1tJfziJGABPgHic5brpqnE/jGAoWoELTN5igpiCkanwW1DtDi5cru/2OrybP?=
 =?us-ascii?Q?SJESdN6l8kYX/x/omkqKrAq/RcumsBHgullOvhOi7YOhsNQeyFJSWYqb4Trf?=
 =?us-ascii?Q?9UNbiMahb5+ImYSPd5Wb8BVE/EV1k5ugdAjHJQzs3//YX+upJmUCcmS2/0jK?=
 =?us-ascii?Q?ZjLwZ9jv9u6mZszMP/6sPBqqyM6hCnueqZKdUZU9NvKcEsdd0Zu1ggmh9n5t?=
 =?us-ascii?Q?2LNAMlbcsX/Q31X55QoYf72Y/rkFjpFJEK5XqDfvBYDCpugAuUoVc3rQkp0K?=
 =?us-ascii?Q?jS5XK+qnt8EgtmichMpHdqL4LpAvIfE6cmZ+ZWPLRwCClWkHHxMx4PrHfeV3?=
 =?us-ascii?Q?G67tm6mi3UuvsnaOyKuo+5gTrBBpu3LqbKikv/R/jz/uaWABJ+G1gDTfmgMh?=
 =?us-ascii?Q?sfYlccIl2DDQB/HwzSDUxOARgmpU4JsRKEpVtx8QSwo8jRAZw+bs7NJSkwUd?=
 =?us-ascii?Q?EIW58+3IIRaZSa09m8zwE7KYAEeE72EC7iQNQ8n4/Us6gMtK6WlsjpDcLGpn?=
 =?us-ascii?Q?++3MfTGdSW2MP/M71vRFOz4Qm510vXLyhc6G8Z05n/H0TI35Nx9DmdtIOqCz?=
 =?us-ascii?Q?QGH0k0UtVmSqoYS2EFYvS1HTRqN2Xtvens3oxMQRcStQxV7g8G3oV1+qWdUT?=
 =?us-ascii?Q?maIUX/Ahz6Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v12Tdzny82Ak12Kcch6uXxP6vG8cLR8i7iGN5sZU1cZMesKgQdlHjsVCBElP?=
 =?us-ascii?Q?fXHdn3vSMjT+e0I852Bq7NleWIrD5QONg06wziq6CJ0zYlMd7CXLGVIVaWou?=
 =?us-ascii?Q?/1g0HowGzflxE3w1Uc3trSNZ4rYOEoNf9B6T8oKRAUrWZYeJ4JC1RBGZ+W0n?=
 =?us-ascii?Q?mveuUr3OPJPZzVReanF3OzCIa202YLS0O7zGGPIXN2VATQTafhVdIOHvxeYD?=
 =?us-ascii?Q?g9ogHDNiPTuNs2oagWzdWquGu/qoLrQM09WjmOncfCW2TMNz0707tsxM+nLx?=
 =?us-ascii?Q?Aj71GHy/jTt6wuSndfkopE54PObzj1vpty77NvK5hGRPZ8+d5cY6bJ7wuQsB?=
 =?us-ascii?Q?RdBj4PBA+VJD87LAYAsCsF/7HZjKEeUXBNLxl6nninN5YWzO3FMO4MKapqm8?=
 =?us-ascii?Q?dVSISsDwcZSEG3mjvo/VI4m4rbBmwMVJ9SmnJ4THZfCait+JD50aRKlg8eXs?=
 =?us-ascii?Q?/YE3pmpnPVwIMcKLH6z0BX7MhdXG51zR78KH4My4aMAAGeQbwz8jP1DILofy?=
 =?us-ascii?Q?8C15SW9ar+E3DWSVtTEqafrgnYozh4HwVx7uaCxkyuwwbsQNgBPfEXnVobcx?=
 =?us-ascii?Q?J9ejnZllBtJ1c5UyhAJNhDwYjVn66BPMSALR0XTXeSfVnwBSbDecuYVkxZh7?=
 =?us-ascii?Q?WIRD6LvKXVdoqljqG9TzumzJh3SNIo+kkqo5T9JyWkWMwop+9o2bAy3noTCz?=
 =?us-ascii?Q?vFWdidg10NYr8cUf1N4CJeQ/WXZ2FYYRE4QZXIa1wblbntTWbrrjjRQdtBrR?=
 =?us-ascii?Q?jivS6Hy4vWbHLVgMyIzz9L6sewLpyaBlUVrDkqODpVqOnZjce2hjBYXRsQso?=
 =?us-ascii?Q?wHwZqo/ZHmItwX4C2rmNTfj7SpY09vCgvoigdPtwbXtzY31W5wem5tblRs0l?=
 =?us-ascii?Q?nP9wP/0C+YXmvI99Fc/WX4X2Ntd260KoI7S6g9nNYh0gicraDMyHCI1JCwzP?=
 =?us-ascii?Q?/JzJnoawJF4hdzTNqZCwewEXrX0h51jX+mmk4Htpb2aEKl3HXMc7aiOsVxYK?=
 =?us-ascii?Q?mrVvzc8nqmF4g48vcImtJFYNQHy5lT5owNOAxkwdhKUhD5ExQPhst1WQm1Qz?=
 =?us-ascii?Q?8+3IWN7Vsy2DXkYG4Dgl3tifVYbjBCmVXNeUfgDc09h0IhCYTRI6eKDTbNTC?=
 =?us-ascii?Q?ZhGkOfVaWG+4vfCu3uTuEoqbYNPdhqg0mTVl/8TXsZ1uOfDJxk+OrPPCyn4+?=
 =?us-ascii?Q?3mBwYcaD5ABLPdwLMKzcHs0ffL7Z7rAk3OFHO8pduuAJc3wGo5qki/l7kEmJ?=
 =?us-ascii?Q?e2n1OAcUwecUa2bu8vD7OgId2sG+7ZN3L0TV5r6opJxC/98vvOUfvOzAMJeP?=
 =?us-ascii?Q?x+GGI84pjY9PV6c7zH+3H3gtukeCTX4nAsvM0ODN/TzXI2is7X7XkhV2gp+U?=
 =?us-ascii?Q?37eA7tgBVRjbWB7W4b9sfCl9bRfoGZ2aON5Nn5gSUMhwFYuGO2uh4JDxnsBM?=
 =?us-ascii?Q?ZIdZXo1E0/Dedq/RNquPsEmor3H3AhJz1B8CbJc7Af53rC5v/NmoGM53SbEr?=
 =?us-ascii?Q?55gsH6KQoh5boGKQcb3vLn85LPWWjdOIn5Vqq+JTjyYIGMCjbEUkqDMPcfRD?=
 =?us-ascii?Q?+VVk6swoifuSzHOQdM1HhfTmwycRtLrEzLghATvxRreXDD6oZJaNdnzXaMXo?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	V0A7uPrsYUHwdCNULuA2+lqAOqgnDVrLCafYpyeZ8FAQVvKRgqq3HYOmSM6f7K98EuT5q6bBEEvacK2P5jeY2bcAE5PNm6/axKj9UwOKJ9DA5lIB0iXqVb1KSmvee8+zspEWZK/N0JLg7hRcJ23y30Qou1kmSJbjwwjdq222aRqHy6kdGZWPrkK26Drc0uVbmbZyjkVDXx2n3WluNovIoCCReJabeqDWFiwuLsAtl3fpsWEKB6Bv6cdCLcWkL8s0tg0bEKMfR5WCVsejCGdNZ6yQqPGvcZqhTjkdIUWd2SjJXwV47X7Gb2waNNRRk/7vNZzb0849SCafP0/yCz/EUCR0mR4DKmPOm6L0rDoHeNu7sOfMO/G1oGC2ko4Eb4afqCkAec6xTEM11ybDLgb+hbspR9ltuBujFrl6PthD6Gewgc+Pgddxf4gvn8z5yPHKtOCIUfJd26FNEJSBfY14/OJ4hW+CBFezwLhZ8zs8SCy2396HgEElpBdXW9D3ukWhvYxoGzaqIU4L9qCV3c4mCum+rggVrBnBKyFhpML7uZVFDOkw5QT1CQLuQqaNUE9oIl9b9Y0dHuYnbC8v50OujSYvOIH4RYAInEVIiBk0fLI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 715c1fa2-6d26-440e-88ee-08ddb7d4f141
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 12:52:20.8547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CoFywUdSyqS6glamcBxpPHBy52I80gnz0ODSR+q3mA4HIf6ZUZYqkAi9K4sUu1Cx3IbzxI4wyIj29zh8QzY5xbxoisZE6NQeDGYKyziPFeg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFB0C5EC304
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506300105
X-Proofpoint-ORIG-GUID: bFbNxKDERIiCQMxY7c7IHVZiYNFVIPbD
X-Proofpoint-GUID: bFbNxKDERIiCQMxY7c7IHVZiYNFVIPbD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDEwNSBTYWx0ZWRfX5d0X/6tDE9Ug 4WWjtaVWh993GzvAUwZy2K6IoysibIE4m0ML4F6OgaDFiUQb8DDKmlKyc/kPq8xq2zGxJB7EVsv iF2TUWr4A01NBOopo+YHAnJjBwfH8mkm14XKFVXAC7ugu+9u7qa3WYsfZ96d3b7ctCpWVuYWzJC
 mJTlQGvYs29R6NmjDZE+AD0qFzsn2I/2UIV4OZALZbAPkLPpKXeHqBUQn7krAw6WW/BeWNBHYms T8VLVMiNhI/9M8X6r3mf9HmpU66C8ydSPCBfOvQlzm3uidbFGsJ8KT7ia0OBkCXJBv/C6f3QiBM QQU6LEUsDm8iGITS4l7ORhcNRnGlWcIP+2vuVXGyORiwfw50ip0IeGd78ROT/SUgxq6eBd+jNO+
 Hb4xgxzvmBMwt35xRu96SbU4gvGK4sburKhrEAEh9pG2LukT4eVIfmRVsuSRTUmg/nK64jdO
X-Authority-Analysis: v=2.4 cv=b5Cy4sGx c=1 sm=1 tr=0 ts=68628889 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=cTZAACt9iXS7hjOPiPsA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 cc=ntf awl=host:14723

On Sat, Jun 28, 2025 at 05:04:34PM +0530, Dev Jain wrote:
> Use folio_pte_batch to batch process a large folio. Reuse the folio from
> prot_numa case if possible.
>
> For all cases other than the PageAnonExclusive case, if the case holds true
> for one pte in the batch, one can confirm that that case will hold true for
> other ptes in the batch too; for pte_needs_soft_dirty_wp(), we do not pass
> FPB_IGNORE_SOFT_DIRTY. modify_prot_start_ptes() collects the dirty
> and access bits across the batch, therefore batching across
> pte_dirty(): this is correct since the dirty bit on the PTE really is
> just an indication that the folio got written to, so even if the PTE is
> not actually dirty (but one of the PTEs in the batch is), the wp-fault
> optimization can be made.
>
> The crux now is how to batch around the PageAnonExclusive case; we must
> check the corresponding condition for every single page. Therefore, from
> the large folio batch, we process sub batches of ptes mapping pages with
> the same PageAnonExclusive condition, and process that sub batch, then
> determine and process the next sub batch, and so on. Note that this does
> not cause any extra overhead; if suppose the size of the folio batch
> is 512, then the sub batch processing in total will take 512 iterations,
> which is the same as what we would have done before.
>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  mm/mprotect.c | 143 +++++++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 117 insertions(+), 26 deletions(-)
>
> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index 627b0d67cc4a..28c7ce7728ff 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -40,35 +40,47 @@
>
>  #include "internal.h"
>
> -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
> -			     pte_t pte)
> -{
> -	struct page *page;
> +enum tristate {
> +	TRI_FALSE = 0,
> +	TRI_TRUE = 1,
> +	TRI_MAYBE = -1,
> +};

Yeah no, absolutely not, this is horrible, I don't want to see an arbitrary type
like this added, to a random file, and I absolutely think this adds confusion
and does not in any way help clarify things.

>
> +/*
> + * Returns enum tristate indicating whether the pte can be changed to writable.
> + * If TRI_MAYBE is returned, then the folio is anonymous and the user must
> + * additionally check PageAnonExclusive() for every page in the desired range.
> + */
> +static int maybe_change_pte_writable(struct vm_area_struct *vma,
> +				     unsigned long addr, pte_t pte,
> +				     struct folio *folio)
> +{
>  	if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE)))
> -		return false;
> +		return TRI_FALSE;
>
>  	/* Don't touch entries that are not even readable. */
>  	if (pte_protnone(pte))
> -		return false;
> +		return TRI_FALSE;
>
>  	/* Do we need write faults for softdirty tracking? */
>  	if (pte_needs_soft_dirty_wp(vma, pte))
> -		return false;
> +		return TRI_FALSE;
>
>  	/* Do we need write faults for uffd-wp tracking? */
>  	if (userfaultfd_pte_wp(vma, pte))
> -		return false;
> +		return TRI_FALSE;
>
>  	if (!(vma->vm_flags & VM_SHARED)) {
>  		/*
>  		 * Writable MAP_PRIVATE mapping: We can only special-case on
>  		 * exclusive anonymous pages, because we know that our
>  		 * write-fault handler similarly would map them writable without
> -		 * any additional checks while holding the PT lock.
> +		 * any additional checks while holding the PT lock. So if the
> +		 * folio is not anonymous, we know we cannot change pte to
> +		 * writable. If it is anonymous then the caller must further
> +		 * check that the page is AnonExclusive().
>  		 */
> -		page = vm_normal_page(vma, addr, pte);
> -		return page && PageAnon(page) && PageAnonExclusive(page);
> +		return (!folio || folio_test_anon(folio)) ? TRI_MAYBE : TRI_FALSE;
>  	}
>
>  	VM_WARN_ON_ONCE(is_zero_pfn(pte_pfn(pte)) && pte_dirty(pte));
> @@ -80,15 +92,61 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>  	 * FS was already notified and we can simply mark the PTE writable
>  	 * just like the write-fault handler would do.
>  	 */
> -	return pte_dirty(pte);
> +	return pte_dirty(pte) ? TRI_TRUE : TRI_FALSE;
> +}

Yeah not a fan of this at all.

This is squashing all the logic into one place when we don't really need to.

We can separate out the shared logic and just do something like:

////// Lorenzo's suggestion //////

-bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
-			     pte_t pte)
+static bool maybe_change_pte_writable(struct vm_area_struct *vma,
+		pte_t pte)
 {
-	struct page *page;
-
 	if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE)))
 		return false;

@@ -60,16 +58,14 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
 	if (userfaultfd_pte_wp(vma, pte))
 		return false;

-	if (!(vma->vm_flags & VM_SHARED)) {
-		/*
-		 * Writable MAP_PRIVATE mapping: We can only special-case on
-		 * exclusive anonymous pages, because we know that our
-		 * write-fault handler similarly would map them writable without
-		 * any additional checks while holding the PT lock.
-		 */
-		page = vm_normal_page(vma, addr, pte);
-		return page && PageAnon(page) && PageAnonExclusive(page);
-	}
+	return true;
+}
+
+static bool can_change_shared_pte_writable(struct vm_area_struct *vma,
+		pte_t pte)
+{
+	if (!maybe_change_pte_writable(vma, pte))
+		return false;

 	VM_WARN_ON_ONCE(is_zero_pfn(pte_pfn(pte)) && pte_dirty(pte));

@@ -83,6 +79,33 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
 	return pte_dirty(pte);
 }

+static bool can_change_private_pte_writable(struct vm_area_struct *vma,
+		unsigned long addr, pte_t pte)
+{
+	struct page *page;
+
+	if (!maybe_change_pte_writable(vma, pte))
+		return false;
+
+	/*
+	 * Writable MAP_PRIVATE mapping: We can only special-case on
+	 * exclusive anonymous pages, because we know that our
+	 * write-fault handler similarly would map them writable without
+	 * any additional checks while holding the PT lock.
+	 */
+	page = vm_normal_page(vma, addr, pte);
+	return page && PageAnon(page) && PageAnonExclusive(page);
+}
+
+bool can_change_pte_writable(struct vm_area_struct *vma,
+		unsigned long addr, pte_t pte)
+{
+	if (vma->vm_flags & VM_SHARED)
+		return can_change_shared_pte_writable(vma, pte);
+
+	return can_change_private_pte_writable(vma, addr, pte);
+}
+

////// end of Lorenzo's suggestion //////

You can obviously modify this to change other stuff like whether you feed back
the PAE or not in private case for use in your code.

> +
> +/*
> + * Returns the number of pages within the folio, starting from the page
> + * indicated by pgidx and up to pgidx + max_nr, that have the same value of
> + * PageAnonExclusive(). Must only be called for anonymous folios. Value of
> + * PageAnonExclusive() is returned in *exclusive.
> + */
> +static int anon_exclusive_batch(struct folio *folio, int pgidx, int max_nr,
> +				bool *exclusive)

Let's generalise it to something like count_folio_fungible_pages()

or maybe count_folio_batchable_pages()?

Yes naming is hard... :P but right now it reads like this is returning a batch
or doing something with a batch.

> +{
> +	struct page *page;
> +	int nr = 1;
> +
> +	if (!folio) {
> +		*exclusive = false;
> +		return nr;
> +	}
> +
> +	page = folio_page(folio, pgidx++);
> +	*exclusive = PageAnonExclusive(page);
> +	while (nr < max_nr) {

The C programming language asks why you don't like using for :)

> +		page = folio_page(folio, pgidx++);
> +		if ((*exclusive) != PageAnonExclusive(page))
> +			break;
> +		nr++;

This *exclusive stuff makes me want to cry :)

Just set a local variable and hand it back at the end.

> +	}
> +
> +	return nr;
> +}
> +
> +bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
> +			     pte_t pte)
> +{
> +	struct page *page;
> +	int ret;
> +
> +	ret = maybe_change_pte_writable(vma, addr, pte, NULL);
> +	if (ret == TRI_MAYBE) {
> +		page = vm_normal_page(vma, addr, pte);
> +		ret = page && PageAnon(page) && PageAnonExclusive(page);
> +	}
> +
> +	return ret;
>  }

See above comments on this stuff.

>
>  static int mprotect_folio_pte_batch(struct folio *folio, unsigned long addr,
> -		pte_t *ptep, pte_t pte, int max_nr_ptes)
> +		pte_t *ptep, pte_t pte, int max_nr_ptes, fpb_t switch_off_flags)

This last parameter is pretty horrible. It's a negative mask so now you're
passing 'ignore soft dirty' to the function meaning 'don't ignore it'. This is
just planting land mines.

Obviously David's flag changes will also alter all this.

Just add a boolean re: soft dirty.

>  {
> -	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> +	fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> +
> +	flags &= ~switch_off_flags;
>
> -	if (!folio || !folio_test_large(folio) || (max_nr_ptes == 1))
> +	if (!folio || !folio_test_large(folio))
>  		return 1;

Why remove this last check?

>
>  	return folio_pte_batch(folio, addr, ptep, pte, max_nr_ptes, flags,
> @@ -154,7 +212,8 @@ static int prot_numa_skip_ptes(struct folio **foliop, struct vm_area_struct *vma
>  	}
>
>  skip_batch:
> -	nr_ptes = mprotect_folio_pte_batch(folio, addr, pte, oldpte, max_nr_ptes);
> +	nr_ptes = mprotect_folio_pte_batch(folio, addr, pte, oldpte,
> +					   max_nr_ptes, 0);

See above about flag param. If you change to boolean, please prefix this with
e.g. /* set_soft_dirty= */ true or whatever the flag ends up being :)

>  out:
>  	*foliop = folio;
>  	return nr_ptes;
> @@ -191,7 +250,10 @@ static long change_pte_range(struct mmu_gather *tlb,
>  		if (pte_present(oldpte)) {
>  			int max_nr_ptes = (end - addr) >> PAGE_SHIFT;
>  			struct folio *folio = NULL;
> -			pte_t ptent;
> +			int sub_nr_ptes, pgidx = 0;
> +			pte_t ptent, newpte;
> +			bool sub_set_write;
> +			int set_write;
>
>  			/*
>  			 * Avoid trapping faults against the zero or KSM
> @@ -206,6 +268,11 @@ static long change_pte_range(struct mmu_gather *tlb,
>  					continue;
>  			}
>
> +			if (!folio)
> +				folio = vm_normal_folio(vma, addr, oldpte);
> +
> +			nr_ptes = mprotect_folio_pte_batch(folio, addr, pte, oldpte,
> +							   max_nr_ptes, FPB_IGNORE_SOFT_DIRTY);

Don't we only care about S/D if pte_needs_soft_dirty_wp()?

>  			oldpte = modify_prot_start_ptes(vma, addr, pte, nr_ptes);
>  			ptent = pte_modify(oldpte, newprot);
>
> @@ -227,15 +294,39 @@ static long change_pte_range(struct mmu_gather *tlb,
>  			 * example, if a PTE is already dirty and no other
>  			 * COW or special handling is required.
>  			 */
> -			if ((cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
> -			    !pte_write(ptent) &&
> -			    can_change_pte_writable(vma, addr, ptent))
> -				ptent = pte_mkwrite(ptent, vma);
> -
> -			modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr_ptes);
> -			if (pte_needs_flush(oldpte, ptent))
> -				tlb_flush_pte_range(tlb, addr, PAGE_SIZE);
> -			pages++;
> +			set_write = (cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
> +				    !pte_write(ptent);
> +			if (set_write)
> +				set_write = maybe_change_pte_writable(vma, addr, ptent, folio);
> +
> +			while (nr_ptes) {
> +				if (set_write == TRI_MAYBE) {
> +					sub_nr_ptes = anon_exclusive_batch(folio,
> +						pgidx, nr_ptes, &sub_set_write);
> +				} else {
> +					sub_nr_ptes = nr_ptes;
> +					sub_set_write = (set_write == TRI_TRUE);
> +				}
> +
> +				if (sub_set_write)
> +					newpte = pte_mkwrite(ptent, vma);
> +				else
> +					newpte = ptent;
> +
> +				modify_prot_commit_ptes(vma, addr, pte, oldpte,
> +							newpte, sub_nr_ptes);
> +				if (pte_needs_flush(oldpte, newpte))
> +					tlb_flush_pte_range(tlb, addr,
> +						sub_nr_ptes * PAGE_SIZE);
> +
> +				addr += sub_nr_ptes * PAGE_SIZE;
> +				pte += sub_nr_ptes;
> +				oldpte = pte_advance_pfn(oldpte, sub_nr_ptes);
> +				ptent = pte_advance_pfn(ptent, sub_nr_ptes);
> +				nr_ptes -= sub_nr_ptes;
> +				pages += sub_nr_ptes;
> +				pgidx += sub_nr_ptes;
> +			}

I hate hate hate having this loop here, let's abstract this please.

I mean I think we can just use mprotect_folio_pte_batch() no? It's not
abstracting much here, and we can just do all this handling there. Maybe have to
pass in a bunch more params, but it saves us having to do all this.

Alternatively, we could add a new wrapper function, but yeah definitely not
this.

Also the C programming language asks... etc etc. ;)

Overall since you always end up processing folio_nr_pages(folio) you can just
have the batch function or a wrapper return this and do updates as necessary
here on that basis, and leave the 'sub' batching to that function.


>  		} else if (is_swap_pte(oldpte)) {
>  			swp_entry_t entry = pte_to_swp_entry(oldpte);
>  			pte_t newpte;
> --
> 2.30.2
>
