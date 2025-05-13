Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E5B24397A
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 13:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747141954; cv=fail; b=WgkrgbG1rbMYcBOeedVBZxBYxMOIUzNF2fEn/fH7vDS0nR7QfDC/H8Zk/ni0GxUr/NBY6I3riiukVnB3A2Fb0Ui8GfrQxhjR04bGPVYJws9qqVaYzm5/Q/53GO9zqlE75Ea8yDOzDh/ZfdX+znwuLyfZ/DkkU+s0Yp6DsuHpxis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747141954; c=relaxed/simple;
	bh=EK275kDEmgmoxdC3djxnXqYB6bry/T2xdEkRuzTWk1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MQZEkQsELz8uXiAwb8iXF2TY4lc0jFTF9fMkglcbyAdI/vpWlfwlDGsE3gMy/kTke5NiNUoVYnF6EVCCGrgzm6Yg1YrzFOnEJt1bGRgcu1oxNfLzGcjGn4rSUvC6tt6P81xqbCA7T2/A4psmDqrUxYD91W6qcUyfRYwUgiKvdy8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=b/Lp17tC; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=R8xMkLcf; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="b/Lp17tC";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="R8xMkLcf"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DCHL1N018782;
	Tue, 13 May 2025 13:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Ebru4MSlQ8pzELm4NpUiMFqxexF7DWhaRUniPlLN07E=; b=
	b/Lp17tCvzXRA3hX5n3IKQRjf5NdZ2VU1SNY0ocHhIsjdrcmyhbWQvWfXAXizbKR
	dIlVknmQ6JhhK0rf8C+iEVg+1VpGtj16gMqGRWJ+O7UaYthCOmDrBnRJJNvmI/tH
	yN6Pw/rZFaKcGiDyLrlqGChCGsHRdTC4f9EErSl+hpPauvFz3TmrcpsOlgqEs6mJ
	FCLLd+29VILUBx4tAiWPKc81iPt/6/3ck9IZF9fIm+7Fal844rHr5jeT7NNNEka4
	WxNCfjbroxWOz/SH1xuDbMk28bkGoJSTp54KgWArIdalIe+v5xN+tx0PxUBsw9P9
	AoM/NWI4JK79I6hIHMMmIg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46j0gwmrt2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 13:12:08 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54DD943R022303;
	Tue, 13 May 2025 13:12:07 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazlp17012038.outbound.protection.outlook.com [40.93.6.38])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46hw89n4vd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 13:12:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N80PU/r5AUPb+uRJU8Cnb5NMhqYogOdzHubMtcVVfWI9a5kUk4n4avWrNfCJVNvOhT+tPA+iGixDw1trkOAimkHSVXAnroI4b77/DtGQHp4jP2HrFLrEs06+xFWW/6nzPrYjUlumlHwJR+2oudkQJAxjvgxtHIcZ6sNk0co7Wws98xSAcDPJvQsKhnUERo4kDS6hl7zpZOMu6WmXkn1CfZ6Ue0OqEuDmUKm66fHBIVmwK6G9nYyw9lk05l5YDGbh8TmjGTDrm+Oztr6JCJLVT71fj3ZYTFiWILOeVhc7MPQnFFpu3bgN3XXJboVNyMUbZ9ClKna7txP3eHRm3x1nVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ebru4MSlQ8pzELm4NpUiMFqxexF7DWhaRUniPlLN07E=;
 b=JWsO8mmapzfc1WKjb943IoelEaWsPSXak5UC+q3+BLyNf9y3vW/fG1z3fb+uBLSQCgt+NjeoH6Vwsi3F4bZ379fOUOmSwmUBfdJfrKVryyIScwnKHXeQRsaBRPs0MIPj5fmboS7pubZ2plACJ6wEi5VaEo3yfqJAA1jf+WTEFPKK4dDggKiXEB4WPLBKr66uHoCyb00PP0vCszvgclypy35JrWZW7gyYUkioWoSo76hcKjvcfoIltGpXhNa+4wHh4irm4rBzxGLwO4TzQ8lB+WEHX7/mBjrAlNkmCwTJLXCbPTh0sIwMXins27D4I5v5sKlQyvZ5T+PS+Dekj4s7Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ebru4MSlQ8pzELm4NpUiMFqxexF7DWhaRUniPlLN07E=;
 b=R8xMkLcfcCaA07+ogWCSKTK4fS3MXfPbWSrX0tYGfKhG8x5cK/BwzqdOBPtpQ5NHz5+w0ZdofE5nUL+n+FjWBCM4CoLDc4wchYtyw/ZLHtByneddLWsIFpriLSXYugTFqXYpp84JJaBhD4TlFv4T9CFjE/neGlqqr4q+HLRWbsc=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by CH3PR10MB7188.namprd10.prod.outlook.com (2603:10b6:610:121::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 13:12:04 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23%4]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 13:12:04 +0000
