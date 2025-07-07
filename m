Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528D37E9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 13:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751895212; cv=fail; b=QwDFepDzZ7ZEyiAalCmpsUgyrI593wZ59XdVgNFDzIxp61AXey5gp8DbUWnxHINpYQSUXDyNVOFW3utXDrlbrBWlJQqdeyQXs38pyz4M1Lc7/FZTOsjRS5DTFg0bO9g7WVJ7LIptFZ8eBRJx3KsRnSo0THMkLKhcqxM2uyoxSdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751895212; c=relaxed/simple;
	bh=gEtGlL3sXQXaxc7pd2JFFaRKAN4Pk30WKertXUhp01s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YkanadTTksKkzo9MZsfqjMPuivcvA47dr3UNM0mdXpHU0wfBNwEorGMpxOxq128AAPSqH6QB0tybKPpz6gbv6LGGeGfFvPMwcEbWPN+2r9If4BmMg5M9UEogVqrB8yMIPgm9j42U3ZJjEG/VqFLrBs7CJnyCVCGpy1WYkSt/Vv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UwQzjstB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SlkWuxFu; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UwQzjstB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SlkWuxFu"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567BM0BX028421;
	Mon, 7 Jul 2025 13:33:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=tE6BAR3VgteUTrPgJV
	ToSTIQTU7rd6aoEtvN18jGEHI=; b=UwQzjstBDlJaDth5seYbV11HjuWj9Gb4mI
	pyd8Jy++CGoR0rUsot1t7Tk2dM6JPwGi3keVdgCgCCQBcnwFld0PnHSxQwJ57xvl
	jnT1e9BEhy9SC9Ni0zgZwafNovr4RDhLgkJ42fYJkWqxLDuRnZUmj2AusRBHTJZs
	XFW7jKN61QTbBhTwx6X6U7e9WRbZ5stJiAB3/OA+MZK8NLzcLh+F2CSWTq7wRLqp
	kEIeUgzsn21oHuxjy1ygIclPuX5IzGHomzi1Sta/HPlGv/Vd610jmbIHe+QYFtE0
	dLumst50e742r+4caqX3jAycyP+GZyaoEaTOn0Oo1bIjCc9lkdwA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47rd9yr7bn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Jul 2025 13:33:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 567CrkLX021399;
	Mon, 7 Jul 2025 13:33:10 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ptg888d3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Jul 2025 13:33:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JO19BM71K/8kYdrVRGpnyznuR8jPGjwgtHyhl9+ujzO1LzQxTgnmgFwYzufsIjw9hY9B1HxfLktxdYo2gWgSXNk7mFunWrLsmAV+GMmlZPmV+BPijU/ydjgXQfpOwN0XI5QYuCjqqgXfuz/Zj6HZ9KuCRT0d6SasjBXrxU0Xo1xOPIqgCcgz0QMnKhN7nrcwLsOi44ul8vH+8uwoxzDUJ4AGiR3yEe6JgKe9UeZTZqGcHta3ivdgX/EKgiicUjz4JdCu6IKYpof3qfaP92TAIhKpwJ0KV1+P2EhvcVPT9Xk8ap5KymU2a5GbL9dvHvg9gv69Pc7b0PxOTSZlQGmZJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tE6BAR3VgteUTrPgJVToSTIQTU7rd6aoEtvN18jGEHI=;
 b=fuJ8NIgkKdCFV/teC22db/CcHd/VIFoVKs7bf4svOuxXzgA2OSNmSRLEEUpeT4GwYPGFd35VFEZlc/MlcnUq50fmxsMDDgvlcG5YA/Ch9/OgwnlyRhz44W4HXhbifs7RJalbnhVDVcIMXQ4WfmXTBjNW9bZFsyDbUH8JXhLrMQvVBYcYWYwp3muWclYVfT5nt7Rx7DGnWoFkVZcOn44EQ9bCqfyHsgeu7qqse7Y9TP9Df0/CqZmAbwQJEg//PK4PgoH2yxfsUIcVUdiTLMxb8zKYoxDVymeGq00sxB+E1EQs37csKDKKReyr1b+iiwLkojCZ11+RGa7vu0NoHFkdhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tE6BAR3VgteUTrPgJVToSTIQTU7rd6aoEtvN18jGEHI=;
 b=SlkWuxFuSOFoGtmGqZc5O1yuCSE+dmgrG80PBrdKOo4I8BMm2xLMxeGekdz4iNup1KS4G+dND6bNI9AVYgbyy+lOaUIp64nmCJ89iC4ZDIxCzwTYO8TRv2zszr5fZYc7RCYADh9zcsttSgVr3aAIvswAyR0KTJ/jHPSrExtxgPs=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SN7PR10MB6642.namprd10.prod.outlook.com (2603:10b6:806:2ad::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Mon, 7 Jul
 2025 13:33:07 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 13:33:06 +0000
Date: Mon, 7 Jul 2025 14:33:04 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, hughd@google.com,
        david@redhat.com, ziy@nvidia.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
        baohua@kernel.org, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
        mhocko@suse.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm: fault in complete folios instead of individual
 pages for tmpfs
Message-ID: <007c4a94-c94a-418e-9907-7510422f8ca4@lucifer.local>
References: <440940e78aeb7430c5cc8b6d2088ae98265b9809.1751599072.git.baolin.wang@linux.alibaba.com>
 <20250704151858.73d35a24b4c2f53bdb0c1b85@linux-foundation.org>
 <4c055849-d7dd-4b9f-9666-fcb0bccf8681@linux.alibaba.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c055849-d7dd-4b9f-9666-fcb0bccf8681@linux.alibaba.com>
X-ClientProxiedBy: LO4P123CA0296.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SN7PR10MB6642:EE_
X-MS-Office365-Filtering-Correlation-Id: 18c99689-614b-47dc-45c0-08ddbd5ace60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8GkmXM5EwhLysNToRhWK5RH8PDP7g5EXL0bu5z/afxzd84I1fULiXRR8n4/m?=
 =?us-ascii?Q?se71DAGPFWaLVfADkhcHnvFikMe5dz8mRRgdMIGmxXC5fy6XjGyY0HBKiy8Y?=
 =?us-ascii?Q?vx/sTmaBjztLP9tBqVEl6EBE5Wn2lEAC7SDqocC0LjNUJ9SJvSJDmUH8FxLV?=
 =?us-ascii?Q?2+FgfVLtaWehpT9x5txc9aQXYSCrv7fFK+7w8dfnaluxIRCyJv2J5d5lAQlv?=
 =?us-ascii?Q?LAbHIjm8XjgF9awSR317fTHpj9xAXVSjNF81imLDeg6/W3lUsGW+wBzfoO+y?=
 =?us-ascii?Q?Q5aAsd/iNzA3D86OcWxNlDqmF+Wc/6jjxaRRUiVk/O5a5UwvHoSSCkoN18ev?=
 =?us-ascii?Q?YJpq7UVPRFMJel2gjR6aPrhjV1x+iuNnLmT3TSphxBSrQeWwP2XRPf9mP3TP?=
 =?us-ascii?Q?oJnmBpxxTD+A9FU09XE0OYWjkZxR9eldm75jrUsCrNZavsxzrCEeVdm2Nz4o?=
 =?us-ascii?Q?+R9R3qXqif2z7vifTZXkhiwKvrvcUUYkdRlQ18fbLf73VtOr85W/K2qPbuUs?=
 =?us-ascii?Q?bVWG4rhFyv5VzipN8zu3tthmBGOsv1TeCmTrJ+oei5pxKVJsiVenMNHBWQos?=
 =?us-ascii?Q?F4Kf5bJ8/DSveAUcullVRvjK36j5kqN3hqnbahbmWxlCjsXiboV2MfOnS+XF?=
 =?us-ascii?Q?CEuVFE9uKdvTF4BR05pVnJA3K7nFjjIiet6OdK/dZGBRMdKj/udx5bS/qLX3?=
 =?us-ascii?Q?ciEW/uLXGLbLNe8DybnvkiezbVN3GBHMlvA8u9zz+xmOanmEnoDzs6AAMpso?=
 =?us-ascii?Q?a0TQ6dwTFDN5H5Aq4aP2w/CVrb1HRe8zwL5kijx1gYeyZEsks2dfbGYn8pmZ?=
 =?us-ascii?Q?Hdn7rJIkqDHZ9SUvACpti2EO+yqEIlaCj0CasfRlY94PwcNFlXZP83EVXT5Z?=
 =?us-ascii?Q?aa7ptBdX1QogSwGV4q9ooaISS2p60urxNu5IfWOzrOvkFGF6hlZik3xTU0Li?=
 =?us-ascii?Q?oDalSJSbOTSn8VKsBn8bBiXAMKBwf/fR4NGjsWU/WSFGeO79AIRu1XNdNTFG?=
 =?us-ascii?Q?9rNq/xzza7RoLvNZL3vy5XYdU+3lkTpf7o1EXTizWnZJhGYglcCUmzdL76pQ?=
 =?us-ascii?Q?Xjup/0Ei29mBH3APgeHe45EvvtGlR1Wnl1Pr+O/fCtXpMPNa9gcViUjpQzd1?=
 =?us-ascii?Q?J8V/RUs/0KJY+k0eDELmAfDZPkak4AlVTFuE9fDNP/hJr7Rt6NOgFySPrtq8?=
 =?us-ascii?Q?9+QULsRpJTwUjV2Q5IHjkPJRljaa3oN636goLJ6IN12XW4J1moUrMIju44wB?=
 =?us-ascii?Q?+lAayzGsjv/myfBLJBMZr2/yxo6ajJvLJ/GJiV4vZ7FxXfG/cRt0xJATfBnh?=
 =?us-ascii?Q?j50WBCy25sMu2vWUy9U2EL2l89KUnCaaC+I1KHTIdXrKQOPecIsezDWTPait?=
 =?us-ascii?Q?H+1lHYvhufYnMFMIOa948Sk3sRMmgjtj+BmibXKXFfsrnyNz1BQb0j9wzhDP?=
 =?us-ascii?Q?/T13AbsYgQ4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TykX4cmDw9Tg9ZhvOk5M/CwOOeMns1BtJMxRriWGXyHugRxPNbG5WiHwUsb0?=
 =?us-ascii?Q?RE+bRmgIXw/JLbM780QTDyM7oHdTSJqAxeFTAXEdLyj4Mdz6viFfHduusEfI?=
 =?us-ascii?Q?/BK4va2Fwa23EK/E9viosToe9Le3g2ADA3oWXPJZ8CXty/BUe0cOeCo5qHX+?=
 =?us-ascii?Q?3dc188Ibrt6y6RT0ascNXGJ0N1qi79jqHGT70ZxvTQ5HCjKK/OYMv+GJdBev?=
 =?us-ascii?Q?9eJ9lUwkUQ3fYt9xlwBfVZfKsr09+Gr04z+Z+ndNBGWxkcYdZFPhQcT2bbRG?=
 =?us-ascii?Q?ajQFj222XupM5iLolThpGIHQzYAwhvM4oCMG8wGbYZafEs2c9y5AvV9h2mnS?=
 =?us-ascii?Q?0pbsdClXqaNXB0TS19+MZI/ASdoEBFW6L/YsvT5Q8y26e8gx/9Dt5AlaRLq7?=
 =?us-ascii?Q?GRV8zSLteHK8RcfmByH/4BFE0azsEG0/IGIdFoopi94xlKdBwhcqNh9a3D7S?=
 =?us-ascii?Q?rWUvmCNAENTe2sDrXn4I0YDU49iNStQYzI5TMPNMXT5E6csu2VCR9l7cO/R2?=
 =?us-ascii?Q?ZZ/g2Fpx94/Jg0fIkX8oF+rlAyuRxrmgoeYwbktczBzlhtqwYyb2uJkdp3P+?=
 =?us-ascii?Q?XGCgmAQvkzNlGRGeWTWaJgsDOy4SSpIzBS7OLnqllYckAKMUCay1MIT+3B+w?=
 =?us-ascii?Q?5lcPnsk7N9Wywp1Zu6zzEgcuJjpYS0MBQLmC+FEjnyAJIiBALEbRUc9ZuDT+?=
 =?us-ascii?Q?prYlb3+TjXNTVeR4U6sZe1utqMwNgYsi10GW7B/huv1C7HSzJJf2opHOrhlf?=
 =?us-ascii?Q?SgWt0up0B63kATSzOHZ8tP3pJlWhAamlBkfnBVXuPbbTueJJU1Y/HC0ViVHG?=
 =?us-ascii?Q?YvwhkEz24Py6mxQ3gMIzSJiIidGE9gBJTeTQ7irMU6ccRgK7jwjKFzVB3fb/?=
 =?us-ascii?Q?wI6nIRmnrqaLcfZyA25YlzzNSSwde2Zu2HtxFAXQYnrcNpYqGcBI58p6FDxg?=
 =?us-ascii?Q?+r44mw/XkiA9aZk++FbpgCcZyhsXEtdQUEkg/7mLBFr1bTkJ7gL3TROLGkkB?=
 =?us-ascii?Q?jFq4Ko89Dy/4vzdPszR0ot1KmcjApAZgneoHs0FniTIxrSWgtdPl+yD6EbXH?=
 =?us-ascii?Q?zlEFWMVGKInKyUezGaQZKJOGCdbfW92w7dHNCWhpUJbgHdLhcoXfuPbT0ZgT?=
 =?us-ascii?Q?ZXJG+hbzho01cbCFmJTfV8/tiJki1Toy3gMxpTbeQfUFQO5rP1kLgV+5Agie?=
 =?us-ascii?Q?98lOcxKY6BlAOQ1JSUMtseDwd54jWidQ9Ob0SMtcvEAl9BwP1y28Y9eEd4TC?=
 =?us-ascii?Q?5wnuJ6g/Ny6kyY3YrzSip/G/rPqAdbPan4Y8Ae/wxcNrC5NPAAbah06R6M0+?=
 =?us-ascii?Q?iF5iZYl5kXOviIW3fjvipucJ4OyP8b3zrhsywnp7dURzX2ndlJPaPLKKNGeZ?=
 =?us-ascii?Q?9bgwey1moHOoQX66ik+8ane6hik/nswtM87HqWawnOs/K2LygAi48HHFDz4F?=
 =?us-ascii?Q?2LBSau7SAg9JV6rCSi9Zx8rcCizPDhs4VoGxkYSf6lbW5dPS0KDA5voVObXc?=
 =?us-ascii?Q?reSSNY64yZTQ5ZYc+tuP8gxo6s12F91CdzwkgQOQKSohO4XC5v9d5TSpQtvH?=
 =?us-ascii?Q?why26SWjejCSrBzHxXTWoUapjy+4falsje+b02Av4rIxCDeSVQlUmIFyQ5nK?=
 =?us-ascii?Q?VQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vQe2HZycv23WZ4jrUZyY4L8UdC6qw2MGL+q2c+c+zz1hJEHCkhWozMPTkx87eOJw5jBzWFXJbSt+sQXQf8knMy1jLKQwkQ/vLtK5SAE1MUNk1ENuhEjkfObTXdGITXVqsgfH8gxZYjSCbOmV4IwAr0cowRTxFa+NdhuUSUKOyu8sntjni9HOiOP/+uYMgB1kgsoIFIkeVs4Ass9EIw8CTdQa9lbnr3vSv2nzHkZ5BvPygIACypAh8VvZLSWBtfvy5v6mpKkMcjgEnPWqaJJ4LAWrxsJh77kThLf03vLXjtgmWx9VZcpPKc1imGMgLB7onIYANWXWBLIvnwUa5sgDoy4lITzrvwVbp5fwyIDUQSuRRZSB51I0G4GY9dGSCfALPzuq5dCjRup6djybWhTf/3hxoajq6S+p1KOYYDoKNb/dWGzse10b0fMUGdlRVSG9oaGbv0+fCJNXCRgRb8fd5lQZ+fysPBnDmpCkGN/6XUrTRC9x51QtGXewPo+k6Q34LJNKuh4VwacUXGT77JUQ7YIc0K64QfX69SjCUqA95r2RtbKBYG16mMhE4/XUPUAIMbspwlEsAhL5LWDbacbRpl9iYHKEzXksTi/Sho03fVQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18c99689-614b-47dc-45c0-08ddbd5ace60
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 13:33:06.4764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yki7Yg8CLhlc1HM7wTeRd0XfCRsuwIACzD9sKaQc2OvnvbM5VTs1e28JUmTERlTLMMdZLjav3eUA6MAXcfRLFTCybHHazfft53iR39uiTAQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6642
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507070079
X-Proofpoint-ORIG-GUID: 0tfZq8r-VnmonOKj4R0qw5oUBjaaC7-J
X-Proofpoint-GUID: 0tfZq8r-VnmonOKj4R0qw5oUBjaaC7-J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA3OSBTYWx0ZWRfX5TGgn5hhKbKd /phi7oz1E+EyS7POplNfKhaEZ2i+j5LdQdZmC0Oi76eaeDvbL8X63wSp+LSc8GTGiJgWN6pFWd6 H2+iKc2Q/SILD47jixpkyngqZ+UzEXt9SeUWFCmInZsrV93ClBya4Gg92MOokcFEUcYogtb0ohF
 jwtvT6rlxCMuGL8aYr7S61Uh7tg6ZBIh5Ipr3iYuU66PeXVJU4N2COf7mKy6F+Khm6mIupF+QXj 0oqSjCQZibFB8rNk3GBw3cW2adDrFaSui97jB0+8rlWL94csQWyIZR12wrLLYYGRt72vqHx5ptF Gimv6wiCjKIYr1xYNz1NpPuq0k8Bpyu7kQv3CaxSx1Lnz/+6wXCxDuF4cNDz6HnfMVFiAacXOMB
 UezOeLJ6g/twflq/KM91FFu5MT9Yg348vw2HKW6deJlbWnGyQ/TRpNgeYqFc/GrFoc0ZDAPW
X-Authority-Analysis: v=2.4 cv=Rc+QC0tv c=1 sm=1 tr=0 ts=686bcc97 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=SRrdq9N9AAAA:8 a=NIzVDISV-J2DK5HZGuAA:9 a=CjuIK1q_8ugA:10

On Sun, Jul 06, 2025 at 10:02:35AM +0800, Baolin Wang wrote:
>
>
> On 2025/7/5 06:18, Andrew Morton wrote:
> > On Fri,  4 Jul 2025 11:19:26 +0800 Baolin Wang <baolin.wang@linux.alibaba.com> wrote:
> >
> > > After commit acd7ccb284b8 ("mm: shmem: add large folio support for tmpfs"),
> > > tmpfs can also support large folio allocation (not just PMD-sized large
> > > folios).
> > >
> > > However, when accessing tmpfs via mmap(), although tmpfs supports large folios,
> > > we still establish mappings at the base page granularity, which is unreasonable.
> > >
> > > We can map multiple consecutive pages of a tmpfs folios at once according to
> > > the size of the large folio. On one hand, this can reduce the overhead of page
> > > faults; on the other hand, it can leverage hardware architecture optimizations
> > > to reduce TLB misses, such as contiguous PTEs on the ARM architecture.
> > >
> > > Moreover, tmpfs mount will use the 'huge=' option to control large folio
> > > allocation explicitly. So it can be understood that the process's RSS statistics
> > > might increase, and I think this will not cause any obvious effects for users.
> > >
> > > Performance test:
> > > I created a 1G tmpfs file, populated with 64K large folios, and write-accessed it
> > > sequentially via mmap(). I observed a significant performance improvement:
> >
> > That doesn't sound like a crazy thing to do.
> >
> > > Before the patch:
> > > real	0m0.158s
> > > user	0m0.008s
> > > sys	0m0.150s
> > >
> > > After the patch:
> > > real	0m0.021s
> > > user	0m0.004s
> > > sys	0m0.017s
> >
> > And look at that.
> >
> > > diff --git a/mm/memory.c b/mm/memory.c
> > > index 0f9b32a20e5b..9944380e947d 100644
> > > --- a/mm/memory.c
> > > +++ b/mm/memory.c
> > > @@ -5383,10 +5383,10 @@ vm_fault_t finish_fault(struct vm_fault *vmf)
> > >   	/*
> > >   	 * Using per-page fault to maintain the uffd semantics, and same
> > > -	 * approach also applies to non-anonymous-shmem faults to avoid
> > > +	 * approach also applies to non shmem/tmpfs faults to avoid
> > >   	 * inflating the RSS of the process.
> > >   	 */
> > > -	if (!vma_is_anon_shmem(vma) || unlikely(userfaultfd_armed(vma)) ||
> > > +	if (!vma_is_shmem(vma) || unlikely(userfaultfd_armed(vma)) ||
> > >   	    unlikely(needs_fallback)) {
> > >   		nr_pages = 1;
> > >   	} else if (nr_pages > 1) {
> >
> > and that's it?
> >
> > I'm itching to get this into -stable, really.  What LTS user wouldn't
> > want this?
>
> This is an improvement rather than a bugfix, so I don't think it needs to go
> into LTS.
>
> Could it be viewed as correcting an oversight in
> > acd7ccb284b8?
>
> Yes, I should have added this optimization in the series of the commit
> acd7ccb284b8. But obviously, I missed this :(.

Buuut if this was an oversight for that patch that causes an unnecessary
perf degradation, surely this should have fixes tag + cc stable no?

Seems correct to backport to me.
