Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B08C74BE1
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 00:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.149.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751677200; cv=fail; b=FO9D6Fcz9fVEkuKTJ0wERVCfJupyC//yHzLCK0QKbe7y7xw7r1AWFQc2Rf0NTIXSF5rrbH+buErRRAddk069f2l9EvWjNwbWocBkow+V03aX7x/MWL1CWFR4AlS7rF93w3y13FmuD5O0eIGeIufDkITR5Fbl0pyJNOC5uonnVbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751677200; c=relaxed/simple;
	bh=hPBnEKYCwZqXBzfpU/7ZWEJA1cup7KdhElESxor1Zpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fA8Xh77A8jgxtjBhK+yJ/RLDbni3SBmpNeqUiSxbx/WFt28FyBGp/srIoQlaXXMTWyb6zAalLvmCYOJoUW23AK1d3CtXqHMvOWzJD0rjJK62GmrbajKDgW13yMuRC2zuqpcSaWNh0Lo4bsi5KM2mFlULBoz48TV6ia/7zeMAwFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=silabs.com; spf=pass smtp.mailfrom=silabs.com; dkim=pass (2048-bit key) header.d=silabs.com header.i=@silabs.com header.b=n0eNiGMq; dkim=pass (1024-bit key) header.d=silabs.com header.i=@silabs.com header.b=NfRlRfv4; arc=fail smtp.client-ip=148.163.149.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=silabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=silabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=silabs.com header.i=@silabs.com header.b="n0eNiGMq";
	dkim=pass (1024-bit key) header.d=silabs.com header.i=@silabs.com header.b="NfRlRfv4"
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564No2mH017370;
	Fri, 4 Jul 2025 19:40:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=F4gKMnoonnzTBR9A1rN+QuOw6RPsoaVLkuTIs0CJlwQ=; b=n0eNiGMqy0/j
	jRVlHtgvfDfyqSI6KoHZjAi03NoOHcAYv8grKwmmBoNiRcP5Rb7AhDpiCc/Wz8/j
	0WdsLIk09ZrVYjYQfDhx5SoranK0cQLXJKkmK4X6Unl7ukDLN/GGDcdwHOpbWBWl
	PQlugzxAZWqcRY+2/PaihwSmk4FpCS/RRVyhzyhFyagRVMq1h5m9XHKxenSswFyI
	ZihGeglmiI/uZcw/JbV99HCVR8ScFL0hv354CMfyiwF1tv+/SMzNy5PEuyNF3puJ
	h9goEh2yuLRtwt9WvcG08JrQ03onVtUzHMLodW/9VRE+WS4pUUOy+jMaj4ngPL07
	cCbj7id9Kw==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2109.outbound.protection.outlook.com [40.107.244.109])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 47p8pvhb7y-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 19:40:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SI/PwOIZxsbg8OL8212rWup8pxCCOoHCs7jIp5cOG1kM0xmMHQlSXfNV41sGOl3dJGNlQaFpcB/UkGuVU3zlL2K+e5VjDF3+FhpF9MLq3z6nnQBz0Jh0auVF94qHeXqpc/xjQsZL6yT3Cjf1l3qIyiRGJtyJVRD1333Yc6/nxaeRLf0EB8PpUOUe+1bJEoXsOne0cvvpsTicwVujppZAluvaRQU4Xtl7OqXHaM7zpEihVZH+8iCmDHGnQM0MpTiZMDoEH25b+zcsUVZwh1qV1I0/hRvLkDwuI7Q+5gRejOZscbjr9eN2xsI/eZwoCnjAE1yvF+FpZz4j+UsjZx08zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4gKMnoonnzTBR9A1rN+QuOw6RPsoaVLkuTIs0CJlwQ=;
 b=yJgQizAPEf81fqKKiSNXKjrgMK5ZOAt1fc+89UCe12oEx5LXCOuckKeRAlwgl2QfVg/JYcOUruUoNJG2ALKPQH7LOZcE9l9jGvXmgmf7hHiY5+SUHDlyXqj0YcAQzuHjAp2YGUb7uI6tSKWQCkictZiknw/NHqlN+UZ3I/2B2FLnBAlKQnOUwmnbYv5US88b06C9zcf5HvBGtdHJGZOTLRe3VqbD8X6ANB5Eu6ZFKOKyRmNjzpZVClu5S4ApO6SQT98MQnqusyaisOV8sWH9OtZD6KDGZ4t8rsjIK6pKao/UEeAtJDHJg7wdTAQqmTMZIGpsbIGJHlJEbaOnnDx1hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4gKMnoonnzTBR9A1rN+QuOw6RPsoaVLkuTIs0CJlwQ=;
 b=NfRlRfv4ahlaZyjDFeStyHzOyG0Gm7uJ8K6kLwnBxU7iYfjrzcpM0WFX6imupApEYqdqUIfwoO/nm9DIu7AD7gofi6ddo+DOnDRGQQh6VgMIkR/ZesfN7Dy7dn5iXpYlHyjj4OdzEViKfUAUf0xhfs+6N0s5miWctO/zswykEzY=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SA2PR11MB5068.namprd11.prod.outlook.com (2603:10b6:806:116::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Sat, 5 Jul
 2025 00:40:53 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a%4]) with mapi id 15.20.8880.034; Sat, 5 Jul 2025
 00:40:53 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org