Date: Tue, 13 May 2025 22:11:57 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: Erhard Furtner <erhard_f@mailbox.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, vbabka@suse.cz,
        surenb@google.com
Subject: Re: prepare_slab_obj_exts_hook, zs_handle-zram2: Failed to create
 slab extension vector! (v6.12.28, amd64)
Message-ID: <aCNFHVG_l2Pfs8Gs@harry>
References: <20250513140126.4fc4de8b@yea>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250513140126.4fc4de8b@yea>
X-ClientProxiedBy: SE2P216CA0056.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:115::7) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|CH3PR10MB7188:EE_
X-MS-Office365-Filtering-Correlation-Id: 956a8b75-7ed3-4c84-3227-08dd921fc101
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oAkvuAlJhOj0k+G5DYL7IJxXvTsyOEymKM9tcl+BO1FAAdgPRnkzElp3LhsV?=
 =?us-ascii?Q?ucuC7NxFhW21J6Oe8ef8+hDFia5vIjxjsPZl51m9NSrw9CnC2JN2Oex9NauE?=
 =?us-ascii?Q?YMBkkwaWcfHozlhEtPgW7XU63ww8seYCyRw1Nn07y1AP7WvYWXDXhMDo9+5H?=
 =?us-ascii?Q?NmMhHHuBV1vjwrgoO+UvSs+Xjt4oecW1oW+I70TmTJ7WCjFvJ0TOKLFA0Wky?=
 =?us-ascii?Q?fj69QV0KLPcq3tWh2W8TP7NOg/xSzihzYsBXENpSlIhKCHiHNmkgnZJbDt9S?=
 =?us-ascii?Q?9yCMiu+G614ctfbQATGKur/ZoqflU71erVS7AWlL/93jRmC5WDuSbe9WMcqh?=
 =?us-ascii?Q?xjE4orQMJNvuBbE9XnuE/Em3E686U/U4DbLrgCOVqHNKMGLSDiJEk56+sGxa?=
 =?us-ascii?Q?4HNLf5dSq4djU0wqu9Fnh+ufhJp+29ndBL9fe2BO5VwMGZ8eHv/pSygiGoR+?=
 =?us-ascii?Q?aV6zGIdm7IcEcMn+cQ1zje93SC1fR7gLNa0g1Bbj5EKLsI6LuGSxs6ml25or?=
 =?us-ascii?Q?k7PFwyy2DK4HTs2ejUn/8YpqG6l3TcutkeVeytTodyoPMJAqk/XAMqgCjw9I?=
 =?us-ascii?Q?F2ptRER39vrLAh/kDOUHCVAQi0pfi74xZe7sTlpHDzS8X6wDP6VaZpJPTNpa?=
 =?us-ascii?Q?tvbVfBxqjjS4NxvAN3Cz855ipQpI63xnuyIu+w9eTLNn6i7VPEiDVLsehBQ2?=
 =?us-ascii?Q?xzO5Q/tLMVBSuq45/zRTsmMQQavkAa+m1PB+ynJ09qTfM3kONYNiq88iTQ47?=
 =?us-ascii?Q?PmlA5WphXnsGyIWkHBiT1VuNatTpNQnvwNyUIy6jPA0mMbe+ebXlr+AV+aHy?=
 =?us-ascii?Q?tBTCg6I89DaahjvV7yguRMF/FaQ6h7StkHslSsnb4g8TAIxvxyrri7B8jbUq?=
 =?us-ascii?Q?YSePWOtv6d2Qnb0eY342CRIvOrnO8iuzFe0GUaFY9MPjY9MZwoFxWV/VlhCm?=
 =?us-ascii?Q?5nF8Vlnn+wsXJB5H+76f27Ek8l17yK+hKLyadhdDDvAqMwBtP7B1pNgJlVqB?=
 =?us-ascii?Q?Ol7AFRAw+go+lKAQIYSacgomPZcaPbKRuWoks8TVaU8UJxnRXM6vGrnoJg58?=
 =?us-ascii?Q?x9Dj1nd73zhQVvMI5PTrbNYd1dwJ8Y2LRCPUQ3rATsNjtLZR72rhv/ZeFKrt?=
 =?us-ascii?Q?CfqTlRd6JajE0UG2FWIGDnxGnfPZ+v129aovsp4rmzKJWa8TcbeCdjvOCiDS?=
 =?us-ascii?Q?R6R0Br1BwfkskBtTenpwFp7pZGQxJPpLPf9utxA5mDQXDELhAU2xUNk+SXiA?=
 =?us-ascii?Q?fLFLIxLM0/KuvKI+ysO/Yf/lWnMcTYMyS96h1aOabRoUOrZBlkfeKxPlAQ1g?=
 =?us-ascii?Q?xwEUqclGP5yi+Gi7qwYqvTXnbCDXXQWPCFCJV8ADEeiv2/SH0G6F5YG3DNIw?=
 =?us-ascii?Q?/YGfBrXE3mdE0RS/WbnYVyocUoWPoCkbbAs9ffbWGa6XtGBe1iseoFQMdoxI?=
 =?us-ascii?Q?7WD4wd4jKUk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fhy0PeMCl8RcQcsEGeBSXSaihzviyoxJk+W/T31kRGzn7OWsjTo3xs5ks2CU?=
 =?us-ascii?Q?Mjhoogx9u8nv+eNBzA8qHlKktxeoNlnWFNJP2HXP/a7dQr70l3a/GuPmzxrI?=
 =?us-ascii?Q?qZyVEMKN+YaWC3TBZ4Gk+RV/xQdbCs73aYLwb5lBbxfjkuyamH0gmoEDVAPJ?=
 =?us-ascii?Q?711Sd+Z/ool0wIRPSGaS9HgsloHdwRvra14vmIsw3MAF0SHh6TEAxiZ4Jad5?=
 =?us-ascii?Q?lxUuOva8WwigcyDEGKeqyyJo4zZYeHbK1ofNgG3eATeF8EhB/c0E+B5+2b/S?=
 =?us-ascii?Q?+Ra7Fy4N+IBR0S8IJ3ClLvfsXAo/tuJE7VYokrZqCWcJTe9rHekSym1GSMDZ?=
 =?us-ascii?Q?ThXyAOmF7oeyKmL2DIzyTTC3q+SP1nozwt2gdRwd7CjDbbyh6+/K/kD2rzkL?=
 =?us-ascii?Q?5GxRgrgsJ1HspMH1bUzreIVCYDak4y1uQ9Ah6tA/jTPr6HssDdNWOg81Wsbn?=
 =?us-ascii?Q?wqDCGOqCVcva2VIVxuyq3UKZo/yLzGjqGvL4flkg3yqZ0NMEmohdPdhRmTzC?=
 =?us-ascii?Q?juqmlSkcCiYNa/WGnG4PyjDZAfCSHt2t1CHkjSk3H7gebPCDZB5Vc9JdDLZs?=
 =?us-ascii?Q?IVPDDNeGSrgxRpiCp9Isem+jGNJEP4jqxomZnqqYKO0iWEBSIa5VTus9R399?=
 =?us-ascii?Q?JJa+WW+DWJOGMtSLKtJVdMZKbBifeMq6ep3ACGqekRnc2OI3kTbechudj0XV?=
 =?us-ascii?Q?e5KiazA28mwEwRz/z+Af5NSdPqhT/CwwuisVQgic9EEVwCaEuOX8hnTgUjbb?=
 =?us-ascii?Q?QT84QCqLepsrh10/yAYiXj9phAum8cMdEc7iv1inNQo/+9q54XXaDkwHRk79?=
 =?us-ascii?Q?D2jM8dNf1tkhZ0BpoZgMJHb/ppDuxaTmqU5jcmEWVblPIGsfCFyaPBKk6NG/?=
 =?us-ascii?Q?yDnY47DguTBK1KKXP2Ih5ViiYBvLOC69za3bRuwhAlm4cBwAx0izhcwkUPaT?=
 =?us-ascii?Q?27Rs/ssNJTfJ7W57m4UhjBJxgQ9LgkTA3s3JF8WCSFnQOL6sXb90HOQW5c4I?=
 =?us-ascii?Q?DUxof3AxGO/1RwS6/09qBvvbUXnV2hrtKTfaQJezewcgF8rVMgRM04PKhH7G?=
 =?us-ascii?Q?lz4jplHJpxFDMXlSLYV5TCZ01U93fw+V6CgnRr0YhPUBGuLi4d75aKOlByCD?=
 =?us-ascii?Q?MOkTqPceLpTH2diYIgqKS0i1PJ1McEMHBGpOYorVcCTXqwT+BxskFKAwag/f?=
 =?us-ascii?Q?OKLncAn2/0QiWWODH3LOKdRHoWc3xkcMwyUljn8FrG0L9k1nnWFuByWZb/el?=
 =?us-ascii?Q?jk6iRBCJniXIu/klL7ld5chFKGE+m9RDPOpdkOrh94tK7sco+gZjhMKmIkFH?=
 =?us-ascii?Q?Iq9q3WxF14kRjs8lzhuuX5UFiaHzjK1ehBtFEXlnUe1g9zXOwhVBQRWbrrY8?=
 =?us-ascii?Q?MZlvzTAwT7XmysrfLrKq9ZbVfSh9cSpHSf4jLLGC5OvlPeZZPRfnCxZU2dPn?=
 =?us-ascii?Q?lA0tE0LgBDlAu5EtZcElFtQoR6DxdhCusm7lF1tJk1z5g7Gj0vd++1oiGtSr?=
 =?us-ascii?Q?85Khd2EqD8pO8bs0ZEqtsyZJgto2W4TD49yZzhTzEjOWQ6TDuvrm87inX6K4?=
 =?us-ascii?Q?0sorSJ5UJbliEG1maBvo1nnH6L3BUknruyrIXGPp?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CN0LJGR/i1WFSAEhLaYDVrg63tmbppO90AFU/T8oF3qx6EZiQ3rV52ugzslprmoWSmJnaXq6QFv1e5uylN668L6W0QfARGdUwtCmDDL8QfQT7zm5TDKfhC+p+Wf0YyjIBmphqZ2upJ0Nf0bHtbuiBwynhy1/VJpMt0RoAXPnkEcc04glMaSlD19Y0z9qEnYi3rmRYtx8pQxpyLSQAOq+bJZTCvjRqt52Ud/54l2hRGgdhNXwknWFOXDt4Oyh0IGyv6FzQpCE1gyZkpJUGHi2UV6ag5oCgw+wtvZkkErKOOxQVCZ0r8HoCoe1Nl2iWj8ZutfphEgF0lakCHAvaFU+0Md48DkXcOX6VMuWrQa8Rre16lkfg5WJcei44DDCawHuqalCl6PZ1SDYdB76BX53HNKLlGjLTp1CC00d6BaohgEhGQZOTqQbJhEfQOO9+LA7gC0Eo1mMqYJDUu/2sadXElW7v2SpS6QbTl9jmb1jR0gc/uwtWNiUAGvGgng63/3yjImCKSUDFl3xV0Y6vbLaLUIrZoFdCaLFq5Dv8hodxGl5Bqv/HXFjlamuwcRUque6V8zRh8HnQ1kR8Qy4YilAJmZOhp+HmQSn8b7kJ2mnGIc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 956a8b75-7ed3-4c84-3227-08dd921fc101
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 13:12:04.5246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LM/qEto5ane8PzLL8o4p9h0nUkgTHxlzs8s/QeOp1itRe7AqoXvP+yyBgr9DlJ0Fci5PNJXyJXlHq+kgy0EfAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7188
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 malwarescore=0 mlxscore=0 phishscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505130125
X-Authority-Analysis: v=2.4 cv=M8hNKzws c=1 sm=1 tr=0 ts=68234528 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=ZMqwtwaHp0wNHmOZTzMA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: zDAuHAzq6LZWjYgsgy9YWOdQ4d330OMc
X-Proofpoint-ORIG-GUID: zDAuHAzq6LZWjYgsgy9YWOdQ4d330OMc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDEyNiBTYWx0ZWRfX76ZLqrAcWHRu KquQU2I6bpH5ncROPfHvqZ7xH3vnQ91h43ZrRT9XsL4UMi8bUzF2A8Fd9EfgC3c4m+H2ENzyQ10 /EY0txp5Jj+08yntsOgxsJwfB1rS068DF2Tu4PD0M0M3/EJtIMbO4pvBoIpWsPzXOdkO5zl2igJ
 tNRF6A9nL4B4Zh/LF46sTuIhDGMV62wp6p1RrcrYIgOrMePU25aXOTkMzrO0P4ehE9gXAoLFES/ txBkSMgnjtNiEYSknT3OObC93p+0jd3ci21lmc3nPQ2LbGOgS87NcyzMkbZkITCfCoAyv5zgIJ4 ftpqsDjs2TCaJx0I7ECPGRNISjzYHYas9b2GAeNyrAOzRmifYtC29DGKotQCGxiTEvjUv+6MNP/
 d2gWr6qGm2K514SxhZSmjbfM8Et2HZiHQ+wDa4ccMbAQJtkJx4kAVD7gjg4035zjyxB0MM2o

