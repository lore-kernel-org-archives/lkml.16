Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3123C15B554
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 13:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744119489; cv=fail; b=Ft8nTQpbnH97ewNzPAdPiL+nDcay78mN7r8RrIf495aCghcBKUCVgTV6lnINblW+K4r7bo1xg37c2SbRpzgnbDqIpp0d7Qy/7i1rYqcWio3djbOhTXvUMlMCSlwpLUrhsgu5t/arM/bzoWv3nVvt0vuommXIZtJ2rrLaHxQXHxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744119489; c=relaxed/simple;
	bh=w0josf5nr51ydmU74TlHiPmQ9WRhC+3H2QS3JpIEQrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Fy1nt51LcPBdRpAXumVTGmVG4E6eucIflIwGLc20jCqFfssM/GkAAr77QKkEb5/si2iCFszeZH2lVT43SVuclNK3EoiReyAC+i4XH1KEZm/UPuVju8qoSr57DZ/dtQ0Wbaxhdbe9ys3/MorJYFZ57D3KJjIuYu9Cfoqs0wfocyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VCKPD0ur; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OM7ow7LM; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VCKPD0ur";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OM7ow7LM"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538C6c8c010577;
	Tue, 8 Apr 2025 13:37:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=gbtUG07wqh8Z/8Gb2e
	TG7KDonsRj/6gfNeh8nM1IAek=; b=VCKPD0uri+pVUdoEnJpyM2pKONZcTNce2L
	NGhRTUDevIHY+/cTnjBfn1vb3sMLVbpeQTb2fwCppCw9Tdscqptf1uRTQvBI/fzU
	3IO8kVYyXshU8afw+c38lduwegg1x0VegjWkGv1B+n+POR1BLZSAM7tylNabDT2m
	3w1jEO/+mV6hngmzWXv1z+HOe2AfcxfF4sZfZH46lztnI3QegsoPvCxM+R23SzSi
	H7Q64PrpY1NgFB3hSSTkIS/h1YI1d4jA9HWqnvdLXdzVgFS9BFVjbQxSaw/JkXwb
	DagEPaVaND5ifWLPk7O3EF7osMSsE80laDzs9seWruclpOFtp9Bg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45tvjcvtu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Apr 2025 13:37:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 538Cf8Tl013886;
	Tue, 8 Apr 2025 13:36:27 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45ttyfk6tx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Apr 2025 13:36:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+/9c4bips1hGHbbADsIAyLaVJOMVWZWf1jICGFLdYKBCdH0b/jHrqfaFM5xRsokWnWRkoDx6AsuogR2MdaIM84678q6k1MnbGgsFpW+p5AVhxQhmLN37lNxXUSwVlWine5vyP4iBz0BgKL83jJocEuyYdqDenI3L8KcK3Lcqwb55To85wYJ8nDNU891WSVY6knumi9jbepV3PE2+Sel5wyEaReM8wcqQrfbBx4gkk9rwvApn79ZKnSnXgasiQSbW9GZ5f1AoyM1LNVOnC8L96BFPLVR3juLESq/7H/GS9wWufOWsLDb6yJn1+i9CSyGpKHr/AA2PmESVv8vsd2aKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gbtUG07wqh8Z/8Gb2eTG7KDonsRj/6gfNeh8nM1IAek=;
 b=KcHyJny6hQwcnRp0WOnqOhTwKII5ABmUXFtBicXj4HEWHipdy0VUX03o2AsTrHJNw4B+MbnvQBS45qDC/AUxACXfNcGQqPykYthhsr5+9z9OpkUDzk8FIfmCJoxA8T0YkIdTh0icC45x+hCc9eeIpbtdTGlCOT8VnmFTn78F3TdbaiuH/HhQhdR64X1Sq8H6Anu5WyGOXpoOak7O1AE2Fhax/8EtrQfS+Pqmuq38ME1ktTuiEy2CRoZfuw3VsHmJrlKtzgz5buQDahZOXKMWNuM8ZERDqYS+aNhAHo7j+2qs1pcQeOlxx+jgZ472z+5J/BwHSenZWCZ4DspnmBl8Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gbtUG07wqh8Z/8Gb2eTG7KDonsRj/6gfNeh8nM1IAek=;
 b=OM7ow7LMAGAX80XQcOjFLdl1aRACube5J5dGFrPio2gYFXNg43YJJIGWqsuPM5QdFjVnHAL6Bg74Zo4oBaTI1iODiThN60L9ZNvFBihO3jyypEkY+/m9rMdCrTPjLGLnkVB8wAJ6m7rj8IpE2EW8DbHeNOZ2PsQj5+FMx8G4Bcs=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by DS4PPFC31902354.namprd10.prod.outlook.com (2603:10b6:f:fc00::d47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.27; Tue, 8 Apr
 2025 13:36:25 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%3]) with mapi id 15.20.8632.017; Tue, 8 Apr 2025
 13:36:25 +0000