Cc: linux-kernel@vger.kernel.org, linux-devel@silabs.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
        =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
Subject: [RFC 4/6] greybus: add API for async unidirectional transfer
Date: Fri,  4 Jul 2025 20:40:34 -0400
Message-ID: <20250705004036.3828-5-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250705004036.3828-1-damien.riegel@silabs.com>
References: <20250705004036.3828-1-damien.riegel@silabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::26) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SA2PR11MB5068:EE_
X-MS-Office365-Filtering-Correlation-Id: affabde7-26f9-4efc-d624-08ddbb5c98b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RmhVU2NvVFBxSW0yN3ZtYnBaUEkxTXBiaGVQMzVFWUZON25XU2VPeHoxa1hn?=
 =?utf-8?B?Y0dVcnhGVmZqRjFBSk5lZ0pTUlp3ajB0cWdmcG5QenUrTWMxS3EyS25ycWlM?=
 =?utf-8?B?OTNJVjRlMjY4OFBJZ3hzRGdQc1UyNFdlQWs5alFSb3M2N3R1dkpxa00wQUVI?=
 =?utf-8?B?RjV4L3dxLzNsbUNjWVZMQndDUWVObVdmZ1VNYitmTlZWS1hkc1FWRHhFNUNM?=
 =?utf-8?B?S2kxeXZ3WUpaSlVxa1lJaWd4M3Q1QzkwY1NCVExmVTZWZHV0bHZja09YSDE4?=
 =?utf-8?B?MzJ2VnNRdHJpZm9uZURhUGtOZEk2UVE5LzBFODI0TVh0ZURPelhEWGd1ZjBp?=
 =?utf-8?B?blM0bFJVbU1JZVZDLzU3bWdSdHFzOUd2SlZRcVVjd2YrQndiVStRQXc3VEtQ?=
 =?utf-8?B?bjBRbnlZTXNNM1Z6RkxEdTIrUUJ5ZGRsRlE3ZnAySGlOTk10d3ZRM0NNUjJV?=
 =?utf-8?B?YjNMcW9WN2VFQW14OHZHRTg2aS9ackszUXBWbXlIRFVYSTZuSWVGNkxFSUF1?=
 =?utf-8?B?c1p3T1ZoTDgwOWtuSWtGTy9jVmlNVTBSTWpUU0RKcUZFSEYyWkVua0gxNDA5?=
 =?utf-8?B?eWNReHd4WnFYOHhWQXZVN2FpMW5IWGV1UXR3MlVZNGFsRXd3TnRVb1NIeGk2?=
 =?utf-8?B?TGZwRUs0NnpSYmowN0FiQXZsd25XSndnbjA5dHoySTNZNHdZV0pGQkZCUVRB?=
 =?utf-8?B?U2xXQWZnZ2tqb3NqeFFnSklPL3J1YXRGOTdNemhVcWg4cW9NNVl0NEoxLytx?=
 =?utf-8?B?d0xDYlJVUUZIU2ROcENlbE5PRGJzSjFqMnRBQytpQ28vV2V5VVdKNU9yQ0lE?=
 =?utf-8?B?SVczb2RlWVVIeTNldk5FZkRwMmNJd1JvMjBmNFNKWUNWbjFzaW92dzhpSzUr?=
 =?utf-8?B?dmhCMGZLbkozdFJIYTRveU5WQXFTYWs0ajl6Qk9CY3R6TlAvYlpnNzZBb2Ru?=
 =?utf-8?B?Q0dWVDhSWndpN2cxMWxackVQV3BUaHRKRTlTRXRjTEhZbFRSRElUcEVyU25o?=
 =?utf-8?B?UStYVTNrL1p3YkY4cGRkYUYrY0tXbnByQVZkQWFtREtzZm5uTmYwUnpxVDRM?=
 =?utf-8?B?SGRxY2dIaXVpOXBFL3RDUmpaSUUzMDkvZXBydUVzUmFMb29jTm12eTRwQW5L?=
 =?utf-8?B?Y3dUYjVtK2w5eC9vWk00bGFmNDBBZEhvKzBYVFJtZXFWN3U1T3BLdVhKbVcv?=
 =?utf-8?B?MGVFZUVQTnI0bXIwMUJmcDdhQmhGZE1WWnZyMTV4RzB5WnowOGFVVXRQZEJG?=
 =?utf-8?B?MlNhZjRFZUgyUlpIRnVsVXA5aVd1QzlNV2ZzSDZLOWwzQWUrc2NkbVo3ZzBB?=
 =?utf-8?B?ZFFuQzFHaVh1SXljWnorYWtJZjBBOExGSk5jem1nTDhQN2duVVkvTytxcWF0?=
 =?utf-8?B?Vi9XOXIwV1FwOVp4SENmc3kvNkovY1JtTWVXWjZ6aDVuU2ZqNnc3eXR2SkVC?=
 =?utf-8?B?ZDJHWVZITnJ2R1lNTEZaeWY0V0RUZDRsNDdtV2wybzN3Vm9TeUV4Nk14MDZR?=
 =?utf-8?B?NUdORjkzbXk3cDFwbHg1VXl0ZEd5a05GVHUvZVdHdnAvYkdJUjB4WUJsclpx?=
 =?utf-8?B?WTlwQThjMlUwYk0vMUt4NlhtNFJhdC9HTWRyMXVUYVBINm44TE53UVY4ZUIv?=
 =?utf-8?B?MG51cmFxU1V6TXFrOG8yd3YyV0xwQkJUUDlvMSs4aExvZ0tuMkRwOVNjL2tN?=
 =?utf-8?B?ajFtaFJFWlFONSs5MkJrR2pWNmY4RzFJUDdLVDFvTzNUN0o0TDQwczVqa0RB?=
 =?utf-8?B?UWlZSmVoQ2tvOGFDT1hBRnFqNFRTTC96REdTenIva1lJVXNFdlQ1YUFNV0tW?=
 =?utf-8?B?S2Q3RzNaQlUwVVNJd0ZIOWUrUllnM3BnbEJFeUJ0QjV2cmt2ZXZCWUd0ektF?=
 =?utf-8?B?amplZXNJRlVFazFpKzJ6WHBMdXk1aUZiM0NxWEh2ajRSL3dvemwwOGo5YmxX?=
 =?utf-8?B?OXA3YWhiOVZRZXM4TlQ0UDQzZU44UktXc0xWUU9qcVc4bkhFYjd1NHZOVEtE?=
 =?utf-8?B?dThWekZYS053PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFQwRDlybGFpUHVObEtLZEJGckJoUUVHMHdtNnkyRTNicWptbnVPMS92YzJZ?=
 =?utf-8?B?MmhFZEI3MTdZMm51UENoZFY5TW9EalJYOTN1OURXOWdBQi81cGc1SXN1Q1Br?=
 =?utf-8?B?NkZkUCt6N1VkcEJUNXdKQjM0Q0hRMkxrcEVWMWNvMU0wSU5zcjFWSEFJYmVN?=
 =?utf-8?B?alQ5OWZvdm4yTnA4L3R3cDU3ZEhIb0VKRCtZaU1VZW8xVEhNN3JVTGxKZmNR?=
 =?utf-8?B?SVU5ak4wbGJCTCs2VkZOUWlqSlByQnF1TjN5bWJWcVhEL3R4UVU4RVZvOWJ3?=
 =?utf-8?B?Y0FlTUl4cGV0TFczTzFWYTVUZmFFaXVPQUI3RzF1Z1hnTnF4d2xwdVJmRHM0?=
 =?utf-8?B?L1E0U0k3NFlOcW5XYk1pdE0rV3MvV2g1VzF1M292UCtwM2Fjem9XZk9odHNu?=
 =?utf-8?B?a1YvcmM4K08xSUZhZjdsdGFLQjQ5aEdxU3dVL3BDK3l0WC8rWnE4dXlTd0Yv?=
 =?utf-8?B?cWhzMzBBRkNBZW5QdlRzRTk4MTRvREtFdVRzY096amdNc1g1bm56ZVBmNHBr?=
 =?utf-8?B?aDF6QXQ1Q2h1cmNiZExEUE1rekd0QlJyc0NOMXpxMkdweHQ0aW9zRURKQWNs?=
 =?utf-8?B?MjczRC9yVml6Ym5qT3NrbEs0dW84ZkloNjYxTXQ4Y1poVlZHdmVsaUJqR2J3?=
 =?utf-8?B?KzdnUGpkUmV6WHFNUnFNZWkwMlB0bU94ZDBGU1BqQnczYzRON3NkcndZVDB2?=
 =?utf-8?B?SDN6UkVwZW5QZk5YbW1odlEyWU9NWDFXNTFqazRoUHFZMm11L1NEc3RJNmtT?=
 =?utf-8?B?N2puZFlTY0ZhcEc2SDl2UFhuQ2p2Wm5CUXNtN0lneFg5QUFneXJyWktEMmJw?=
 =?utf-8?B?K2hKTUpJdk9qUFZwOHFlTitmVDRrZ2xLMFYvVXoyUStXWXFGVTZNcG5oQi9Z?=
 =?utf-8?B?ZEx1c1F5YWZUb1VueGQ4SXgrbnVNT1hVTUtXWmV1S2FpeGt4WmJ3M1d1cFZU?=
 =?utf-8?B?em1GWWNRUXNNNHhXZUZVVmtVMlphRE1ZUGxkVTZMR2RidGQxcEpka2NxdW0w?=
 =?utf-8?B?RGRuVllWYXB2VFd1QVhlcnhseXR1c3RzdXpQRDZ4SVY4UTlCR1VZVW5hOWNY?=
 =?utf-8?B?S2tmV1pGMXhsaFY0Kzk0OHRkSkpJY0RkTCt1NDlRRFpzd0t4NnBRTzFQWVlu?=
 =?utf-8?B?czJXQlpkTXRhWHlVQ1Vla0ZuUlpseS9wWWt1cDVIbzVWSTVNcFB5ZlZRZ1FM?=
 =?utf-8?B?dmsxWEErc2QwVG02TGdPaUVZWFBJdEljZ01vNjRxUTIvajBQY2pidVBPaDZh?=
 =?utf-8?B?YUZCdi9hTjh4VnJnQVVaSkNaYTk0Uzdaa3BzQUFUS21LWUMyMWpjZE1PVGVi?=
 =?utf-8?B?aHRXd01kazE4MTZMYjR3UGtaSjBPM0d4Z0I5YzRVRWdOaXlwN292R1FpMktp?=
 =?utf-8?B?Z1VLa0lBKzVVdHlWOWt0T2lsQUtMYko5YWpOblIzR2xqaEIyc0s2UGRHeEQ2?=
 =?utf-8?B?VEROOTMzRkVhcXUwYXZ0NXBKRzN4WnFWa3hyZU5hRHkxMGRybDljNDlzVGI3?=
 =?utf-8?B?Tk1UUkVCYzUyUzJnUVk4ajU3UXZpVXlWRzA1WFpMaEMzV1BxbVJlTk84Y0Jm?=
 =?utf-8?B?eVNrWWlvamxaMkwwS0lsY20rSjFNV2xNMVllQ0lOVktzTUxESXJlYWpJWGVQ?=
 =?utf-8?B?TkVCeERIMXU5N2N3VjF5M0RNanFMay9IQi92WGs5OUJwbzluN0JNRlZmUlJx?=
 =?utf-8?B?clpwVDlpSENNdnl6YzFwZDdWNm0zek94T2UrelZmMlkvcVRVeE5pL240Y25y?=
 =?utf-8?B?RHNxOVdiNEliQU53V1dib0JaSTVsTk04YlpWendpTWxwSW8xSTVSU24yaUNY?=
 =?utf-8?B?WUVMMC83Ym1LdGkwT0VRdCs1c3dRSm15cVdtU2xQa0ZXNHBiTGdERVdFS3lH?=
 =?utf-8?B?cHE0ZHpGdTd4S3lmTlJha0VhRDc3amZIU2U4MUovLzZ3eGxGOGRsbktXN2RZ?=
 =?utf-8?B?MUw2UzREOS9nSEJYMFN5QkhBbGd4L0tJNkRhYmNWcFJxQnJiRmhwU1YzRGpO?=
 =?utf-8?B?aHFTQU9lc3pCei93eHZXNHl4ZGt3WG0yU2xiWWphNzlYWnhWOTg4UDdMMURG?=
 =?utf-8?B?M2tWelRaZnFtNUNrM0NpRDRRdFJiaWFDQkQrT2lSSDNZdlh1aVRDenljeFMv?=
 =?utf-8?Q?+1DkpW/VrT1ViauzTD8NvChfy?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: affabde7-26f9-4efc-d624-08ddbb5c98b2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2025 00:40:53.1399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0k3WtOJLWt8kY09NuSlVBcJSYFHbPyE9Ni8q4viM5MnLq4KQimjBcODPwwBNRpNDelylnayrMlf+fVaDt3en7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5068