On Tue, May 13, 2025 at 02:01:26PM +0200, Erhard Furtner wrote:
> Greetings!
>=20
> Got that during building on my Thinkpad T495 on following zram disk:
> NAME       ALGORITHM DISKSIZE   DATA COMPR TOTAL STREAMS MOUNTPOINT
> /dev/zram2 lz4            32G 138.7M 16.1M 41.2M       8 /var/tmp
>=20
> [...]
> ------------[ cut here ]------------
> prepare_slab_obj_exts_hook, zs_handle-zram2: Failed to create slab extens=
ion vector!
> WARNING: CPU: 6 PID: 17975 at mm/slub.c:2076 prepare_slab_obj_exts_hook+0=
x152/0x190

Hi, thanks for the report!

I think there is not much the kernel can do when it failed to allocate
the slab extension vector. Memory allocations can fail under pressure.

In this case, the memory is not accounted by memory cgroup or memory
allocation profiling subsystems.

But it's not the end of world and I think this is not a bug.

Maybe WARN() is too much here?

> Modules linked in: cifs dns_resolver cifs_arc4 nls_ucs2_utils cifs_md4 sn=
d_hrtimer snd_seq snd_seq_device rfcomm fuse zram lz4_decompress lz4_compre=
ss af_packet ccm algif_aead crypto_null des3_ede_x86_64 cbc des_generic lib=
des md5 cmac bnep nls_iso8859_15 nls_cp437 vfat fat dm_crypt nhpoly1305_avx=
2 nhpoly1305 chacha_generic chacha_x86_64 libchacha adiantum libpoly1305 al=
gif_skcipher dm_mod btusb btrtl btmtk think_lmi btbcm btintel joydev edac_m=
ce_amd wmi_bmof firmware_attributes_class snd_ctl_led bluetooth amdgpu inpu=
t_leds evdev iwlmvm snd_hda_codec_realtek thinkpad_acpi mfd_core snd_hda_co=
dec_generic mac80211 snd_hda_scodec_component drm_buddy libarc4 kvm_amd pkc=
s8_key_parser nvram drm_suballoc_helper platform_profile acpi_cpufreq spars=
e_keymap snd_hda_codec_hdmi led_class drm_exec battery k10temp i2c_algo_bit=
 video snd_hda_intel ac drm_display_helper snd_intel_dspcfg iwlwifi snd_hda=
