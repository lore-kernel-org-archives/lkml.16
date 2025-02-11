Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448C21F55ED
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 15:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739288084; cv=fail; b=Lh8vW8DhhlOayMZKguJaRpo5zL7cV8NmKIMA4SmGXw4TE7GWQOXgE8BNPDPg3TPv+rGWqlHPrkB0Yce0o0d4kscn2trQkXMHYHbzf1ISUHHPvJIKXAYe4ZIVXrFp4fdvhOIIwK7LL7od0namhWXilZhuGR5h+iMvr2sMOy+7G7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739288084; c=relaxed/simple;
	bh=YrESxutc/Ybofkv0ThXKCAnoTH0asxQJBT282FbavwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DvLdeYF8lIpnAVktBGbXU3v9f3UtIfthxkxiWLdTASg4+JFXr5tGgo5I33a+QK/st1vBUO7k7omXVI5k/jzZOOmYIRFkLUB+Ia5pzm/maz2ScSLgQBXMdovy+4GukLXQ61tjb+76r+I38rM3aLjjv5K3ennc59zF21b/FKmvpCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ul1FxiA5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Q7YC1jeb; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ul1FxiA5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Q7YC1jeb"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BDtSsV010160;
	Tue, 11 Feb 2025 15:34:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=rnv7kh9nkNZGp1gVua
	kiXfMvfleix64CAfijYl3uPpc=; b=Ul1FxiA5PZnR6VWIK5VV3QBi9WwlqvEaod
	0EUaT1J4ADrPim41oRIW2U+u++KHVmG4V2ljFAny5EWn81qrpFzQ4b+W4hCG4zb3
	BanfGrvb5Tz9amEz//whVKkak5HXH0ORJjZvOy+0Y1cMM9P1QeW/nHtnUeGx1U0a
	6RA7VCngK+3/7A62g+CSimxvq6l+ClQ/9vNYAeKPs+35UWiTxueBi24LPaLcvfQ1
	K0NSdxgYZMHqmYZ/OmS/vA6RI7du6wCn6Fe+ssbrp+3c4u4Xy3EsaiRXo7xuZIiG
	tFssgP2wFkVVjeXF7Nv6g8yOz8qMM3v4JnZ7MFnQU7FZMmylMaSQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44p0sq5gv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Feb 2025 15:34:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51BEWG7B027000;
	Tue, 11 Feb 2025 15:34:31 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44nwq8x4j5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Feb 2025 15:34:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vSwBB/c7WhEEdNrwVDorQyslQrpD2bVv5yoCVxGQHHtjx0QyVTrJb+cxbQD9rsRvuRQxuogsJPhIY0Ik4bqAQIbASA2hVUQrLxjI1z0RpvuUndps+na63J7onXWjIzmRqv+VGrXrhIuwsy3FLFfVP0NPBQRR0+ritwoMbDnZCFrbpaUJc0E4UEv0DDxhioR/kJKXyvyz0tzfvwrBJPBybnGLuHe9lvJKUP6G0uTwB7+Ue87cwXJqbXO9Oba/GSL30RF1Fg99nFj6Ih2MFcpL3/kuMxhfv7LfFnMTlPGqd+f9fmPhFgQrsKvk/NMxWSdT5151pdLhMwdLyG0l0GuRJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnv7kh9nkNZGp1gVuakiXfMvfleix64CAfijYl3uPpc=;
 b=Gn1G0uRP+UF35YoEFIfnrr2C/+Yu40eYkm6Tubm22udLeaJ1JvYtC+jDbW/wiXvPsLrEia8151Bbviu4n7ksLkPL9c3sGNVekfPhhmMr9ZN+fDoytLMM1F5RFJpFToVOPHrhUZvKKQixtzTeHp15JsR4uVuSQMPTvtdwrxgf2+JWC84MNyydNPiK9Pb/v+0dKbevnZBTsYbHCk+/PgaRRsrNVUc3q6kD98EqvIYEkQaH6gf9dexMKYlw5y2sN3VjrICRvWAjYb4csP5HItVn07/5NY/iNxkDGkjTpHei5dPY7/2mHCulNNBbCIKgZbkEXQ3fgU4XLAawW59if/u5Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnv7kh9nkNZGp1gVuakiXfMvfleix64CAfijYl3uPpc=;
 b=Q7YC1jebU1Oi9eT5Mb5mSM5k6l+ZrxssTYEur0VDzQBkxTPnBkzewuWP+sapK3myGfg0O2raowl7zHXZvvW8TiWhPqJWoX16Kc0igTSSG8ZhvpyRstgSG3auoWw35EIXq8wLLqrOcwy6ckuZnXiEgmtNmLRYsNfozmJVjeXvuZE=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by DM4PR10MB6791.namprd10.prod.outlook.com (2603:10b6:8:109::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 15:34:28 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%4]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 15:34:28 +0000