X-Authority-Analysis: v=2.4 cv=L4EdQ/T8 c=1 sm=1 tr=0 ts=68687497 cx=c_pps a=U259+el5m5zn0mdk/7qTUw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=M51BFTxLslgA:10 a=i1IsUcr2s-wA:10 a=2AEO0YjSAAAA:8 a=GVRe3fU0mJIiiMqSPh0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 1E8GbldkeTYWMrcebihJHIOufjPBmYO_
X-Proofpoint-ORIG-GUID: 1E8GbldkeTYWMrcebihJHIOufjPBmYO_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAwMSBTYWx0ZWRfX20jrGRq4Z4Zn FNoY2ZgynX+hz+ERk9LvA3Afv+c7RfmEJa0MLQ28P5KUkZoDH9CRbokIVs4WVncypT0OHjj16OV 06SZQZVlmcRwB3m4vTn7cirwt3mCj9J8A4CYg6+hSPj78mMG4/H10pe7xjXh/VKhD11YPn0QK4W
 If32mtjxlK8U5i+T+zS1ao63du7wNg4VK5GhyPYCizvt3r3ptVC7ioZOQEKGmmY8D5QOAULdjFL GouseZTOXAC/5XiYkijkCntLl2QMN1FcIjwuv6ldHcaP8XN0Si70UuEY0mzhAKQAGChI96lVfdK vMHJBNn7fGhgA9oyshNk3Z+HPoLETy02xW27wO1k1UKWLP/jhcso8TAuO7wAYEfxF+XHrH4mKTj
 MoWHXl+w+4J/WeuiZnVt1glRnRGF1Ri0EVKpmyA7zQu86/s9QKkguwEShE3ngi7j12O9uV3a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 mlxscore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507050001