_codec backlight snd_hwdep gpu_sched snd_hda_core amdxcp snd_pcm drm_ttm_he=
lper i2c_scmi snd_timer ttm cfg80211 wmi snd
>  soundcore hwmon rfkill button processor efivarfs hid_generic usbhid hid =
sha512_ssse3 sha256_ssse3 sha1_ssse3 xhci_pci sha1_generic ehci_pci aesni_i=
ntel xhci_hcd ehci_hcd gf128mul crypto_simd cryptd ccp usbcore ucsi_acpi ty=
pec_ucsi roles typec usb_common
> CPU: 6 UID: 0 PID: 17975 Comm: kworker/u32:11 Not tainted 6.12.28-gentoo-=
Zen1 #1
> Hardware name: LENOVO 20NKS2PE00/20NKS2PE00, BIOS R12ET64W(1.34 ) 02/23/2=
024
> Workqueue: writeback wb_workfn (flush-252:2)
> RIP: 0010:prepare_slab_obj_exts_hook+0x152/0x190
> Code: 31 f6 e9 51 49 75 00 cc 48 ff ca 48 89 d0 e9 3b ff ff ff 49 8b 56 5=
8 48 c7 c7 c9 6f ea a0 48 c7 c6 d2 1b f4 a0 e8 46 7c e4 ff <0f> 0b e9 c8 fe=
 ff ff 48 89 c1 48 c1 e1 34 0f 85 10 ff ff ff 48 f7
