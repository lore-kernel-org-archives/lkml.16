Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F208233155;
	Wed, 16 Apr 2025 09:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744794886; cv=fail; b=EYrR9Lyl3xdMx+N8TN2xn0t5V3qv/Zed/4ThBRmye6e90cu/00JPCYeDzwwHeTZpm0VnDpCsx76tjnRHZjsypu2v9PB5A4egyOnQ+0mW0K9OfQD1XKN0gMWOD5GIFPez9Uiqy3S7GpFF88WH2GOds74TNUJ8vpbGb5Kg80YmVCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744794886; c=relaxed/simple;
	bh=2aOvtJF8sTpc7sj5cn3ghAUBPrD8b8Pe/Ksz91GWphs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lEXoA7BqGq4PzROWqz3Y3zJPg+p3Cdcq74BfqTGjTcYNhcaE/tHyiDUWvgOkkGJ++6KWiL5kwW9TfRy4ajH8kvR0z9KqlvVBokU3gw6JHbCVtQyWDv3kyhQCpgmd8ayT6R6+rBS0bkjVtD0njbbAp2OKzC1v/1O3fGxDl/UlubE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BVDawiqM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hMdroG2K; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BVDawiqM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hMdroG2K"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G8NJls018350;
	Wed, 16 Apr 2025 09:14:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=QMZ+7N8zp53E+lT0VX
	kw+crVD5nj9xwZeSf7Y2L+YYg=; b=BVDawiqMGjNArGLn1q5HEPDcazmskq79Ez
	SY0RU9MCyhhiiOz7vo83CMik/JsOCK3PnKqoLtF2S/njN30J5ioUvehom93FgKg7
	c0a3L+VuTlCE1jMRzVHZblE+tdIr7vYSLwXEB6qYn0Ls0ubVyVTmQac3M7pnTdZT
	WgVWAQrFhoLN/VAhbxd9TgpKkUmZ+s/z916KgnFQ43KIyYtWOnRXCh1fjhoxvnQc
	Ow6NqmNheHzKEjIPCgcgGja4UtuOEeg0Lxvq11Vw6m9CMhyY+bhDWEAaH7lLMFzQ
	CDjlF3tfqvUx764Dw2vlgJ2STgQiFeDPksKt04x2cKONrVVD1hhw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46185mugur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 09:14:17 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53G7e72x024737;
	Wed, 16 Apr 2025 09:14:16 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazlp17011024.outbound.protection.outlook.com [40.93.14.24])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d51jrx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 09:14:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s1k996Iqe6+12z44vY6vGXH8pK8hNvK0d4pBcaAN+E4RdkSCEBZBFGs9wD99CcjdJFKtGZJdcHVci80wAqC4HTRibiUtjHBy/5UZpUQLjenMszWkFTIi/NadG0RAEodx6Yce7zVHE35L5yF24d4U8rhmasLvOsE7Z4PAEHf7CbmxrUSKtiys9BM3MyTqx+EklpTeyJG6JI/DL2ozlpF8jb0g4WQkUaraRPFwpw7Bt9hRmR980oVb+MmkNjWas29QyFxUXm3ayiv3Z4Lr0h3nRlkcegO/ORgaaTKkhr5Ocn6HNhb8Uqmx/VOfKaWFAzPMPg3ZZMr9o++Kb40JIgnfOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QMZ+7N8zp53E+lT0VXkw+crVD5nj9xwZeSf7Y2L+YYg=;
 b=Gtp9oPniuSWyx1hTolOFkd73GJY1wksAbNa1/KfJKAjSsXfY94lKXgVD24aNaO5/4jJBywoouL+JSH70jDJJrys6jwGujiHLvLKkDIchNghiP0onxbltbdG1TwlUAljVR+S8lqzwf9QBwutZzK6LpS6PvDY0aUcZsbARWKL+rEXKJSp7VlQFIsKTvnN3Og/A8YCQtwuOKV6YMXLRJSIqYRB6f0beJGmxvPOzgvREMXw7BS793DNOClBgdO6NTmwXI/h+SOKholBSAlLrTKbOKgwV/RCknfpOIxZrTh/vw3T1mmQiYRQ41mwHzKci8uTp5s3t8gIYLJK51wLJw4bwQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QMZ+7N8zp53E+lT0VXkw+crVD5nj9xwZeSf7Y2L+YYg=;
 b=hMdroG2KIrAEZZnk7VqFefnIh3OK73UQVlHU2zyOPTY64RQ9dkWyRMPomv94Yz1Lxgy5jF6l1iMZsodwHNK2Wr1tMvR2NjRJiES/2uk2E5i9FHagT4JhH9VHYBToFLrJL/DjLLDoqy2MKooq19omydfMGn7XJOo8O4F1zd1f2Oc=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BN0PR10MB5159.namprd10.prod.outlook.com (2603:10b6:408:116::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.21; Wed, 16 Apr
 2025 09:14:14 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8632.036; Wed, 16 Apr 2025
 09:14:14 +0000
Date: Wed, 16 Apr 2025 10:14:12 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: akpm@linux-foundation.org, Huacai Chen <chenhuacai@kernel.org>
Cc: WangYuli <wangyuli@uniontech.com>, corbet@lwn.net, kernel@xen0n.name,
        jeffxu@chromium.org, Liam.Howlett@oracle.com, kees@kernel.org,
        hca@linux.ibm.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
        xry111@xry111.site, tglx@linutronix.de,
        thomas.weissschuh@linutronix.de, Jason@zx2c4.com,
        zhanjun@uniontech.com, niecheng1@uniontech.com,
        guanwentao@uniontech.com
Subject: Re: [PATCH v2] mseal sysmap: enable LoongArch
Message-ID: <d49c78ec-1192-479b-a008-29c202eafac1@lucifer.local>
References: <648AB3031B5618C0+20250415153903.570662-1-wangyuli@uniontech.com>
 <6954e026-94d2-4d96-a8f6-eddf0353598b@lucifer.local>
 <CAAhV-H4=SZrJjVwVv6fqxTZn9ODP-s1ZEgYKTmHMPH7aoJuvng@mail.gmail.com>
 <21558466-962c-4fb9-953b-911d2a586cbc@lucifer.local>
 <CAAhV-H5mMFVbhuLD9FmarZs9x_gxGrFViw92-wkUmoX2AzMGHA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhV-H5mMFVbhuLD9FmarZs9x_gxGrFViw92-wkUmoX2AzMGHA@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0223.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::12) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BN0PR10MB5159:EE_
