Received: from mx0b-002c1b01.pphosted.com (mx0b-002c1b01.pphosted.com [148.163.155.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE622F5E
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 05:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.155.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739252873; cv=fail; b=gFMc3H7ljY6tOGZrLG5SnjeTgzqxetxXDuLTxN4APXN7bH+s8KACVm4X8zIPmNFD73scMYiSthcEZEnU3msKsWIXR7GCtTeHTx2/7ufYbiuYJXRg0xE+Ae9lERsNBsYO+XYQsxmsYs1EiLunsJbJB7SyALxfSsgz4rV8ggiw6lw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739252873; c=relaxed/simple;
	bh=pJe9/KES+NrruazxUq9uEv+ikyXsGOSyGy4ySYT4ztg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=GxD4wUZpZEGYLKER2XsTbpgbBWZ0QcvzW5M7OZNR10i4KV4L4nWHZ6LsryB+McEhyMJUNNA9ujLXq9CswlZxgBPRUbpiricD9LsdLIVGUuYsDPe2yw8XyXMzwGkRVJU/xJBddlrgkayQ3Zwf7hvKzff7sTDI8EWUSTgp5OobSZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nutanix.com; spf=pass smtp.mailfrom=nutanix.com; dkim=pass (2048-bit key) header.d=nutanix.com header.i=@nutanix.com header.b=c9Lc7Kz8; dkim=pass (2048-bit key) header.d=nutanix.com header.i=@nutanix.com header.b=wmyxkGxH; arc=fail smtp.client-ip=148.163.155.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nutanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nutanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nutanix.com header.i=@nutanix.com header.b="c9Lc7Kz8";
	dkim=pass (2048-bit key) header.d=nutanix.com header.i=@nutanix.com header.b="wmyxkGxH"
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
	by mx0b-002c1b01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AJHBdm030452;
	Mon, 10 Feb 2025 21:47:22 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint20171006; bh=k7X/wK0GFEAcy
	xCmIDv6p4BQOwsknmkQf1BiZ/xWWTQ=; b=c9Lc7Kz88cvrkKQk49QdMmo5ro/f8
	RRsZCk80FL7QNZhqLGpTnIWmczEbRWZUVf9tTLj1hJz59F8IipmqS7JLuFgoMkG9
	cFqeDgkepE8yyMF+y+MbGtV64xFvw8D0VmFbQ+OI0AbfbtzZPo9CVCv1gaIPdSGi
	4ZuLM7jiNYYPRTM5EeIdnk7foEzYNpVRJVEnoFR9R8iW1EzqHSmOZJrJtzZoAsyZ
	Uy3WdRPhLB1cumEkcAUGWjcG+wLImH6cWwxfIj0pdVOopu8+sp1KrhCPeNuGo6wS
	tITLm+CPkKjcUCvvJzbsHr0YKKgnF2ky7hBegeK0qe/kFD7nh44Hzt+Hw==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 44p8tpvu34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 21:47:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q9CdtbWzLWJEuCFg3ET/mX1fdaa7IPPbXK41WAG75T6eq4EgCN1qZoag3B8dbUDk0I3pl0PA4ZJbDPibsEnv0aOa0ZYewWVWnyxSNWoAMbdq2Yp5vbf1D0oLb+WFZyEywXVeQqVGEITNmGEw3FX6Et9Gm5ohOOaFLAyl/XJmes6hu60Dfr8SK89f6W29/rQSnh+Z6w+ujhfjNBo9ELbUI56gUu5n3qXXXcRt48+IqmykptY+HAJ1yInz0cQHhZknB8PFyFAB6Q4F+nbvVskEmM6GRoovpK5z27gbR3cAho14hNBOWCoXGt+Sgz8UibXGwBGlRfYOKj3LO4201kRCpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k7X/wK0GFEAcyxCmIDv6p4BQOwsknmkQf1BiZ/xWWTQ=;
 b=wRBHdDIyG+ftiRgH8SAXt1CtTVuTRwUoR5XOKHHYlIKk3Z7iPSKf5nTucO/HPplUSPGke46OdfQsSJw3aMeBWF8cu8wav+rjBZmTGDFGYVQchp+CyCodUe498GgxfhSjBdA12L/34LO4tmmbuffAhtP05nM3XDDQZMs5XY10TptCxjgV596KoIoaHlvBiMdwHY0XVdNwidgS8RA/QOGFmfTKwebxzzgrQNryTx9kE/BV7TTOyQf0iwBUT85EUCA9EJuqIyVyxXx76w2guY4I1Z6DfCEnUy8enME3RdKVifR4JUz7yWjShZBUWqdhM1VQp3is83glfPaI9QE90PQRGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k7X/wK0GFEAcyxCmIDv6p4BQOwsknmkQf1BiZ/xWWTQ=;
 b=wmyxkGxHT/BfN29JXMfl9PV5ZgBPbjm1SoG0t9RVwrypVoOy9BT2gecuED3LCoq1MnQb+uhh37StupSNc/S89bXW5nyp4uguoZFj9E3M0xDtaV8KSg1AYk1cvuU6VyhC8UENc6OCJygTAPxD/BI53ifzeEqziFKRLHdrZijzZVzFwg1slzlvZCVPUt+RJDCmKekJBrvOT9514lihDsiJ+EoxiyodhfkaBQvMw7skJq3tF7V2MGzaC/1XXfVSsEraOFzRZUGmorQzbw/SiRh2NPpgzFyKrA1yBr+xD7wDD0NhDNR6R19+p5UykuRi0cka1knLuCO1MhnX1oBJ6bDDIA==
Received: from SJ0PR02MB8861.namprd02.prod.outlook.com (2603:10b6:a03:3f4::5)
 by BY5PR02MB6740.namprd02.prod.outlook.com (2603:10b6:a03:202::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 05:47:19 +0000
Received: from SJ0PR02MB8861.namprd02.prod.outlook.com
 ([fe80::a4b8:321f:2a92:bc42]) by SJ0PR02MB8861.namprd02.prod.outlook.com
 ([fe80::a4b8:321f:2a92:bc42%3]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 05:47:17 +0000
From: Harshit Agarwal <harshit@nutanix.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        linux-kernel@vger.kernel.org
Cc: Harshit Agarwal <harshit@nutanix.com>, Jon Kohler <jon@nutanix.com>,
        Gauri Patwardhan <gauri.patwardhan@nutanix.com>,
        Rahul Chunduru <rahul.chunduru@nutanix.com>,
        Will Ton <william.ton@nutanix.com>
Subject: [PATCH] sched/rt: Fix race in push_rt_task
Date: Tue, 11 Feb 2025 05:46:45 +0000
Message-Id: <20250211054646.23987-1-harshit@nutanix.com>
X-Mailer: git-send-email 2.22.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR04CA0017.namprd04.prod.outlook.com
 (2603:10b6:a03:40::30) To SJ0PR02MB8861.namprd02.prod.outlook.com
 (2603:10b6:a03:3f4::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR02MB8861:EE_|BY5PR02MB6740:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bb2c88f-7175-4cf4-435b-08dd4a5f8b4a
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UTlBOHNjdGd4QnFqVDE5N2svd1BsUlIzVWNvRGRMRmRBZys5YlNRWUJGZUVN?=
 =?utf-8?B?eExWRE5LU3hWRGVia011VHRFMkJzMjhpT2VXNHRsSlJpdDloMlVRSi9jUTRV?=
 =?utf-8?B?YWhVbXRwY01mK0xlcjhzSkRrRW5IYlZmeldRejJsSkFKTWQ3RXEvMWxhVVVY?=
 =?utf-8?B?SHJNTk8vd3ZkL05PQVZYc2E4bU50b3ZmYzRDd3REY1Yyd2FER3FpcmlvQ0Z3?=
 =?utf-8?B?alJSM0JBNnJQVlJ6TzZTcmVabFVEWlEwNHdEdGp1Nm04WnFmeFRVTnlsMDFM?=
 =?utf-8?B?RnU5ZllrLzFyZzRLU3JoUUJuc0ZNUEJQdUl0a0RsZm5kTGN5WWZHVXdaME9k?=
 =?utf-8?B?NUhuUFhOTFZDU2pyZWtYNkw0Z3BabjI3b2paS3U4clJTcXFTaDVmOVdmbzgw?=
 =?utf-8?B?bmlUMVIzOEZnMXZzWE11VGtFWWlhcFFFRTlwZlZUQkNRQzVRT01kdEhNVE1I?=
 =?utf-8?B?bWhHT1oxV0wwSWM2K2p0TEhqbktBVFhXc2prRGF0VmRmYVcxM0NnNDE5RkR6?=
 =?utf-8?B?OWpLbEx2Y2N0N0FpLzl2TU9lNE92aTR2ZVVmVHFsNFl5bGxWNnNFR3pvSmk0?=
 =?utf-8?B?VXN1WTZySVJseVNWSElmcGpLdUpRN0xoQ0xzNncxL21lSnlyMnNxYjRlTVpl?=
 =?utf-8?B?dndXL3hWbmJOQ1pXQ0pmdVBmMzUvbS9hQzl3OWJiNVRLam9Eak95QmpUMkJq?=
 =?utf-8?B?b0dSQ1NmY1p2cFhhUm1PT3J6Z3R5K3lrOW5RL3JMaE5MK2dYMGVXUDJmQWRC?=
 =?utf-8?B?eDJOS3d6TnArNEtxdVNhVGs0TjgvTEdlOUFleHl4STlsWHF1SWNGSkdVTGNT?=
 =?utf-8?B?eGMzOFhScGFRUzBtYkpxdTJ1NXh2aEFqK1RHMHZsTTI3Ym5TYUpHU0NzZ2l4?=
 =?utf-8?B?OUtuVmd0QkdxQ2daN0FiM1NTdGI4R3ZaNllYb2V1T1VOT0lRaWxCZlRVbVFl?=
 =?utf-8?B?dngrZEErd3ZGVGo4R2ZITjJqQzk2bFFJa0lCOUxoTys3Vmh3VDJBdFJXSHRS?=
 =?utf-8?B?T1pXOE0xUUFMYnMrSHVVMGhPRHlDUGY4OTZPcEJPaDR2MkZ4RWlxS2hUaER0?=
 =?utf-8?B?Rk5MdGVEUFhtQjllRUdvVG5nTFk4ZmpreVp2MFhsKzhBYWdLNGl0K0VUUDUx?=
 =?utf-8?B?ZVlqcVpHeFBxR21FVU0yUEpSc1Jxb3F1emViS0RGeWRZak9BS0VRRWs4dGRO?=
 =?utf-8?B?dmE1TWJmT3Q1a3dDUDFqK1VCbXEwYmhKeDVXWWh2WVM0ejZuRkNacTR4Mm5n?=
 =?utf-8?B?U2JhRFVxa2M2bnlPYnYyTDRUZEhQY3orSDE4ajRSN2l4cjlWVGlGUEgyaCt4?=
 =?utf-8?B?QjQxUVBDZndMdVZaZGVjLzU1YXZ3TXlMZi9YcDVQYUs4U2xyVjFyV1hBTzBr?=
 =?utf-8?B?T3J3VlZvZ05KREN2dFhSQUc4dWoxTlp0MkxGakt2ZEtOcHcvd2hMMTdCbzJV?=
 =?utf-8?B?SDUrV2lLbjdUQ3BQNWlGMERFbGxCSzBCejQ5UDVjMWViWGs4TSt0VXlNNG9z?=
 =?utf-8?B?bVI4MlgwMXpVTlNCRHNLTHVDWVhhUUkrUzhCQmg4SGVtckVISXUyTURmQ2RX?=
 =?utf-8?B?VW85M2lmbGFGNFFEaTN0ZXc4dlAzU2dIRjRBbUNjOUNWT1AwSHBJaWMrWVJF?=
 =?utf-8?B?K09FNkZURDNCNEFZaW9Fa1orNGx1TVhBR0VBZm15NDBOUHdESlZEQnkwUmpn?=
 =?utf-8?B?emcrS3Y0ZGljYnZ3aXNNWld0S1lIb1VmNmpzM1JpZTY1eHhIVGJXWDRNTnl6?=
 =?utf-8?B?S0ZRR2I2MStzZmtjWTBLZmQrTUVSNjFJZnFTdW4rT1B3eXA4WURrS3g4eFI3?=
 =?utf-8?B?STIwZmFDWEpGK25VcnZQNGpGTkxvR1RwS0RtcVh4WmJGQ2p3WTViaVJaTWln?=
 =?utf-8?B?NE5rV0IwV2dGT1Y4QlhVZmRXcm16Nkl0K2FhL0xtaW9DT3l0NThFY1RJSTZq?=
 =?utf-8?B?THRXc3dPUlc0bU5zYWhPYW8wTnBKNGpwZDN6eXNoa2l3S0Z5VXFKWkFra2dD?=
 =?utf-8?B?UkNDeWh3OHpnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR02MB8861.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDFNeGpMRHZJN3ZTNlNBU2hVekcyOXJkeExLRWlIeFRza3piWFd3Z2xkS1J2?=
 =?utf-8?B?bW1DTlNiamo2NnJTYXlRWkh3T2hCK3JoQ1pqQ09CZU9xTTdSNWFEMlJuRmdy?=
 =?utf-8?B?bnRaQjVkZHVudGlFMXN3UjNGSnZrWXBkMUtyZmpEallQT2JuYU00UU5lcENM?=
 =?utf-8?B?RnRSM0xlakVnbVAzKzRhSFRMQ3AvMmdKbHdyY0hxemNNQ3doZGptNnRnZGla?=
 =?utf-8?B?V2o4VFBlcEdaS21ibk1MbFJVdEtoOWFKMUVKdk9QRzJWbW5CKzBCcVBLKzhW?=
 =?utf-8?B?aHdleGc5QThXR0YzTXY0NXpUTENLbzBCWVNiUVJvL251WEhpbzh3MVJ2MjFw?=
 =?utf-8?B?VHU4RjZ6cytkQ1lidk5EMXE2TlNoMlBOdC9lclZXK3NTODJWV2hpc2t0RUVY?=
 =?utf-8?B?RlVHOWEzWU45SUF3RVByREVqdXBMdVloYStMY1ZHSXduaGdMUWlJYnJnYnJm?=
 =?utf-8?B?N01vRW9sVCtYQXpUV01FSTZadFpSMlFXb0RUZC9qZ2pKWHUrcHpEczZCbkth?=
 =?utf-8?B?Zlp3cUR2U0F5cVRwZUJ2eUN5SnFObkU2RUxXc2tBdWZyYnpFOTVTUnUvZkM5?=
 =?utf-8?B?czYxK1hVNnJBamJRRTFYQjFkL0QrUUlNWFlSeDJJeHBHaXhUeVVUTlNWYnFx?=
 =?utf-8?B?L3BuRmhWOGVYalVDOU9GK3l1ZEVhT2JYTU55WG9lZDFUZWN0Q05QV1R2a2l2?=
 =?utf-8?B?aHBrS1FPOXlNZk9NNXdJU2pXcStuc1NjZitKTVltY1dGSGdzeHVrWHVGODYr?=
 =?utf-8?B?SUJ3bTU3OXR1cm11clpaUFo0dHNLL0Nma2ZlV2FlbjJoNDZBbFQwd1ZTVEF4?=
 =?utf-8?B?QUh6WHhhSEh5bUhGR2oreE5qYTBEM0dZYW40RE1sS1pLcDdSNHVQU1ZNOUFW?=
 =?utf-8?B?WVJjd2dNcEQ4VkNoRDFkMkRjQzV1OG1adm1Na3BaeVFreHNRbllWQjJFNUpl?=
 =?utf-8?B?cXBPVFdiUTYwL2hLV0VpTU15MjlsUlhNNlJ2RExtQ0tNdWVLK2xsc0k0WWVD?=
 =?utf-8?B?ZVpXc0lvaFByek9TOWlIUEl6UnRGWUxPM3hkdjRaYWxLMFBFNmxEek5lR3hJ?=
 =?utf-8?B?TTlBUWROaGpsMEVlZHlSTTdqRGVSNVplajRubVk2cGY2VGRCcFY1eEVMRmZM?=
 =?utf-8?B?VmtSRlBncWlaOS8wTUVvWHFBb2xFODZ5S1ViMmZoNEQ0RWMvSE43c281VjMw?=
 =?utf-8?B?UDhHVDlrTFFvM0t3RTBYcjQ3MnlTcXNsMnlYSU9rWnJ4OGhmSjVwZnllc0or?=
 =?utf-8?B?dkpYN0dLc1hwekFERGhlL3JKR09nTmVsZnZVUmpubUdMNlppL0lFYVdnaXA5?=
 =?utf-8?B?ckxoa2NYNUV5a1dkWXFHT2ppWmlkYUdsb1VrMnlnbVc3ZVp0cmpTamhYcFpW?=
 =?utf-8?B?MmZPUVphaWJDdmMydEM0Y2tORkp0TlpiMHNJWGd3WWFDcWF2OVc0dW92Yk1K?=
 =?utf-8?B?TDQ1aDdldnNqZ3ZDY1pYeEtKaENoWjF6aTk0KzQ4U2djc0lpODBQUXdKTFV4?=
 =?utf-8?B?NDRhb3ZQK1hiVVVneXB1VEhqbUl4S1dDSitvdlRSVlNrcy95S2xIRklpcWRj?=
 =?utf-8?B?K1g4Ti95UDZIb2MwUXVkSnJQUk95VVB5YUZhMHRDbmRtWWo3b2RBNm13Wjd5?=
 =?utf-8?B?SWJKbzhKNjZYYmtZS3lpeGJwUjI1RGFXQXg1SGo3Rm44dmd3TDROd3FXTXA5?=
 =?utf-8?B?cFEyR0x1TGhzd05tcXlpZi9ZdFRoRER4RkxIY3RnU05sZk84Zk0yWVZ4TnRE?=
 =?utf-8?B?bDBjODErSUhwczBZQWxzZlBvdHZJc0h5aUVoRjkrMDVWV0hxTSt1Nkh3TVhw?=
 =?utf-8?B?R2NvVWE0TUtDSHVMUHo1WHNSQld4UzBSbndVZlZMRzhncklnNXRBUGh0c1h4?=
 =?utf-8?B?UGtrcytRWHQ0UEhERG1FMS8wdEoxbW9GWmFoQ0Q4T0JtQkw2NW9jcjZTaW85?=
 =?utf-8?B?VWdOTGYzMGpoRmd3ZHNRQm9FNFJFb2JUNHlJVVNHY3hnMXZGSUVibFNOM1M5?=
 =?utf-8?B?d3huR21HcjhUVmp0UjBlSG5pUXUxZ1RsS2VyTFRnVXExQXEyNkh0RFdLbUlH?=
 =?utf-8?B?SDhEZXBsVFVpbjVxZUlmOTBuRmhmcmF3SHQxelNwcml4ZWlRbHZGK1FJd3gr?=
 =?utf-8?B?SWYwMUZrZ2hzZE83OTc4eTlzV3J3aDFtRkZ4NXZraEN1WjlGdFYzeFhYNTM2?=
 =?utf-8?B?K3c9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bb2c88f-7175-4cf4-435b-08dd4a5f8b4a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB8861.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 05:47:17.8835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: puf8ewV6jLRLLDlcI6gZ4g0r5Pn7x1xM/JIhkrKs03Sqv3Xo4LpP4fN4MN+V81tWcvUED+jnneYHysGVmEkIbmRReyyBzVSdNEb+Ysubr9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6740
X-Proofpoint-GUID: ZUlCN4aw4y9dDCg_cffESsCXOTgTMtxr
X-Authority-Analysis: v=2.4 cv=N/XTF39B c=1 sm=1 tr=0 ts=67aae46a cx=c_pps a=IYePPuTyj3qIg1BHBNk0GA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=0034W8JfsZAA:10
 a=0kUYKlekyDsA:10 a=64Cc0HZtAAAA:8 a=Z03Q_keH1iIUxzbuzPYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=14NRyaPF5x3gF6G45PvQ:22
X-Proofpoint-ORIG-GUID: ZUlCN4aw4y9dDCg_cffESsCXOTgTMtxr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_02,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Reason: safe

Overview
========
When a CPU chooses to call push_rt_task and picks a task to push to
another CPU's runqueue then it will call find_lock_lowest_rq method
which would take a double lock on both CPUs' runqueues. If one of the
locks aren't readily available, it may lead to dropping the current
runqueue lock and reacquiring both the locks at once. During this window
it is possible that the task is already migrated and is running on some
other CPU. These cases are already handled. However, if the task is
migrated and has already been executed and another CPU is now trying to
wake it up (ttwu) such that it is queued again on the runqeue
(on_rq is 1) and also if the task was run by the same CPU, then the
current checks will pass even though the task was migrated out and is no
longer in the pushable tasks list.

Crashes
=======
This bug resulted in quite a few flavors of crashes triggering kernel
panics with various crash signatures such as assert failures, page
faults, null pointer dereferences, and queue corruption errors all
coming from scheduler itself.

Some of the crashes:
-> kernel BUG at kernel/sched/rt.c:1616! BUG_ON(idx >= MAX_RT_PRIO)
   Call Trace:
   ? __die_body+0x1a/0x60
   ? die+0x2a/0x50
   ? do_trap+0x85/0x100
   ? pick_next_task_rt+0x6e/0x1d0
   ? do_error_trap+0x64/0xa0
   ? pick_next_task_rt+0x6e/0x1d0
   ? exc_invalid_op+0x4c/0x60
   ? pick_next_task_rt+0x6e/0x1d0
   ? asm_exc_invalid_op+0x12/0x20
   ? pick_next_task_rt+0x6e/0x1d0
   __schedule+0x5cb/0x790
   ? update_ts_time_stats+0x55/0x70
   schedule_idle+0x1e/0x40
   do_idle+0x15e/0x200
   cpu_startup_entry+0x19/0x20
   start_secondary+0x117/0x160
   secondary_startup_64_no_verify+0xb0/0xbb

-> BUG: kernel NULL pointer dereference, address: 00000000000000c0
   Call Trace:
   ? __die_body+0x1a/0x60
   ? no_context+0x183/0x350
   ? __warn+0x8a/0xe0
   ? exc_page_fault+0x3d6/0x520
   ? asm_exc_page_fault+0x1e/0x30
   ? pick_next_task_rt+0xb5/0x1d0
   ? pick_next_task_rt+0x8c/0x1d0
   __schedule+0x583/0x7e0
   ? update_ts_time_stats+0x55/0x70
   schedule_idle+0x1e/0x40
   do_idle+0x15e/0x200
   cpu_startup_entry+0x19/0x20
   start_secondary+0x117/0x160
   secondary_startup_64_no_verify+0xb0/0xbb

-> BUG: unable to handle page fault for address: ffff9464daea5900
   kernel BUG at kernel/sched/rt.c:1861! BUG_ON(rq->cpu != task_cpu(p))

-> kernel BUG at kernel/sched/rt.c:1055! BUG_ON(!rq->nr_running)
   Call Trace:
   ? __die_body+0x1a/0x60
   ? die+0x2a/0x50
   ? do_trap+0x85/0x100
   ? dequeue_top_rt_rq+0xa2/0xb0
   ? do_error_trap+0x64/0xa0
   ? dequeue_top_rt_rq+0xa2/0xb0
   ? exc_invalid_op+0x4c/0x60
   ? dequeue_top_rt_rq+0xa2/0xb0
   ? asm_exc_invalid_op+0x12/0x20
   ? dequeue_top_rt_rq+0xa2/0xb0
   dequeue_rt_entity+0x1f/0x70
   dequeue_task_rt+0x2d/0x70
   __schedule+0x1a8/0x7e0
   ? blk_finish_plug+0x25/0x40
   schedule+0x3c/0xb0
   futex_wait_queue_me+0xb6/0x120
   futex_wait+0xd9/0x240
   do_futex+0x344/0xa90
   ? get_mm_exe_file+0x30/0x60
   ? audit_exe_compare+0x58/0x70
   ? audit_filter_rules.constprop.26+0x65e/0x1220
   __x64_sys_futex+0x148/0x1f0
   do_syscall_64+0x30/0x80
   entry_SYSCALL_64_after_hwframe+0x62/0xc7

-> BUG: unable to handle page fault for address: ffff8cf3608bc2c0
   Call Trace:
   ? __die_body+0x1a/0x60
   ? no_context+0x183/0x350
   ? spurious_kernel_fault+0x171/0x1c0
   ? exc_page_fault+0x3b6/0x520
   ? plist_check_list+0x15/0x40
   ? plist_check_list+0x2e/0x40
   ? asm_exc_page_fault+0x1e/0x30
   ? _cond_resched+0x15/0x30
   ? futex_wait_queue_me+0xc8/0x120
   ? futex_wait+0xd9/0x240
   ? try_to_wake_up+0x1b8/0x490
   ? futex_wake+0x78/0x160
   ? do_futex+0xcd/0xa90
   ? plist_check_list+0x15/0x40
   ? plist_check_list+0x2e/0x40
   ? plist_del+0x6a/0xd0
   ? plist_check_list+0x15/0x40
   ? plist_check_list+0x2e/0x40
   ? dequeue_pushable_task+0x20/0x70
   ? __schedule+0x382/0x7e0
   ? asm_sysvec_reschedule_ipi+0xa/0x20
   ? schedule+0x3c/0xb0
   ? exit_to_user_mode_prepare+0x9e/0x150
   ? irqentry_exit_to_user_mode+0x5/0x30
   ? asm_sysvec_reschedule_ipi+0x12/0x20

Above are some of the common examples of the crashes that were observed
due to this issue.

Details
=======
Let's look at the following scenario to understand this race.

1) CPU A enters push_rt_task
  a) CPU A has chosen next_task = task p.
  b) CPU A calls find_lock_lowest_rq(Task p, CPU Z’s rq).
  c) CPU A identifies CPU X as a destination CPU (X < Z).
  d) CPU A enters double_lock_balance(CPU Z’s rq, CPU X’s rq).
  e) Since X is lower than Z, CPU A unlocks CPU Z’s rq. Someone else has
     locked CPU X’s rq, and thus, CPU A must wait.