This adds a helper function for unidirectional asynchronous transfer.
This is just for convenience as some drivers do these steps manually,
like the loopback driver in gb_loopback_async_operation().

Signed-off-by: Damien Riégel <damien.riegel@silabs.com>
---
 drivers/greybus/operation.c       | 52 +++++++++++++++++++++++++++++++
 include/linux/greybus/operation.h |  4 +++
 2 files changed, 56 insertions(+)

diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
index 8459e9bc074..a599b9d36cf 100644
--- a/drivers/greybus/operation.c
+++ b/drivers/greybus/operation.c
@@ -1174,6 +1174,58 @@ int gb_operation_sync_timeout(struct gb_connection *connection, int type,
 }
 EXPORT_SYMBOL_GPL(gb_operation_sync_timeout);
 
+/**
+ * gb_operation_unidirectional_async_timeout() - initiate an asynchronous unidirectional operation
+ * @connection:		connection to use
+ * @callback:		function called when operation completes
+ * @data:		user-data, retrieved with gb_operation_get_data()
+ * @type:		type of operation to send
+ * @request:		memory buffer to copy the request from
+ * @request_size:	size of @request
+ * @timeout:		send timeout in milliseconds
+ *
+ * Initiate a unidirectional operation by sending a request message. Completion is notified by the
+ * user-provided callback. User can determine operation status with gb_operation_result().
+ * operation must be released with gb_operation_put().
+ *
+ * Note that successful send of a unidirectional operation does not imply that
+ * the request as actually reached the remote end of the connection.
+ */
+int gb_operation_unidirectional_async_timeout(struct gb_connection *connection,
+					      gb_operation_callback callback, void *data,
+					      int type, void *request, int request_size,
+					      unsigned int timeout)
+{
+	struct gb_operation *operation;
+	int ret;
+
+	if (request_size && !request)
+		return -EINVAL;
+
+	operation = gb_operation_create_flags(connection, type,
+					      request_size, 0,
+					      GB_OPERATION_FLAG_UNIDIRECTIONAL,
+					      GFP_KERNEL);
+	if (!operation)
+		return -ENOMEM;
+
+	gb_operation_set_data(operation, data);
+
+	if (request_size)
+		memcpy(operation->request->payload, request, request_size);
+
+	ret = gb_operation_request_send(operation, callback, timeout, GFP_KERNEL);
+	if (ret) {
+		dev_err(&connection->hd->dev,
+			"%s: asynchronous operation id 0x%04x of type 0x%02x failed: %d\n",
+			connection->name, operation->id, type, ret);
+		gb_operation_put(operation);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gb_operation_unidirectional_async_timeout);
+
 /**
  * gb_operation_unidirectional_timeout() - initiate a unidirectional operation
  * @connection:		connection to use
diff --git a/include/linux/greybus/operation.h b/include/linux/greybus/operation.h
index cb8e4ef4522..01dd1d89d89 100644
--- a/include/linux/greybus/operation.h
+++ b/include/linux/greybus/operation.h
@@ -192,6 +192,10 @@ int gb_operation_sync_timeout(struct gb_connection *connection, int type,
 				void *request, int request_size,
 				void *response, int response_size,
 				unsigned int timeout);
+int gb_operation_unidirectional_async_timeout(struct gb_connection *connection,
+					      gb_operation_callback callback, void *data,
+					      int type, void *request, int request_size,
+					      unsigned int timeout);
 int gb_operation_unidirectional_timeout(struct gb_connection *connection,
 				int type, void *request, int request_size,
 				unsigned int timeout);
-- 
2.49.0