X-MS-Office365-Filtering-Correlation-Id: 4313491c-851e-4716-0792-08dd7cc70e7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wKSRkMZYUDMk0TI7FQp0MU36xB1LUqTAcvwAYXeRsTnjjuuP4Pf6rbmuqbPV?=
 =?us-ascii?Q?Z0kC36guKLQrLxbOEGR1ozBFZ2SvwhUSAmx1lYHH/T8p9DwS26ggCglVerdB?=
 =?us-ascii?Q?hivDF0VoLZYqxGb4XoFjhOuC9HX090KU6W3ds3gWTHboHl1qSwZ/plo6HvMZ?=
 =?us-ascii?Q?10sRd36C7u7zUFzUU5KhUusDKoljRj/3U5BamQit5asHimspbtlO4eNdoRo8?=
 =?us-ascii?Q?wzB8PWBOQ47IBYQdqpc9uep4icv0aDKiMAiQZD7RL709V6rJ6YtfRNyxlWV5?=
 =?us-ascii?Q?HFsxRXfJKtfaMil2vma9GOIp8N9RrwbWlwejTuNL7qcA/KjX46EtqIeXQt2f?=
 =?us-ascii?Q?KakirNZeTi2cWD4N47tACsEJkWcxnyj97mJqUUrVLq/4Z5oYOc7n7ZE+5DAp?=
 =?us-ascii?Q?6w10GVh9adFoXcgGwhEF5o0Zk0CIjmrcNqhN41qVOvgWnUC5yYW1TD5PRAo2?=
 =?us-ascii?Q?/MK/xU9n0bmRKmzAalQs4N984QwyINA7krKQxLQ+7QwcrFobsy3QyZeIV282?=
 =?us-ascii?Q?i6O6PI9IakRDxN0ehqDwT0LxP4Mep3HNWbNwo7KRB8iaN/BwjDTr610aOAZm?=
 =?us-ascii?Q?gOAfL49rJp2lgq/JLsJvX5ORzZWwiPy2KiEnLPk4OTAvOp/7J3gsaO29gbba?=
 =?us-ascii?Q?TTZUS6MDKbWoa8GTUEc37Suu+omdLSPwtwoWkX+OyyX4gzLCjifnQ3p5LOGU?=
 =?us-ascii?Q?GnfZveqUjfJOmR4fSMbs+CFWKYUtgrXfKmrv6VhpUGhTDCpWaKerOmLrYYTG?=
 =?us-ascii?Q?JYbq6cB4lB2LY023UiJIw/mvUkOVlX13Gq5MGKvkzoAe7jtbJBS17OmIZrrq?=
 =?us-ascii?Q?tPMQq72FYV+ttF1d6JBd3piGpda2yKL5V58Sw3H2UHkCTZe7DIpqTdSNSWeZ?=
 =?us-ascii?Q?+lG6txQK1YHClTgW09K2hp472gg5l2x5cA4K31ctT3hKEmWGkoEATa2Axn46?=
 =?us-ascii?Q?JXTTfxPwnMf32jZWk4xJ71NM/vzlEtDiDbbaDXTXQbLRsYqvc+/Mvgtw1N8Z?=
 =?us-ascii?Q?JQK+xMHPmquWE7Wey6w1b5VoeQ6x0QhTf+AGPR/uvOwTRGHhLyTdaI6lCX9A?=
 =?us-ascii?Q?LB800tM0/dz5HWeKwa7zlK/yrMxoc5lAVTsuJlUxZA+cFA3OqndQHuGQuIXI?=
 =?us-ascii?Q?TeVm0KjLd3scHntr8yJ/JbBcf/p4p3/3zZa5fjJs+1Ktv68UM/WrNh1NbUCw?=
 =?us-ascii?Q?wBuza5EsK2Ubo+GhkTa0t/UyjiAxIsZ8FmjDkfHSSkW02dF1cnH0YJNduTDV?=
 =?us-ascii?Q?C6Bsq9mSaN+wkXqvWWZKGusI6aCC5dqzNvYcivSJBpUthnq3i/rC7eOTKryk?=
 =?us-ascii?Q?9lfGnTVadjnBuXYh/O6dO1anFrKI23Zf84yYD7mZ49Pio4bjWx6UIwFB1tc0?=
 =?us-ascii?Q?GzdoCEW6yX+hyzYw0bggA1rQSrL3VEgpyrii72K9D2VsYg1wSwFqjV4SA9qL?=
 =?us-ascii?Q?REMNucz9NBk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jHnP0ImdcWCSkIs502wfzvLzS9ZrAKMeM3bBVX5tzTn2jle/D52vl+O0FltW?=
 =?us-ascii?Q?9lCVR+bs70fZ2Eyti/oQ7DAmtOPMcPuzG+QEE+2FsK+4o52ftnqHpV5wmfgL?=
 =?us-ascii?Q?m3BwDkKqRQx3JrpGlJgYjbf6Cz9VqCq9AIVyXcSZmimwyOycy9QeY+2/fj+s?=
 =?us-ascii?Q?7bNQVCfx0AwNCYwFEXQ1hwWDWdgCuY/yfKAveiN8zOchqAHS7I0I3d/VK62o?=
 =?us-ascii?Q?QWYSd4o+FUW9Ii1vQkHJMLZqawZy/BZLRh7G9xAyfM1y9+IMnLFqo0mw5gTY?=
 =?us-ascii?Q?kzgKNLLI4LwQhIp2UbpRdIeiDKEhCNOyPzPGyyZPOkhpy034XGHa9ebD5Bci?=
 =?us-ascii?Q?gJe+6nOF7bHdi9d/+lpso0TpRuf9evGLybOCCsN/+tHYjcFWPUAdeH3AbZCz?=
 =?us-ascii?Q?H/A1GLsonTppbBz6PBJFMJFyTH+gWbWAHo0TFkYgy9DNwzEbAD5xUS5FhgFy?=
 =?us-ascii?Q?HEu5qjccLMzv5kTOqHHwNbfs/DVBxiX9zezA4UQmuZ5TQNCrQMeQg3py6pSM?=
 =?us-ascii?Q?5YVse1GrpBXdeDEQY8Y0NIjUAQhVkVCobxD4kE8BO2mapuENexAdI/9dP7ev?=
 =?us-ascii?Q?rR8TWCwKFm4ole7SGpExqnDfhI6TTNEipdvAnwYCW6oo3+G/cUYDeCum5Lr7?=
 =?us-ascii?Q?2wHpK4Uvh9r9hw8bE+v6Bff+fkBcltpQgCO6+rleq2ik5edwkfpZttm8z+zJ?=
 =?us-ascii?Q?CrIL6gaf4hnSr9D4vNJK7aPq6ghwmOLWLs1WmRlz6h4zHTZCTVhAXlgiF1xE?=
 =?us-ascii?Q?JyoQVHIuN07iDpSSIapbN+owtoP2tRMD+z4pG7JZeG1ZOLPQxDXE3FGhcv1D?=
 =?us-ascii?Q?Te14NYtxnkmREl3E2CwOQV2qqXanc/2hBzF6qmNzoqXDmhM3jNeLfgp+VQZ0?=
 =?us-ascii?Q?5K2TmhRMHMeTEX3QITTWviOSvdw28uH4ZpUXNaeV6ICIAJX4OJzSGLjE/JAi?=
 =?us-ascii?Q?nvxTE4rN+yXKfwO7Uuv+IanRzUy9Uoq9t8aw9sWpQD5qG0+6RQKbS5hZq5v8?=
 =?us-ascii?Q?e5Dy+t57Cm6hIHMbMnW+Y0ZWsymVURzdoK0+kbhb8GLxLT3/jmIa4uWyVfWw?=
 =?us-ascii?Q?AdvflHsjcAsUEzG5LMI9c2lapGBeC6r/XIQrQSqxuzZOvT8QLY5Hvni9yRjk?=
 =?us-ascii?Q?ak/f4qQ4CzBdZujXBzKfzxk1qS+DfvQHNEGn8epJQYy3KwlINHkSzolchOVs?=
 =?us-ascii?Q?NCeky2aY5hZ+4aHXKXRjw+bwQyz5/odooNhQQAjKVn04h5NumNLVUGV7jPHI?=
 =?us-ascii?Q?CBqMGsvR/W9d5k1y8qXwJXq47clRwgNkFsKl9fa7gqbbNwKiDARwK0psSUE0?=
 =?us-ascii?Q?C1yNSP+tIiBbbfh80Hss5ZSdL0+HM4JJdWzfmaDQQUtJRPknso8JDnuE9qpK?=
 =?us-ascii?Q?9p3EuiiQF59ExHvw/CX3GjaK+UK73hFJqTlWqGUA7bvHhOe1lZ/IbJvdD6ld?=
 =?us-ascii?Q?xYnXb+5JT02ZwQbBD0VsND9Kbiw5ieWtV8XzspTUHAA4+l6d+OBZEndazHAD?=
 =?us-ascii?Q?g2nRPQzC68k47qXiOZawsz4tjqWadRS/4vJzWi7qHDnCR0awzPev52U6YU1k?=
 =?us-ascii?Q?uYOEapH0393nEjhjkG29F4fa/fQjc9E3UbChyQ8OY6FaeafkseKDboriQgrr?=
 =?us-ascii?Q?Ow=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mA41yzl80NMTseZtpuGxaYizpuFAiGAsXC5i+cd4F7ErfZEIJrvOaDs+rBG2ksgiTNji4PpoB2A/Ka8p9/clFoBueG6VzqOrCqaAbO3I+P/FkOQ7vWEePtCCv6liIjF5unNK7EQZzsgGtbG3Jeb35bscZxazrDPQuuFXQ67nE9t4VMl1/8oAsmXI0+IqvWh9lHKbXEDVflesc1tkl/wvuo6WZWSs5FbB2/aagf1cnrMgKyaIHRJjg+1omwRfCkhq0p6gb9h0Dr+pDN9225rzohhOe4hV0+k2jFk+p6of+cn9ujEKgMp4Q/gW99ORnyaKF3GQswToN8K57hyHOzfJ0NOdt23nTCaKcXru/QgIIynjW1iM19dz0KgQ3CY7hxgX4S2/LA4uDoLY/f9qJJOgaoHAdlYGHpvDMCUbR5aWhtIhy5QNgr10T7a7mqdzfNNXb85c55qAiJ1nPFXWNvOEuS/OYieL764dIxZDeIHsyZLqYd6w4BLvUv4SYygFOZlAMXV37TDKgYnTz/czwPTDKCnIEnoDZq9M1V9pA1t6odar/O7X4XW86wWhzQT/Evr+1vM4Rk3vfOU8OUkipGggrJ9QCMv5ksoJpz6C+/+CRzA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4313491c-851e-4716-0792-08dd7cc70e7e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 09:14:14.0619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ktFteNKGHb66pTdN16SR+W+nHLxXHZNJrtYGmaemotlsBP3XwFT/x5cd/x02PHZgL9MJx6RQx5wGDHWJG1KQyj7wZzxKSRXvdEOuXDcN6Bo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5159
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_03,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504160075
X-Proofpoint-ORIG-GUID: CTkisvoMFj1p2JDxpK8hxOsoVHkSktCk
X-Proofpoint-GUID: CTkisvoMFj1p2JDxpK8hxOsoVHkSktCk