2) At CPU Z
  a) Previous task has completed execution and thus, CPU Z enters
     schedule, locks its own rq after CPU A releases it.
  b) CPU Z dequeues previous task and begins executing task p.
  c) CPU Z unlocks its rq.
  d) Task p yields the CPU (ex. by doing IO or waiting to acquire a
     lock) which triggers the schedule function on CPU Z.
  e) CPU Z enters schedule again, locks its own rq, and dequeues task p.
  f) As part of dequeue, it sets p.on_rq = 0 and unlocks its rq.

3) At CPU B
  a) CPU B enters try_to_wake_up with input task p.
  b) Since CPU Z dequeued task p, p.on_rq = 0, and CPU B updates
     B.state = WAKING.
  c) CPU B via select_task_rq determines CPU Y as the target CPU.

4) The race
  a) CPU A acquires CPU X’s lock and relocks CPU Z.
  b) CPU A reads task p.cpu = Z and incorrectly concludes task p is
     still on CPU Z.
  c) CPU A failed to notice task p had been dequeued from CPU Z while
     CPU A was waiting for locks in double_lock_balance. If CPU A knew
     that task p had been dequeued, it would return NULL forcing
     push_rt_task to give up the task p's migration.
  d) CPU B updates task p.cpu = Y and calls ttwu_queue.
  e) CPU B locks Ys rq. CPU B enqueues task p onto Y and sets task
     p.on_rq = 1.
  f) CPU B unlocks CPU Y, triggering memory synchronization.
  g) CPU A reads task p.on_rq = 1, cementing its assumption that task p
     has not migrated.
  h) CPU A decides to migrate p to CPU X.