Date: Tue, 8 Apr 2025 14:36:18 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R.Howlett" <howlett@gmail.com>,
        David Hildenbrand <david@redhat.com>, Rik van Riel <riel@surriel.com>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Vlastimil Babka <vbabka@suse.cz>, kernel-team@meta.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 4/4] mm/madvise: batch tlb flushes for
 MADV_DONTNEED[_LOCKED]
Message-ID: <fd26ba1e-9730-4288-a03b-ad07b6fe9ca5@lucifer.local>
References: <20250404210700.2156-1-sj@kernel.org>
 <20250404210700.2156-5-sj@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404210700.2156-5-sj@kernel.org>
X-ClientProxiedBy: LO2P265CA0079.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::19) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|DS4PPFC31902354:EE_
X-MS-Office365-Filtering-Correlation-Id: ba47cf11-e149-43c8-98d2-08dd76a25bfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8YyIjl7ugoKqh0U4XGIo9Kzdk+J5e5rHb/TGypb4bLM5lbnIZdL3gurZU6U0?=
 =?us-ascii?Q?MyEFIHamfyUzvb6dQyt41wDWrsYTOJP+DaOMzShjj/31x9XBUoyIVnob6bZc?=
 =?us-ascii?Q?nMu9GZGo41VHUSy2hBwnZg2H855qr862BJEB2feJSJM/viQS5BKhjzmWRGig?=
 =?us-ascii?Q?wzPEZpU+z13I6y3+y3LX3W7UG0HopdDJw0P+VCeILGmpipFoKP5kYW3K+jlf?=
 =?us-ascii?Q?x3bTV/UzhzlIzzDIWAyp+/dyoQHnVrctAYxg/M5tOXnE1xe8Tb8zrmjZa/xi?=
 =?us-ascii?Q?s4PThb+4L/66r3mYLr+ftvyjhF3yPscKh8dVpp9hrftu6MVqC8AzZnW7vpjo?=
 =?us-ascii?Q?i60+WunDXGA/MOHxq2lifHj50lqKzohR3wca3rdzVRB7mdgPSAMer0w1Pi3g?=
 =?us-ascii?Q?YOGAY/esmDJpjM/mZEWI05rRnOK6lEJT40dk8zAXuOl4hf10p4wl1V6wXTVD?=
 =?us-ascii?Q?MPZosYxxOFQt7FxhxxINSVBLrbNVJHUizgifQT5Ybz2e5DTbsLf0yXfQdMgB?=
 =?us-ascii?Q?8EaPs5jK6UMp9U/qkOBlNz8XLZbBJ7gsaMASO68eZR+wtAEfscWdWj8qt7H4?=
 =?us-ascii?Q?K782GpTyDI2kRSld4c9CcaXjZVP7PRi/s9cBnlZlNghA1JZP755wr8hz6WEo?=
 =?us-ascii?Q?T7CVWyMimbOfiX074aJUhlW77pG0bc0Urmkad4dn4mXafwCz1AxKxZ5GWrnf?=
 =?us-ascii?Q?a8TEWbwWT/BxPWX/99k2dxl9/oXxFiQZKywZKllZ+NIU1ULoHGPMGEQdSsAV?=
 =?us-ascii?Q?ovx8P6Vn1ORzowRn3L8h1dyZcIw8R6vTaXq0JwnYi6UQ5hVEH4rUgsTv7Swq?=
 =?us-ascii?Q?bOrszu4j2VBIhluUDV0DNmQgKbLVUyNac/0AGUvItc0+heP7z4Gqq1uRQ2QB?=
 =?us-ascii?Q?TuKx1/hY8hvZ3QGX7IfAkjC0qvJW6lFNZr6uJO92LTS8alD4ua+SXzRv5hJ2?=
 =?us-ascii?Q?ap15rDULc2IKlDhnWgznqJs8y9++SNiXUpNbfP+sdFKFOuOOKJhqAosx24dx?=
 =?us-ascii?Q?MPPEvrlnyohQ781rqVwoiTwpjEvLrei57civm/1IMC2JzP5GcLHqtXzy8oWb?=
 =?us-ascii?Q?QUwrbG4SlQgHoD56Wc3oK1VfLN5ujHGK5h9Qt7NTfrwQYbYF8HRidRYAzP20?=
 =?us-ascii?Q?SoESYi5dgIwNR48INnpe4U0V85HlPnNkP8u2rUMBPAUI9MkInpHJBNLY2jkl?=
 =?us-ascii?Q?JZo91agn/Ipkl1k29WQHIsozh6UaFXgcabRyN/aiQ8sH4k9A1PF6l/iLv/Pf?=
 =?us-ascii?Q?E+7o2qsTESWjJGH4OLiXjFrynkqYMPvyacVSK/9euD6WWIHp9EoUBfAutdJN?=
 =?us-ascii?Q?ij/biyEuyX/UF3XVM0+nIqqCQGChVrn0mMQN0+qnCuMvJwBuZoJSOnBkFijO?=
 =?us-ascii?Q?mS+vg0Z58CjoZy7f459px5mBjwvk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8VCAonTBhaQkDduT1F0Y8XJevpUDHXh1yuBBGGdHE4isii0E0SsZeTsGEQuV?=
 =?us-ascii?Q?SLPWH3ZAJskz75W0OaOwwlOicCmLoIpSzAjMQSf+oY02guKy3JIAhfizZaQR?=
 =?us-ascii?Q?7OpIdGTrFtguUpm6JNTkvYsK5RmIPOQvYuiZ+TaFjVkpXAs3tGWvfH87J0Qc?=
 =?us-ascii?Q?7v3ZVjfyj6x0aKuZORF/r0nU2i3MHzB5xnTPz3I6CgpW9dupAv3SV2wVdjI3?=
 =?us-ascii?Q?ws9zwDgxN/fExMBLztq4hS0C+c5kgfdiJ/Wh/Xd08CRvuiXRlpbmS+NWxvCI?=
 =?us-ascii?Q?58OsRTtAc53ztlmjFh4u7kdSePyogsS3EJs5nrSDOGooFgWTKG9d640nllZl?=
 =?us-ascii?Q?q3RPDhIGtW9+mmjgS7n/duRc/JleXeOIqT1+ObQnLWcMpwRe+DO33itUnvja?=
 =?us-ascii?Q?lUZIPD10ZuXF4ddL0kqDELilt3J05zpcTTEczFzGqNFHtbsiylsubzejQ8bD?=
 =?us-ascii?Q?4yxF2jX+GHPPehPunjNe0wB+XEicjMXrjlBxrTMK19KZ7TvgfJsFP/pGZvaB?=
 =?us-ascii?Q?/RAjTsPsC5l2dHNEvUjrfHl2ck2yulY84YBPNjq+I/A0Rat/+DKxtzgEqQY4?=
 =?us-ascii?Q?wqKtkstYV/0aIsn0Z0YTOe6Mu7LKI3xV38HebZ3HnlfwAhGbU3P5HlPYUVH6?=
 =?us-ascii?Q?TMmE7OIYMpIpvciDQ2VjmO2vE/RdOIZEkcnPjKICvLvD31LruGeLcS2iY4Vx?=
 =?us-ascii?Q?ecOST/gpYeVuXbmBD8x1wT4ePV/ext9LoLpxy2zf9oFpkzfxSQuuVT43rziU?=
 =?us-ascii?Q?eK3KhC70fqrKWbptvdPHaDhh/2fp4bap/0P4qf6AgJk3njQ/rQ+29J4WNv4F?=
 =?us-ascii?Q?JK9h9EcjMOwXd+IS9hhPDbSDWp6NGMdCuOO/ytwZc9vALXVlbkWUbNI1ZhqS?=
 =?us-ascii?Q?eQN5M/2Tgi9qOyxQX7S1Zcl1KKlfAu38F9fkRuuuEBZxo4i1d115gpe7lw3W?=
 =?us-ascii?Q?2Nokjmv2GS3yk83bkwkXH6KCiWNE+HGiA/9QdlG0LolgV+EvQ8PDZT3f/QY5?=
 =?us-ascii?Q?Wg1896eKbdMWi2IrKSF5XfkcWQj8Ackf49aakQIjfi4/2YsusvMVv8TUZlNW?=
 =?us-ascii?Q?Y046Qzm+iSK8F4RfAPcF1Z3DasWMiTUMP67FvT2I+bIPHqMeSEu7ls43cQ3U?=
 =?us-ascii?Q?wXQxRu1jDdCGMyZyKHLMxzXLiTwNlZcWN/2+7nzhVm8peBoYUdqPfgNReyCo?=
 =?us-ascii?Q?IEZR0gunAjUE8eNos9quuRiz3LzCjiun5G0QRF3jTSUGM60xOGR1qlvv69Dj?=
 =?us-ascii?Q?85yIAgm8PPb3JkgXf3bb9ETiGF+M8PC0/Gh/rpuia7fBODPijcByLiHvz6iH?=
 =?us-ascii?Q?6MDfHg/ergkWaeNoY7eFtaoM9g8lfpz/rS3ciQDeJNaZCQEJGcginaQqsjRe?=
 =?us-ascii?Q?lCU7VdKXZ5kwzmC4Sv19iA91WZZOPe3huoCrkxNkUBj7DDiiO3U5NmAaMu+J?=
 =?us-ascii?Q?A1CB37GnLhkv0NnlMhqLaB72MdzWUw5Gd0h18QGxTY6NOWXTZKXSj+hjbe9p?=
 =?us-ascii?Q?MlbJzWCsH2EG8Rkj89jzpXcekQjl06Z2kSNWs+0YMGfaBDmdeIuKKWI9LL+F?=
 =?us-ascii?Q?x4mGVEsBoPXTECcPRbu3k6Tmxb4qDMuKcCPw291OL/0/nhiA/hQwNMqDS/qU?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mOYwdTNdMN3m5h1yEi/q8pyjwrxzS/Ps+6QWJFIhsr0boa1m+l5/v5yDogYdXXO519XMOZJBumGbT0Wjx5OY2WY+rscFYGmAcLnqtcA4JotcjCwKrSFq13JsYG4xJ53yH37zSjOkmH+FNdFlfpE5hGDXZ7MNgv44PuEaLt+5BpepnGu8n3CB5LmrO575U4Ctrhlh2ItffuNmM/Wy2EcwBcVv0Ow19Ojuq1GXCrcUuBrSJI8kb9fJQiV/RpDYp5eSNyK+UhiN67TThRYnYJ92EVKG9jBTQxNmJpkwJDB4WRkJef+pUCwxjW0P5iI/glDJw/cCFca8EmfsN24TVX58VZRpA2I8W34z7Sq3RrBP5Z1Fa0lHZHhrgzTmDsTwiPdw/FZ+WVbE1wYCcrItbN+DJVKpSS1qsx7pHjiWv3lv5r76EtU9Upx9M0VKp3k0MDhRNxp4IxrPmZYJ5ajnTz5PH4g6cD1RzvjUBkFNMME1Uk/NIBGG4XhULF7zL+ZPbb45TOTD8hrhnftwjndwJQVdFeLhSCWq1EOYGIuqkOzIXJvYOkGjCc6+sq5gJ6zNAyT7WRYPAqRBuU53eREda9XBeQ5KvekFpxctBF0v9e+VVKY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba47cf11-e149-43c8-98d2-08dd76a25bfe
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 13:36:25.8764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PeGzKzvyISjZXmv5d0SS5lrVso43mPCCT8cHiCKixovU+YlhDHGriDuBNNsxl2blvG+HGnYhpCJ+ridlWlaJJnVokmaSm02Wn3lRKi2Yfv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFC31902354
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_05,2025-04-08_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504080095
X-Proofpoint-ORIG-GUID: CmSyEcJFwMgyQS2jA02vWcU_kBw_5moZ
X-Proofpoint-GUID: CmSyEcJFwMgyQS2jA02vWcU_kBw_5moZ

