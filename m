Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3846F30C
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 13:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745589010; cv=fail; b=YILr+/1j/8VKlJdl/KHf/qADOarkWUmCPNpHpg3ei9pYlxLMT0usslS9jGlBL1cm3b/jOI4yKPos3mmiizKwl+Bzq6yAryGb729+ogjMv7iPlW58N5YG4V/PupVDCWfxBj/rH2KrnWM+r2tZuCKKHroX3Nu8UCHwRWhMrgermco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745589010; c=relaxed/simple;
	bh=exwFtE0/yg7LfEWD8zltg7TZBadr8te0EWDsohHSpN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=f2TB8D3vZP4yLI8c73tBATfv4X7AyUCuSQ53uDU54aEoKR4yBhmWzA8LbF7ny7Lf4dAkurg5ujxy3Bv9ofv4ut8wSraEnwx/4KWQ/6ZeWeJ3Bg5zvolAucUhQYR4GpEFcabCR+okVq13Fopascc82dwA3ECbcx4ntBD7NYv2L1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hukIjvi3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pcJrZf89; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hukIjvi3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pcJrZf89"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PDl8oI026611;
	Fri, 25 Apr 2025 13:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=MKlyrsDzo8mhbFBJrY
	rL4eczv4ThbcDhu38jA+G803o=; b=hukIjvi3J64Ialf07sA58U66aZPQsu1JGr
	jvEVfqKFO0OmZa7aShu/uXAYMSf52hgYmxFsor8kZ8NBLRnbyn6Ik7y9DZffDaRt
	KqJh98cUhy2L4qPK8Mw/qP2tuwY0ojBYMfq/k6zW+X4KnqKGi7oHZpzlSXu4nKcx
	90pWL1FlfTjvoEFvRDPUuCqfNPXK/BhrNh94SFtacfXLExED8eOhJIhBibIzzmWo
	wlJcMvUqYu9HGoTPip3CO9Ph52jXp/kqeOH6DPj/uy5c+/27rs5tdbRl5F5N+agU
	P63zw2UK48QG2/TTIfIE2VmAKTMqaFBiYMHE5xdJ0vIHAMJbw/TQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 468bjx8055-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 13:49:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53PDe1JK014194;
	Fri, 25 Apr 2025 13:49:37 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazlp17013077.outbound.protection.outlook.com [40.93.6.77])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 466jxrnmhn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 13:49:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kixoxj/mvhPG7EOlnq3N5CQZe8NIB5JMazWHN24akbdlv4AmPGwczJ8N60w2BY9KT27o32zvrJo2jtm40ziY2WK3pkZxPu87X0LhC0jiRhuQ2qThQ9SuvCk0F9d47vjoc1XnqL7M4lauB2x10+NgZJeuaqZLPedR96VL1nKL7mkM534+JW8LhQs8qikbNJc7Y8tj30t3tkwsz0G7oPzsjDhXBIPgiuaVGhYibETOBn6FO9arpbsdO0//gZxwr+vtGVy2G/XCd5eRk7TukEYG4O4hWwUGgxzTRgOLYSDTNDdijG6aa2Lz1z3sZ8eQggvC5AvgMfSjtBYzgxArTh35LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKlyrsDzo8mhbFBJrYrL4eczv4ThbcDhu38jA+G803o=;
 b=CqcF8ZUiW4gbvWTfpgPOPgH1UQdd8w00QoDca2eXF1zomsoN3qeA53Un1+UbgOtCfUI48SnrbIu5la2de/FnAkpFgOukl/mSa5KWWkMFe7uJdk7WxHp0ccKBFz1Oi+GVPiP1yEDM4CVw/In1sR2F6JNx4J9/XPrQjFdEuNostTo2CZl2XWMQ9/TPwZesJ60+bEXBjn5CzjkIHK2eBc9+Q++rV8s6yZ3hZK1W5JA263x33xoq8FdBeUn4Vw+z/PpBGcXrUfN+ZREIRRCs7y5NwdWq6fyXu7MbnmMacrT5daQUUwMWUWCLJE5owE0ZayxbdQmIhWDq2sq7phy9pE4LXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKlyrsDzo8mhbFBJrYrL4eczv4ThbcDhu38jA+G803o=;
 b=pcJrZf89BKj8FBxMdwVv9znn6idiq4tCA//ok/JOVjAsLpHPdiSPfLV70QaI10fjrMbCsb3dIHFf0KH4CgaOSpv9RfuTwfzvwUNj2GakZcVD12fvur3ghx9EBJvezLyiYUXwcvpUHz6MawlOU7Gy028Ze24uPB0wio7+5CsCDfI=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by LV3PR10MB7841.namprd10.prod.outlook.com (2603:10b6:408:1b8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 13:49:35 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 13:49:35 +0000