This leads to A dequeuing p from Y's queue and various crashes down the
line.

Solution
========
The solution here is fairly simple. After obtaining the lock (at 4a),
the check is enhanced to make sure that the task is still at the head of
the pushable tasks list. If not, then it is anyway not suitable for
being pushed out.

Testing
=======
The fix is tested on a cluster of 3 nodes, where the panics due to this
are hit every couple of days. A fix similar to this (logically same) was
deployed on such cluster and was stable for more than 30 days.

Co-developed-by: Jon Kohler <jon@nutanix.com>
Signed-off-by: Jon Kohler <jon@nutanix.com>
Co-developed-by: Gauri Patwardhan <gauri.patwardhan@nutanix.com>
Signed-off-by: Gauri Patwardhan <gauri.patwardhan@nutanix.com>
Co-developed-by: Rahul Chunduru <rahul.chunduru@nutanix.com>
Signed-off-by: Rahul Chunduru <rahul.chunduru@nutanix.com>
Signed-off-by: Harshit Agarwal <harshit@nutanix.com>
Tested-by: Will Ton <william.ton@nutanix.com>
---
 kernel/sched/rt.c | 49 ++++++++++++++++++++++++++---------------------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 4b8e33c615b1..d48a9cb9ac92 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -1885,6 +1885,27 @@ static int find_lowest_rq(struct task_struct *task)
 	return -1;
 }
 