> RSP: 0018:ffffaa7728fb33a0 EFLAGS: 00010246
> RAX: 0000000000000000 RBX: ffff99a3e8ec67c8 RCX: 0000000000000000
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: 0000000000002800 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000000 R12: ffff99a3e8ec67c8
> R13: ffffffffa029dbe8 R14: ffff99a490b5b800 R15: ffffe7c681a3b180
> FS:  0000000000000000(0000) GS:ffff99a76fd00000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f288f146000 CR3: 0000000104f8f000 CR4: 00000000003506f0
> Call Trace:
>  <TASK>
>  kmem_cache_alloc_noprof+0x141/0x278
>  zs_malloc+0x50/0x1e8
>  zram_submit_bio+0x1b9/0x898 [zram]
>  __submit_bio+0x122/0x1a0
>  submit_bio_noacct_nocheck+0x19b/0x2d8
>  ext4_io_submit+0x23/0x38
>  ext4_bio_write_folio+0x313/0x348
>  mpage_submit_folio+0x63/0x90
>  mpage_process_page_bufs+0x10a/0x160
>  mpage_prepare_extent_to_map+0x2fb/0x410
>  ext4_do_writepages+0x2bc/0xaf0
>  ? zram_submit_bio+0x81f/0x898 [zram]
>  ? srso_return_thunk+0x5/0x5f
>  ? xas_load+0x9/0xf8
>  ? srso_return_thunk+0x5/0x5f
>  ? filemap_get_entry+0x160/0x178
>  ? srso_return_thunk+0x5/0x5f
>  ? __filemap_get_folio+0x22a/0x2b8
>  ? srso_return_thunk+0x5/0x5f
>  ? srso_return_thunk+0x5/0x5f
>  ? __find_get_block+0x262/0x2a8
>  ext4_writepages+0x91/0x148
>  do_writepages+0xe3/0x2a8
>  ? srso_return_thunk+0x5/0x5f
>  ? __ext4_get_inode_loc_noinmem+0x22/0x70
>  ? srso_return_thunk+0x5/0x5f
>  ? ext4_write_inode+0x115/0x148
>  __writeback_single_inode+0x2c/0x180
>  writeback_sb_inodes+0x223/0x430
>  __writeback_inodes_wb+0x59/0xf0
>  wb_writeback+0x117/0x1a0
>  wb_workfn+0x230/0x318
>  process_scheduled_works+0x215/0x380
>  worker_thread+0x1bf/0x288
>  ? __cfi_worker_thread+0x8/0x8
>  kthread+0xf4/0x118
>  ? __cfi_kthread+0x8/0x8
>  ret_from_fork+0x48/0x58
>  ? __cfi_kthread+0x8/0x8
>  ret_from_fork_asm+0x11/0x20
>  </TASK>
> ---[ end trace 0000000000000000 ]---
>=20
>=20
> Apart from that the machine kept running. So far that also occured once o=
nly.
>=20
> Kernel .config and full dmesg attached.
>=20
> Regards,
> Erhard

--=20
Cheers,
Harry / Hyeonggon