Hi Andrew - can we drop this from mm so it can go through the arch tree? I think
this is more appropriate, thanks!

On Wed, Apr 16, 2025 at 05:11:20PM +0800, Huacai Chen wrote:
[snip]
> In V1 you suggested this patch to go through the arch tree. But I saw
> Andrew has already taken it, what should I do now?

Can you take in your tree please? Andrew should drop, I really feel the arch
tree is the appropriate place, as this is purely an arch change.

Thanks!

>
>
> Huacai
>
> >
> > Thanks, Lorenzo
> >
> > >
> > > Huacai
> > >
> > > >
> > > > >
> > > > > Link: https://lore.kernel.org/all/25bad37f-273e-4626-999c-e1890be96182@lucifer.local/
> > > > > Tested-by: Yuli Wang <wangyuli@uniontech.com>
> > > > > Signed-off-by: Yuli Wang <wangyuli@uniontech.com>
> > > >
> > > > LGTM,
> > > >
> > > > Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > >
> > > > But let's get some R-b's from the arch people please!
> > > >
> > > > > ---
> > > > > Changelog:
> > > > >  *v1->v2: Modify mseal_sys_mappings/arch-support.txt.
> > > > > ---
> > > > >  .../features/core/mseal_sys_mappings/arch-support.txt         | 2 +-
> > > > >  Documentation/userspace-api/mseal.rst                         | 2 +-
> > > > >  arch/loongarch/Kconfig                                        | 1 +
> > > > >  arch/loongarch/kernel/vdso.c                                  | 4 +++-
> > > > >  4 files changed, 6 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/Documentation/features/core/mseal_sys_mappings/arch-support.txt b/Documentation/features/core/mseal_sys_mappings/arch-support.txt
> > > > > index c6cab9760d57..a3c24233eb9b 100644
> > > > > --- a/Documentation/features/core/mseal_sys_mappings/arch-support.txt
> > > > > +++ b/Documentation/features/core/mseal_sys_mappings/arch-support.txt
> > > > > @@ -12,7 +12,7 @@
> > > > >      |       arm64: |  ok  |
> > > > >      |        csky: |  N/A |
> > > > >      |     hexagon: |  N/A |
> > > > > -    |   loongarch: | TODO |
> > > > > +    |   loongarch: |  ok  |
> > > > >      |        m68k: |  N/A |
> > > > >      |  microblaze: |  N/A |
> > > > >      |        mips: | TODO |
> > > > > diff --git a/Documentation/userspace-api/mseal.rst b/Documentation/userspace-api/mseal.rst
> > > > > index 1dabfc29be0d..ef733f69003d 100644
> > > > > --- a/Documentation/userspace-api/mseal.rst
> > > > > +++ b/Documentation/userspace-api/mseal.rst
> > > > > @@ -144,7 +144,7 @@ Use cases
> > > > >    architecture.
> > > > >
> > > > >    The following architectures currently support this feature: x86-64, arm64,
> > > > > -  and s390.
> > > > > +  loongarch and s390.
> > > > >
> > > > >    WARNING: This feature breaks programs which rely on relocating
> > > > >    or unmapping system mappings. Known broken software at the time
> > > > > diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> > > > > index 067c0b994648..54ed5b59a690 100644
> > > > > --- a/arch/loongarch/Kconfig
> > > > > +++ b/arch/loongarch/Kconfig
> > > > > @@ -69,6 +69,7 @@ config LOONGARCH
> > > > >       select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
> > > > >       select ARCH_SUPPORTS_LTO_CLANG
> > > > >       select ARCH_SUPPORTS_LTO_CLANG_THIN
> > > > > +     select ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
> > > > >       select ARCH_SUPPORTS_NUMA_BALANCING
> > > > >       select ARCH_SUPPORTS_RT
> > > > >       select ARCH_USE_BUILTIN_BSWAP
> > > > > diff --git a/arch/loongarch/kernel/vdso.c b/arch/loongarch/kernel/vdso.c
> > > > > index 10cf1608c7b3..7b888d9085a0 100644
> > > > > --- a/arch/loongarch/kernel/vdso.c
> > > > > +++ b/arch/loongarch/kernel/vdso.c
> > > > > @@ -105,7 +105,9 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
> > > > >
> > > > >       vdso_addr = data_addr + VVAR_SIZE;
> > > > >       vma = _install_special_mapping(mm, vdso_addr, info->size,
> > > > > -                                    VM_READ | VM_EXEC | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC,
> > > > > +                                    VM_READ | VM_EXEC |
> > > > > +                                    VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC |
> > > > > +                                    VM_SEALED_SYSMAP,
> > > > >                                      &info->code_mapping);
> > > > >       if (IS_ERR(vma)) {
> > > > >               ret = PTR_ERR(vma);
> > > > > --
> > > > > 2.49.0
> > > > >