On Fri, Apr 04, 2025 at 02:07:00PM -0700, SeongJae Park wrote:
> Batch tlb flushes for MADV_DONTNEED[_LOCKED] for better efficiency, in a
> way that very similar to the tlb flushes batching for MADV_FREE.

This seems like a rather succinct commit message under the circumstances :) can
we put some meat on the bone?

Perhaps explain why one might want to do so, propagating some of your excellent
cover letter contents here, etc.

Also you're doing more than this, you're also exporting the (soon to be renamed,
ideally :) notify_unmap_single_vma() function, let's mention this here please,
and also mention why.

>
> Signed-off-by: SeongJae Park <sj@kernel.org>
> ---
>  mm/internal.h | 3 +++
>  mm/madvise.c  | 9 ++++++---
>  mm/memory.c   | 4 ++--
>  3 files changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/mm/internal.h b/mm/internal.h
> index e9695baa5922..be0c46837e22 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -435,6 +435,9 @@ void unmap_page_range(struct mmu_gather *tlb,
>  			     struct vm_area_struct *vma,
>  			     unsigned long addr, unsigned long end,
>  			     struct zap_details *details);
> +void notify_unmap_single_vma(struct mmu_gather *tlb,
> +		struct vm_area_struct *vma, unsigned long addr,
> +		unsigned long size, struct zap_details *details);