+static struct task_struct *pick_next_pushable_task(struct rq *rq)
+{
+	struct task_struct *p;
+
+	if (!has_pushable_tasks(rq))
+		return NULL;
+
+	p = plist_first_entry(&rq->rt.pushable_tasks,
+			      struct task_struct, pushable_tasks);
+
+	BUG_ON(rq->cpu != task_cpu(p));
+	BUG_ON(task_current(rq, p));
+	BUG_ON(task_current_donor(rq, p));
+	BUG_ON(p->nr_cpus_allowed <= 1);
+
+	BUG_ON(!task_on_rq_queued(p));
+	BUG_ON(!rt_task(p));
+
+	return p;
+}
+
 /* Will lock the rq it finds */
 static struct rq *find_lock_lowest_rq(struct task_struct *task, struct rq *rq)
 {
@@ -1920,13 +1941,18 @@ static struct rq *find_lock_lowest_rq(struct task_struct *task, struct rq *rq)
 			 * It is possible the task was scheduled, set
 			 * "migrate_disabled" and then got preempted, so we must
 			 * check the task migration disable flag here too.
+			 * Also, the task may have been dequeued and completed
+			 * execution on the same CPU during this time, therefore
+			 * check if the task is still at the head of the
+			 * pushable tasks list.
 			 */
 			if (unlikely(task_rq(task) != rq ||
 				     !cpumask_test_cpu(lowest_rq->cpu, &task->cpus_mask) ||
 				     task_on_cpu(rq, task) ||
 				     !rt_task(task) ||
 				     is_migration_disabled(task) ||
-				     !task_on_rq_queued(task))) {
+				     !task_on_rq_queued(task) ||
+				     task != pick_next_pushable_task(rq))) {
 
 				double_unlock_balance(rq, lowest_rq);
 				lowest_rq = NULL;
@@ -1946,27 +1972,6 @@ static struct rq *find_lock_lowest_rq(struct task_struct *task, struct rq *rq)
 	return lowest_rq;
 }
 
-static struct task_struct *pick_next_pushable_task(struct rq *rq)
-{
-	struct task_struct *p;
-
-	if (!has_pushable_tasks(rq))
-		return NULL;
-
-	p = plist_first_entry(&rq->rt.pushable_tasks,
-			      struct task_struct, pushable_tasks);
-
-	BUG_ON(rq->cpu != task_cpu(p));
-	BUG_ON(task_current(rq, p));
-	BUG_ON(task_current_donor(rq, p));
-	BUG_ON(p->nr_cpus_allowed <= 1);
-
-	BUG_ON(!task_on_rq_queued(p));
-	BUG_ON(!rt_task(p));
-
-	return p;
-}
-
 /*
  * If the current CPU has more than one RT task, see if the non
  * running task can migrate over to a CPU that is running a task
-- 
2.22.3