Date: Tue, 11 Feb 2025 10:34:25 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: I Hsin Cheng <richard120310@gmail.com>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
        maple-tree@lists.infradead.org, linux-mm@kvack.org,
        jserv@ccns.ncku.edu.tw, skhan@linuxfoundation.org
Subject: Re: [PATCH] maple_tree: Use ma_dead_node() in mte_dead_node()
Message-ID: <6d2e6cecbstwvy7h3beplud3fvzyyje5v6iurhl34pr6nlne6z@dt7gl3omst63>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	I Hsin Cheng <richard120310@gmail.com>, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	maple-tree@lists.infradead.org, linux-mm@kvack.org, jserv@ccns.ncku.edu.tw, 
	skhan@linuxfoundation.org
References: <20250211071850.330632-1-richard120310@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211071850.330632-1-richard120310@gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT3PR01CA0109.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::10) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|DM4PR10MB6791:EE_
X-MS-Office365-Filtering-Correlation-Id: f48f72fe-5686-4d55-c730-08dd4ab1923d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IN6/MOpZGrIJnKNzapTgCq3Jo7Hz3FDSPtFf+uvjlUq+C8tSY0oR3b8oCqxn?=
 =?us-ascii?Q?hutOS1ObvbazL7rnTZprG97EaT6sILYmBpkVI0h5qtf1OTUkhaO0TIjmbgFH?=
 =?us-ascii?Q?XRL3ridVu74jvosty3Z8B47V4L9AfTG83YXyrW88iLSDgXumJ8K/FQ5vVr30?=
 =?us-ascii?Q?6wrL2xApid4UWzDjqFmzlmo3u3AKGeDp4CqP+jbJ3xS3QA8OOmSlcxIWXXwf?=
 =?us-ascii?Q?xE2fo+j73n1linNL+/SskhFbfb8V0XkmwpYKBupqs3opAX8EirHCWJ5goibQ?=
 =?us-ascii?Q?IbqRmTjqPAgjw9CDdR99+GPwIxEPJvndUnq6GrP+UkCg1tRsKu3DcN52IuMs?=
 =?us-ascii?Q?+XcopSpQwhLPSL+WmLY5F6JbpwOvZa0TTu9x5rp2xUUHoUHIe0GV0dFjtL/1?=
 =?us-ascii?Q?TFavwY6tLZKDZbixv1Axl+osE0JyuizxEJQ7q6l51H8XeeaZUKuTi/eFu0Zs?=
 =?us-ascii?Q?nR2w6GTLXRpOwYgn4l9kCzRA6lk2v+e953w634N9MtGF81vz/rL8QvVaKQnd?=
 =?us-ascii?Q?xpzOuGl16h5sz3s4qCwD84Re1Mn7nNxZDzqgsAj6SdNFklKBvyzg9Ou50wGI?=
 =?us-ascii?Q?9f4JrWIxOWEFm5Ypg4hR2KoORHy/2f4xPGLQyOjUT5KBRqspf265Yya9+KpY?=
 =?us-ascii?Q?OYVc/txDU3mFwsJxH+DGRe/DgpoxVsR/n8sPbkORz8bF6tWw7gmGr2HFC9Xn?=
 =?us-ascii?Q?TxvQKG3Nlw7CovV80rUBmraHK6hJS7OJvgTWxFxj+9hQ43XcVnCATWgZun9a?=
 =?us-ascii?Q?4k4K9ajHiQW6yJtUpsVNPoC5b/W5KKjGUOWW+gaYjR0c63LsBgJ7THRTJ/5/?=
 =?us-ascii?Q?qiaSqXWkobCye3pJZYScvblIhyfSnVRJ0xVdl0WfQRwyEIVX/e40BSUIwm5b?=
 =?us-ascii?Q?vrAW7sWFVYLNh0bw6cYjY/YiDMvSVQud09HD4ZqcYP9OfJEChy1fmpB3sflE?=
 =?us-ascii?Q?7pUTPfzAdCo9Mtjy39y4eVLf5Gmpi/zVFLT+4koZlPk+aie+X0lfs2JZYmvA?=
 =?us-ascii?Q?HadQvknGGRUvB4eSjlY3fsb2UGDypEIne0inMAoWlyO20rNQGpAoG8V+xz6n?=
 =?us-ascii?Q?jS/Vat/Ab3TkXVTj5wREXEC1bo7mW7fa9mxpzGinedwM9OqxqhrOiGmduZgh?=
 =?us-ascii?Q?q18b0HQWs3FsD3XQ4viW9Lg83NKIw+uXZ659Sq8dMojxIFmZMgLAxdc8ofHI?=
 =?us-ascii?Q?rzKQnfyhOWPLdpv8j/AEfbMpwRXg827PmQpjp2mySpG/6zuRl9sD3zow9MWv?=
 =?us-ascii?Q?3jE3K2SKznlmAXIm7ZiAIhvZ67GWfwYnuC9NL/9LBe+WlF894UDFA4d2LUlj?=
 =?us-ascii?Q?E4cjpOtWpie3QWjKJD2NC6L/gSn4+g2SptTsC72D0wnzrqWasb/GrTZY9ISG?=
 =?us-ascii?Q?PC4MgPbCDDB44LTbdRaoZ4xbzj9u?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bVogyAliKe3gNRf8C8Xhf9dOBwziWZRfc2Z6+NG6BntF6myfL4/dimmG6+8G?=
 =?us-ascii?Q?XFoCtjGXaFmeJuRZiTMAHiHRyQaXodYdCa1ZAWJJKk3pmTIt2W+AkkD3kxtM?=
 =?us-ascii?Q?tcA3vVumpOQ637+QdZtLH9BOX4HKUb63hgGmuE/3/MTydkelVL0kFkt/K3ED?=
 =?us-ascii?Q?itDSEeMOKl2sK8Vl3eNbXUXax/NwRJhCSn2a5gaXrG1OkBhRs2PHN4FiHOm2?=
 =?us-ascii?Q?xKBPLtFXzmg5sxxtvqu+jY5U5JttQqM0bWjGKWUM62PDpDhx6ktWjuyUM6oT?=
 =?us-ascii?Q?03S8bHPET610YI0Sf6MjNAwVQ5iyAIqK81v376PmwMwICyv1fEAuzjDjkCbf?=
 =?us-ascii?Q?R4saSsEV5auLsoNzVA/yhw4BoS1bt3NFwbAWclr4++9PovDPU2PT3iI2dqNn?=
 =?us-ascii?Q?+WjlrmuMqV5Qg7ImOeRpD06D18VYxVHVszfpYs/ERsv56vSroqkpBfSFDFM+?=
 =?us-ascii?Q?UN0eXw9OMMlABEc7pGF2fdjKho7YwxmjKh/vtBEacMIUF1y/BINemJslMQqN?=
 =?us-ascii?Q?UR6bWEIYvsOns8jSCQss9WwKgHUam6d9rJxq+KuJR7sHwh8W850q1kkjLhqt?=
 =?us-ascii?Q?3FKot+dmxct4pWPC5wnXLTzoVM8qqOtUwVYpso+vJCN35uV6Nb636uf/f/QC?=
 =?us-ascii?Q?5wlsZsAG2Tc67qV6QOgJ2ZMP5Ovv4xuBr2Ph4/ha10T6Burk8jfgTF4yeC4X?=
 =?us-ascii?Q?a/LPtmcOgfhX4QhUuFE7wvFFPz01/Derj1RffJVdo21UvKzU6XC/A+33yK+F?=
 =?us-ascii?Q?k74CmqFj0IirQr3h52tZBlSP4CTW+BfBi1NoysDAG/1eBVVztv6RLAJWMPtY?=
 =?us-ascii?Q?14DiLLC0z80H3s4CDlcWFHzl/zH2n/HsyaM5Xcv1aIOXwne1mCCHsvv+e5jr?=
 =?us-ascii?Q?vtlOaDuwNzrBtDBUvTuAs1HIzKJgBU+HYrQsS4ZlLp6NJmMxbcFdU6WJh22H?=
 =?us-ascii?Q?hj+gStJOYg2PSxzIqTrbiHoPTnnByWC2vBpr1g3DFS9/W8CoEDgMCJV1br6V?=
 =?us-ascii?Q?BXQUnk6lcLT9SyeypBvU4JKAzJ+pBICLa/ExxoWcUqFs1zO8u0GaVt0sJ2+/?=
 =?us-ascii?Q?Y6HD5fhI2O4L4r8P33P0vsxV16afd6k2j8wEa2WxYAWeqRyY9gZNELVzeE1L?=
 =?us-ascii?Q?QiQ+E3gqBZ3co+YtdFXB2MpuAFiBE3kUP5k21HoaGmOYXygN8AfYvRwZuEW0?=
 =?us-ascii?Q?SVQSyz6aarYXzDU0gguhn+jYYCGln+Q0eShMsecHbfrKpjAbUdhjvkINEb6E?=
 =?us-ascii?Q?MGM853sRld7RMUrWp2l6WJlKU0eRfA3cVx5fLylKxRDm3ZgpOYfjIiEqo56Z?=
 =?us-ascii?Q?1Pdkkd3SYLCc8aDdSSdtcrbWG+UddZ18mrJNPW5y2xV5hiNrgTmWbrAPef3N?=
 =?us-ascii?Q?KotXd5MNwzFMpGk1coyL/2DX7aO46oKxs51hWvjnWIvhTrYbQvM8RtQvcgjJ?=
 =?us-ascii?Q?9dVSGXw8EXwt1a98D8UdRGBtu462DvOs7e9/S9nI4xhonT4ZhP1BUnTg7tsW?=
 =?us-ascii?Q?gJvspoc+CyHjWUocDRKtgjYgG4O3FCaXiasXfecRyXX6f+oJoFc1F6KTkUyX?=
 =?us-ascii?Q?IkBq/eTvHzll+AyBEu0b/STOt6+5VtaNMgZLC+mv?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7Ek38k0nm18h1RIMNZTPS+PoVKlo38NV9GCEev8uRkbXifjWSd9KX6Zf7+aL05wZlP+DVrjm8gZNsOgDN3AWhCSXiaa1Pxl4hUmXiEdVn4oFgQQ9kC2Crc6O4AP2Bl6gMvvGIRVBmAeC5uEW+ZjJ8bu/04agagIkoGYpxo92ygBFU7XZ/W8mEknZl9p5kECX/jO57H58AaQOZS/asVTeOz3MvERnDNCFfVuv7CgNuWSEaT6zXjo10pOwyIOf0YYXeiAEqtyG90OC/jGVDfvXI3UNO0RiTd++ErbIOnQejg5AXhtnIhRIYijl2arrUFPjj12KTfTGzFSnR9DYDehFOcFlD10Pf3dyz608Cr9uri3e/hdzIFGqnsn1zb2n0TsoidrPVKmh9/14q//z7aIIlJ37xPI3LSPmJCywb322qM4Zm15ydvDzMQLOz8lnWLwmwqyn4ZRzSJOTNtT23m6kNzlmBJxpXjWZUwDvzweHtxBrIy5q+vYtFrLv1vUBaXXGfCDwcgocfRLUuW3Jqx0nNZDn4lqLoIzorzVMfGTJHRu0achKjnfxyEk+Qd6lUyVE8GdBhghVU/FU3FXvVfeGB6+y5kC2ApG2c1S4K4GbxHA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f48f72fe-5686-4d55-c730-08dd4ab1923d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 15:34:28.0925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YbRmOGSs0y9ofTWFr8H2RMQhEltaQDK/76rQzAY0xHkmXc+qgfTjIGh0lytelYzzUlxUYU+Rm+7bWh0ggtTDjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6791
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_06,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 adultscore=0 mlxscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502110103
X-Proofpoint-ORIG-GUID: itEeRnCz5qelsVqZUnMn9ghoGE16CF6v
X-Proofpoint-GUID: itEeRnCz5qelsVqZUnMn9ghoGE16CF6v