Date: Fri, 25 Apr 2025 14:49:31 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Hajime Tazaki <thehajime@gmail.com>
Cc: linux-um@lists.infradead.org, ricarkol@google.com, Liam.Howlett@oracle.com,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 00/13] nommu UML
Message-ID: <f4242067-0113-432e-b8d1-d26ff5e4a355@lucifer.local>
References: <cover.1737348399.git.thehajime@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1737348399.git.thehajime@gmail.com>
X-ClientProxiedBy: LO6P123CA0032.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::7) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|LV3PR10MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: fd188f6e-f6fc-49af-2107-08dd84000367
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/BZJez/ITGURg89yWzC6kXsZV1nIFtCJhj3DQ82O7a2QNwH6k76ldmhafDTB?=
 =?us-ascii?Q?tTzWU1USAvBtFtXOc8P2D2NSsLcUPzktC5yixjYFtdVeHu+hEyqF0BCKthGv?=
 =?us-ascii?Q?zQQmIE+Zzq87mMrAya3Tag1EpbgF9Gqjtu1DYWwQ8hBSnUhTMhAozULwAyV7?=
 =?us-ascii?Q?za9NLZsdhZsPKVMd7i4x07CrmTK1Ctkc464qkhZSVEkRQAZq8HqKYqo+9He9?=
 =?us-ascii?Q?4Nlcs7bMluTQGMRrRigvZH+k95y1hUaZcI7bCK4mhjt7GTbFIrLjAaiwRr6b?=
 =?us-ascii?Q?rLUDDxyU3h8HNHzlmeDxAE0weCbtayOwWPpMJqcdUI4TLEbbeY8ub/85F8XB?=
 =?us-ascii?Q?QE15dvFSR37wNVqQoYjDu7lBXb9Fsc8RRr2m9qdirguvIlQJmRW/soD+EJqe?=
 =?us-ascii?Q?ebGL6Lz/46cdh+FJ2huGKK2XHo8YNH5UOLccH28aZ0pmUEtuyfBeC3+OZd0f?=
 =?us-ascii?Q?WIpJc6wXUQ0Kq0ae4g/ktLuz2Thllhtrad+yAmVkT5+zp84dCyiW4WMMYqYu?=
 =?us-ascii?Q?sgWBY42CXST2vLz6DG3UtHj1KLa6iI03Em8/rvuxqLVwDUS62vGZ4eKvziih?=
 =?us-ascii?Q?G1EcXCQe6oeUUBmMmfQM3UvRKi37dXR5DeT0C+Uqs9Lsw1OQsF8Qdq/FGGzL?=
 =?us-ascii?Q?NiEi6AO2zJtivA8NZMA3t7N6aMEzH3QpDdKpM7GnKPLtgGM5DZdZNXS0tXTL?=
 =?us-ascii?Q?SqlixwN2GMKARRW1mY4KIuZDPXtKmQh0e2dvqPvhCOcVWCWmOdkhHxPuWOmQ?=
 =?us-ascii?Q?vyybn24h2tGf7Ovrb5WsBqjO+QYDtLX5vx6Xk7q2llrWIn045ZNo6F9W5Avz?=
 =?us-ascii?Q?A/OZBVOKWs2mrw5dR5OF1R4Oo7d51tnKEUDwCOkz6edPBjcndKgxS68UOS9m?=
 =?us-ascii?Q?V0+0Y7RDLFSKfsjlL4fceYT9ymz4ZGfTfFwa9i4S4pdpd/Pcbhxp1/JIoxZe?=
 =?us-ascii?Q?1x72RRwy0Q9Upd1Mli2XBj4UGmNhphoxOju2/v/Wq54guI7vp1HyZ5eks4Ei?=
 =?us-ascii?Q?dDL8oWExLfYBXvmxeUW1Q5NQ3GlKoxrQoCeIP8Tl6e74c5mlqnGcnzaBCAs7?=
 =?us-ascii?Q?LiA/yg9PQqjFYVrYFSiT5lHfsKglpTy/2U6Z6R359zlu6L1t+2TEirpE8h1n?=
 =?us-ascii?Q?zdPXo+LWkiFbSgC8VgSKLJTEg1AcE+KkC5xgugrIajGamP4F6HQDCTfjZdDJ?=
 =?us-ascii?Q?9W3dt+N5nRLRALZdx4Bz41ACOjdNyc6ZXf7nSooacPpMfDdOyjm7SzndWPqr?=
 =?us-ascii?Q?kp/f+M48ydRr34d0W7ZcxoisI7qKzabDi/B+wK2bK6cl0dK+fuNipBwp4Vzn?=
 =?us-ascii?Q?WiKy6bq3/6LvWHE79BOutpdVjNUssQbU7M9Z/aKQZyBwpBF/KZdReQMielBH?=
 =?us-ascii?Q?KFPGtytmJ2l775TfxgkPpt7jjEhYWzdze062HjvMUmHWoePGp0pBo1TESJYc?=
 =?us-ascii?Q?vnMAaTfYw3tS+xtkgtf2Uw8RM54stgDy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ul/MnpBWHzBf/iUg0rAtUPgE9tEuy8tEEYmoTQWcWyk9CXkixeIkXUUjvk8K?=
 =?us-ascii?Q?EdpvCMpTCrWyJ2f+UcOeK+oPd00vOmG91e1y9WdGeoEifNKHmwm1R8TWZ9JG?=
 =?us-ascii?Q?pQ0N3+RgWUCAMbqs2Y7hUwNaTLfzXUMNNNdYQIjDaGEfvvJdLnDiFUzsMser?=
 =?us-ascii?Q?DvX7Xtwk6N8Ulbw1At7UNs5Oscq6M9vOTRLtocbpTwJ4OZp11ANaUfZcoI5u?=
 =?us-ascii?Q?DAuVy249C0owEGcM6+U7szmoKyO4E7BRmnRd7MpnytaYxcuCmBd4wh/ItQvJ?=
 =?us-ascii?Q?9s9z3LlGOM6Of12tcQUwSPAnzBpDuXFnJXdcorANajHwWhVbXtC1+/7clMw5?=
 =?us-ascii?Q?sRd2WIi61TlouiYKXK+GQ/SuXvONyvu5fJFlLICab6Ur4mSxP6PafEDPN4DY?=
 =?us-ascii?Q?0R7vA+UQNWrLQS05uOhhlfhSVnUsqHo0/XfOlXxQOfPQ5+mUWpxySA/eb8cH?=
 =?us-ascii?Q?sfqop9a6zpqaMapNT6So0IjwqXDaleqAcnKEFRUzTuCGgYjVyWJE+9tngIfK?=
 =?us-ascii?Q?LlMQac7EIo+V6fs1bcaxwxlPO+4mFej7WJEs1zpAkWDVYuoQplNYYQRK76MH?=
 =?us-ascii?Q?3To15SwUy0Iyyao5HnPSL5CbluqejMg3bo4Mm2OtjRdEG4Vy4s4z7qab2hR7?=
 =?us-ascii?Q?dGJiEgJnD6JpkGywozB4N8Qnc2EMm6bNKPQNKaFU2kLRLZw9Tjdj774NES0n?=
 =?us-ascii?Q?pUQt+52yisXU8JmG4hSvuf2cEnmfWiB4Pz9nyKz2MIeZvEnX7j13a8YJP1Ce?=
 =?us-ascii?Q?bwqAiCxUayiktiEeJhuJsY08uVBa2p80hFLTOVTkcxTRL34744aiHv1ZxMTG?=
 =?us-ascii?Q?W2HnmWSzrRIeOrozdsSvgs/Wy+wmUy/3xeGm0mjQwywUdLoYivf4Q8Mtoks0?=
 =?us-ascii?Q?Ib9tqW9aSnpg7EApwK7AVdBuCzUc4S10FnlfwZMvhmBEfxY2Y2S+waf7Ov5I?=
 =?us-ascii?Q?+70ThWReWC0a/ej5TzFBEnEjrVIA6xE2omGCEOGLAowFEijVkTUGbyjLayvn?=
 =?us-ascii?Q?xoiFPLFIDkBunmB240udhwVedjRrq+94mId/OMzHS8nc4YOylT+IwS51Y5Ib?=
 =?us-ascii?Q?P4veeFoVoO6EbqaPYN21+aGcsR+QA8d9sUgRA5zAxh6SEAdV45ANrI2lNT4x?=
 =?us-ascii?Q?4o/1YO+BqEKUFk3lTCCKAbzKQzV6YyhRSQo+jlat0lvTt+7gqyXg8pFRMude?=
 =?us-ascii?Q?IqPkz63tgxBawg+3b8h7ktAWPbHsH4/Pdijj+og96eJkMfLP1zQi10kd4Ik3?=
 =?us-ascii?Q?oXrRCfT3DBA9Si7ZQmpUZKJtU3M0lAUVqKhJmyc+e4EovBUX192NQcBXvB6L?=
 =?us-ascii?Q?tvsF5bwSgIocQnFGVs5OsoOWKYr0bAezfcI5Dzv/uX+GSOElkL9dpxCKVEjT?=
 =?us-ascii?Q?lAq2+9SPoIRe/5yV3N1WC0OFM9RFTxhdrugZ/Upg8isORVoTt0Q1iP2sMwax?=
 =?us-ascii?Q?rtcSyQfmajYN+qIj/qhf/blkQIQ2teRRucpI94/1sTtBFH8McIZUVm8l0Wf+?=
 =?us-ascii?Q?mlqkwU8vm52NBF65s0SfF/4yTyRdP5f6LH2X44gauLRmkwlWMA+uLFPAt8JS?=
 =?us-ascii?Q?TKtyk9olh7VxGODmRD+aBpeKMOyrI83tA06clgaim8P+wuhjKLxe3x5mMbbN?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CExH2+z5NpEbieyVjdnEIJKwyTGRwj5L11YeOuQfBHLO8BOC9UbhGxIGaFZEkCYJ0PUGBRfuP4yr7AqwRupgKcqFX+d0mTDuecftLZKTu4TckFzh6m3hJPq/2uKZSSXql7K2h7FgWw9q2yfVfO4P4zWGyHqGUUjWsPjGRQBc/4zsjArkaU7WIZFMdOkhDarSyCCtRbDBUO2r9I5W7GoVA/t+DnffKAPGrcYWJ3L/t0SKDiVygfiJ2+4/Qx+PclgUoLg7tYTHneslEWDllDDIyD7WQ649KTJ5fM5V9AMfSlkQFVOYC01y9ccTCT3jWIJhqMaXaPgwsw5FDLJXKo7yFwymgv9xBPvB98ETpJ5RyH4dIySyyIjmP0ojwHpyBhJSN/d5EoKNntwLVvC7aC25PQZr2kYsimdwhUIRTplZpO9tppuiE5Y7wgU9KTHuPnBO+lcmX2nnRZMdDlbaswzVk+pB8dNyWbvvxppixsFG/dm3adfwIg0UeEkWN/K7CIgnDISgJOwDxxuZtAeEgPZz306D8mHa/aKmwtc+AAZ5FlC9HmoPgP+k3NvKW9PEfFcfeSBGHDjAXuZgQv8QyJOCiVIRfnYNMuWfi9pRFp2XVvo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd188f6e-f6fc-49af-2107-08dd84000367
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 13:49:35.0917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4KfH5dSHjNRm3iNHVTZiaRok8P1xTNZkfRH4QLIobsM1GJF0Etyi7RHht1AfBVchKifsiCq9Y6DyRPKL6WisoyLhf9FnKPM8VpRtnjUvTYY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7841
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2504250099
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA5OSBTYWx0ZWRfX6ZUnnpTguxj5 /1vb9l6JMVGrXWKLE9ZSl7zPIWuownihF9Pq+gBcAhllrtvdBunA+MZllnIRde2x4av8T8Nc4vY C4q18xmJlD/MrPcPOJ32dPPio7WlrUmr6mP8OYboFfBVzSQxFk+XJfh8Zfve3fu8v0yYe/hi5vZ
 RIymGrZUcKBebS3PAyKJx50lHK3SnPtmn0DehbKu0MSrPGdGsRKxoZvKIxoWmmQTSY1pv7xwy3O nFMiJ7xkWsFDC7RGRLUoKsaM2BR3YH6zP3X6pQPbnQ/25FDgjAJFwWsBhgwSiJR15WZEhJplghl HHrXzEW1+rS2p0VvTlConmMLLy7H7VgWt3f/yj+Qvt9e2KxWWyy3sG2qeGTficbz3OoHglkz2RY RfGqF8ii