Yeah I know I said in 3/4 but I really hate this name. We need to change it... :)

>  int folio_unmap_invalidate(struct address_space *mapping, struct folio *folio,
>  			   gfp_t gfp);
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 564095e381b2..c7ac32b4a371 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -851,7 +851,8 @@ static int madvise_free_single_vma(
>   * An interface that causes the system to free clean pages and flush
>   * dirty pages is already available as msync(MS_INVALIDATE).
>   */
> -static long madvise_dontneed_single_vma(struct vm_area_struct *vma,
> +static long madvise_dontneed_single_vma(struct madvise_behavior *behavior,

Again, let's go with madv_behavior for now please. Otherwise we have a weird
inconsistency that sometimes behavior = the int 'behavior' value and sometimes
it's a pointer to the helper struct.

> +					struct vm_area_struct *vma,
>  					unsigned long start, unsigned long end)
>  {
>  	struct zap_details details = {
> @@ -859,7 +860,7 @@ static long madvise_dontneed_single_vma(struct vm_area_struct *vma,
>  		.even_cows = true,
>  	};
>
> -	zap_page_range_single(vma, start, end - start, &details);
> +	notify_unmap_single_vma(behavior->tlb, vma, start, end - start, &details);
>  	return 0;
>  }
>
> @@ -949,7 +950,7 @@ static long madvise_dontneed_free(struct vm_area_struct *vma,
>  	}
>
>  	if (action == MADV_DONTNEED || action == MADV_DONTNEED_LOCKED)
> -		return madvise_dontneed_single_vma(vma, start, end);
> +		return madvise_dontneed_single_vma(behavior, vma, start, end);
>  	else if (action == MADV_FREE)
>  		return madvise_free_single_vma(behavior, vma, start, end);
>  	else
> @@ -1627,6 +1628,8 @@ static void madvise_unlock(struct mm_struct *mm, int behavior)
>  static bool madvise_batch_tlb_flush(int behavior)
>  {
>  	switch (behavior) {
> +	case MADV_DONTNEED:
> +	case MADV_DONTNEED_LOCKED:
>  	case MADV_FREE:
>  		return true;
>  	default:
> diff --git a/mm/memory.c b/mm/memory.c
> index 8c9bbb1a008c..6a01b73aa111 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -1989,7 +1989,7 @@ void unmap_vmas(struct mmu_gather *tlb, struct ma_state *mas,
>  	mmu_notifier_invalidate_range_end(&range);
>  }
>
> -/*
> +/**
>   * notify_unmap_single_vma - remove user pages in a given range
>   * @tlb: pointer to the caller's struct mmu_gather
>   * @vma: vm_area_struct holding the applicable pages
> @@ -2000,7 +2000,7 @@ void unmap_vmas(struct mmu_gather *tlb, struct ma_state *mas,
>   * @tlb shouldn't be NULL.  The range must fit into one VMA.  If @vma is for
>   * hugetlb, @tlb is flushed and re-initialized by this function.
>   */
> -static void notify_unmap_single_vma(struct mmu_gather *tlb,
> +void notify_unmap_single_vma(struct mmu_gather *tlb,
>  		struct vm_area_struct *vma, unsigned long address,
>  		unsigned long size, struct zap_details *details)
>  {
> --
> 2.39.5