* I Hsin Cheng <richard120310@gmail.com> [250211 02:19]:
> Utilize ma_dead_node() in mte_dead_node(). It can prevent decoding the
> maple enode for a second time. Use the "node" to find parent for
> comparison.

This is much better, thanks.

> 
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>


Reviewed-by: Liam R. Howlett <Liam.Howlett@Oracle.com>

> ---
>  lib/maple_tree.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

In the future, please include a link and changes to v1 here.  This is
instead of a cover letter for a single patch.

v1: https://lore.kernel.org/linux-mm/20250210083526.252955-1-richard120310@gmail.com/

Also, the subject should have v2.

> 
> diff --git a/lib/maple_tree.c b/lib/maple_tree.c
> index f7153ade1be5..362f85c62678 100644
> --- a/lib/maple_tree.c
> +++ b/lib/maple_tree.c
> @@ -584,13 +584,10 @@ static __always_inline bool ma_dead_node(const struct maple_node *node)
>   */
>  static __always_inline bool mte_dead_node(const struct maple_enode *enode)
>  {
> -	struct maple_node *parent, *node;
> +	struct maple_node *node;
>  
>  	node = mte_to_node(enode);
> -	/* Do not reorder reads from the node prior to the parent check */
> -	smp_rmb();
> -	parent = mte_parent(enode);
> -	return (parent == node);
> +	return ma_dead_node(node);
>  }
>  
>  /*
> -- 
> 2.43.0
> 