X-Proofpoint-ORIG-GUID: ufI77VWggW5UD7RjuPu_rIp3DPsGwkjf
X-Proofpoint-GUID: ufI77VWggW5UD7RjuPu_rIp3DPsGwkjf

+cc current UML maintainers as per- current MAINTAINERS file, mm + kernel
lists.

Hi,

It seemed this series died, which is a pity, i'd be very useful to have
this functionality to aid in easily testing nommu in mm code.

I know that I pushed back a little (or rather - wondering about the status
of nommu in general) back in v2, however with it confirmed that nommu is
required, this series becomes really quite important.

This would need rebasing of course for a v8, but I wonder if there is any
appetite for it or why this didn't go anywhere?

In any case, if you are still interested in this Hajime (thanks so much for
all your hard work on it!), just saying there are definitely users out
there.

Thanks, Lorenzo

On Mon, Jan 20, 2025 at 03:00:02PM +0900, Hajime Tazaki wrote:
> This patchset is another spin of nommu mode addition to UML.  It doesn't
> change a lot since the last version (v5), but contain clean ups.  It would
> be nice to hear about your opinions on that.
>
> There are still several limitations/issues which we already found;
> here is the list of those issues.
>
> - memory mapped by loadable modules are not distinguished from
>   userspace memory.
>
> -- Hajime
>
> v7:
> - properly handle FP register upon signal delivery [10/13]
> - update benchmark result with new FP register handling [12/13]
> - fix arch_has_single_step() for !MMU case [07/13]
> - revert stack alignment as it is in uml/fixes tree [10/13]
>
> v6:
> - rebase to the latest uml/next tree
> - more clean up on mmu/nommu for signal handling [10/13]
> - rename functions of mcontext routines [06,10/13]
> - added Acked-by tag for binfmt_elf_fdpic [02/13]
> - https://lore.kernel.org/linux-um/cover.1736853925.git.thehajime@gmail.com/
>
> v5:
> - clean up stack manipulation code [05,06,07,10/13]
> - https://lore.kernel.org/linux-um/cover.1733998168.git.thehajime@gmail.com/
>
> v4:
> - add arch/um/nommu, arch/x86/um/nommu to contain !MMU specific codes
> - remove zpoline patch
> - drop binfmt_elf_fdpic patch
> - reduce ifndef CONFIG_MMU if possible
> - split to elf header cleanup patch [01/13]
> - fix kernel test robot warnings [06/13]
> - fix coding styles [07/13]
> - move task_top_of_stack definition [05/13]
> - https://lore.kernel.org/linux-um/cover.1733652929.git.thehajime@gmail.com/
>
> v3:
> - https://lore.kernel.org/linux-um/cover.1733199769.git.thehajime@gmail.com/
> - add seccomp-based syscall hook in addition to zpoline [06/13]
> - remove RFC, add a line to MAINTAINERS file
> - fix kernel test robot warnings [02/13,08/13,10/13]
> - add base-commit tag to cover letter
> - pull the latest uml/next
> - clean up SIGSEGV handling [10/13]
> - detect fsgsbase availability with elf aux vector [08/13]
> - simplify vdso code with macros [09/13]
>
> RFC v2:
> - https://lore.kernel.org/linux-um/cover.1731290567.git.thehajime@gmail.com/
> - base branch is now uml/linux.git instead of torvalds/linux.git.
> - reorganize the patch series to clean up
> - fixed various coding styles issues
> - clean up exec code path [07/13]
> - fixed the crash/SIGSEGV case on userspace programs [10/13]
> - add seccomp filter to limit syscall caller address [06/13]
> - detect fsgsbase availability with sigsetjmp/siglongjmp [08/13]
> - removes unrelated changes
> - removes unneeded ifndef CONFIG_MMU
> - convert UML_CONFIG_MMU to CONFIG_MMU as using uml/linux.git
> - proposed a patch of maple-tree issue (resolving a limitation in RFC v1)
>   https://lore.kernel.org/linux-mm/20241108222834.3625217-1-thehajime@gmail.com/
>
> RFC:
> - https://lore.kernel.org/linux-um/cover.1729770373.git.thehajime@gmail.com/
>
> Hajime Tazaki (13):
>   x86/um: clean up elf specific definitions
>   x86/um: nommu: elf loader for fdpic
>   um: decouple MMU specific code from the common part
>   um: nommu: memory handling
>   x86/um: nommu: syscall handling
>   um: nommu: seccomp syscalls hook
>   x86/um: nommu: process/thread handling
>   um: nommu: configure fs register on host syscall invocation
>   x86/um/vdso: nommu: vdso memory update
>   x86/um: nommu: signal handling
>   um: change machine name for uname output
>   um: nommu: add documentation of nommu UML
>   um: nommu: plug nommu code into build system
>
>  Documentation/virt/uml/nommu-uml.rst    | 177 ++++++++++++++++++++++
>  MAINTAINERS                             |   1 +
>  arch/um/Kconfig                         |  14 +-
>  arch/um/Makefile                        |  10 ++
>  arch/um/configs/x86_64_nommu_defconfig  |  64 ++++++++
>  arch/um/include/asm/Kbuild              |   1 +
>  arch/um/include/asm/futex.h             |   4 +
>  arch/um/include/asm/mmu.h               |   8 +
>  arch/um/include/asm/mmu_context.h       |   2 +
>  arch/um/include/asm/ptrace-generic.h    |   8 +-
>  arch/um/include/asm/uaccess.h           |   7 +-
>  arch/um/include/shared/kern_util.h      |  12 ++
>  arch/um/include/shared/os.h             |  16 ++
>  arch/um/kernel/Makefile                 |   5 +-
>  arch/um/kernel/mem-pgtable.c            |  55 +++++++
>  arch/um/kernel/mem.c                    |  39 +----
>  arch/um/kernel/process.c                |  25 ++++
>  arch/um/kernel/skas/process.c           |  27 ----
>  arch/um/kernel/um_arch.c                |   3 +
>  arch/um/nommu/Makefile                  |   3 +
>  arch/um/nommu/os-Linux/Makefile         |   7 +
>  arch/um/nommu/os-Linux/signal.c         |  28 ++++
>  arch/um/nommu/trap.c                    | 188 ++++++++++++++++++++++++
>  arch/um/os-Linux/Makefile               |   8 +-
>  arch/um/os-Linux/internal.h             |   5 +
>  arch/um/os-Linux/mem.c                  |   4 +
>  arch/um/os-Linux/process.c              | 149 ++++++++++++++++++-
>  arch/um/os-Linux/seccomp.c              |  87 +++++++++++
>  arch/um/os-Linux/signal.c               |  31 +++-
>  arch/um/os-Linux/skas/process.c         | 132 -----------------
>  arch/um/os-Linux/start_up.c             |  20 +++
>  arch/um/os-Linux/util.c                 |   3 +-
>  arch/x86/um/Makefile                    |   7 +-
>  arch/x86/um/asm/elf.h                   |   8 +-
>  arch/x86/um/asm/module.h                |  24 ---
>  arch/x86/um/nommu/Makefile              |   8 +
>  arch/x86/um/nommu/do_syscall_64.c       |  80 ++++++++++
>  arch/x86/um/nommu/entry_64.S            | 113 ++++++++++++++
>  arch/x86/um/nommu/os-Linux/Makefile     |   6 +
>  arch/x86/um/nommu/os-Linux/mcontext.c   |  24 +++
>  arch/x86/um/nommu/syscalls.h            |  16 ++
>  arch/x86/um/nommu/syscalls_64.c         | 115 +++++++++++++++
>  arch/x86/um/shared/sysdep/mcontext.h    |   4 +
>  arch/x86/um/shared/sysdep/ptrace.h      |   2 +-
>  arch/x86/um/shared/sysdep/syscalls_64.h |   6 +
>  arch/x86/um/vdso/vma.c                  |  17 ++-
>  fs/Kconfig.binfmt                       |   2 +-
>  47 files changed, 1329 insertions(+), 246 deletions(-)
>  create mode 100644 Documentation/virt/uml/nommu-uml.rst
>  create mode 100644 arch/um/configs/x86_64_nommu_defconfig
>  create mode 100644 arch/um/kernel/mem-pgtable.c
>  create mode 100644 arch/um/nommu/Makefile
>  create mode 100644 arch/um/nommu/os-Linux/Makefile
>  create mode 100644 arch/um/nommu/os-Linux/signal.c
>  create mode 100644 arch/um/nommu/trap.c
>  create mode 100644 arch/um/os-Linux/seccomp.c
>  delete mode 100644 arch/x86/um/asm/module.h
>  create mode 100644 arch/x86/um/nommu/Makefile
>  create mode 100644 arch/x86/um/nommu/do_syscall_64.c
>  create mode 100644 arch/x86/um/nommu/entry_64.S
>  create mode 100644 arch/x86/um/nommu/os-Linux/Makefile
>  create mode 100644 arch/x86/um/nommu/os-Linux/mcontext.c
>  create mode 100644 arch/x86/um/nommu/syscalls.h
>  create mode 100644 arch/x86/um/nommu/syscalls_64.c
>
>
> base-commit: 2d2b61ae38bd91217ea7cc5bc700a2b9e75b3937
> --
> 2.43.0
>
>
>
