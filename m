Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2040.outbound.protection.outlook.com [40.107.249.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85451B3953;
	Mon, 10 Feb 2025 07:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739172246; cv=fail; b=MGv2TtqtndwhMO4fVqOjV/1N1KY9yOYT3ey8V1Rd9ThQyC1tJC0jlJwXo5ZvH//AsLT3ZnVwPNYF2EkkZ5J6TaLQ8r4/h9hjyTMqS0uqNUZj19MKEM4AHOJYpohH0faIgaMvSGVdoU/kaMzXGD2JpLnzs6dxRArn5MILLrrEjuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739172246; c=relaxed/simple;
	bh=R2jMtoaccjQ/NP6F79LHmvfEwXb+cAOlgok9jmuPGEY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jNDZ5u4xvszxyCHZWUKYesUk6K86eLPpsD6e4Q/nnjw3IZsGA6dh83qNwSJvLyoSA2DTeEn4bP6pTsthOLxZEzCINMW6tv/qpkq4gfLlkCmuWGnDI/VZTlUKuh1Qz+op9ALEuFrr9cyuuggC1RokzZuWfig/BBOLixAQd70TLds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LRHl0jYX; arc=fail smtp.client-ip=40.107.249.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LRHl0jYX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ASIqd+9kYbaPXfF4QqiNiC9u+7fW7QVZZP7VKlrl+IBDdITbaMiBUh7YHr4hzak1mbwyYzHCPCHft46enrjMUK7Lo1O+DXYpIAcHBWLVxpJbJ+ZtjdpjqNlYQggNkiHK5i0jg3bVh0gwMEwQCJw+1kbkalbLujawGyS3cPUF37l/m3gAtataPzMyeLQvuKJQIfqaXMdH7ZyPTAElLm79WAVMGWZRqrppa0sJpysnsKDeVrNmaYYnpjLrhwv3bOPBBMgifnlM53OqXZJNmv6uEELYR41c76reyj7NBE9wyr40Ss2LBoOo4TEHq8hPDDBfRAWZaC36C8K2huIfVXfHEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4zjrQdevkkhHFrnsjcvUfdhUrSkajkqA5RHKhKwB8k=;
 b=L+K/zG6mg5xkzI2Ot2PFW+Q83qLWbXtgXgraYTEeJYNceoyKI2Lk4T1z5MAxsTOOpa4fa0w+OC8a0SdxwZD5rRrTkaar1H0J0A6L+9j72UqBqEjPuu5CmsZRfL+foDAh3f05e7L3g7RX2MvviWeiVbmMVqjPrGhPLcgliR5/podYoitL1ZXXgQHihVorvKTQTbwAKvIkY5/nrpKB8fEKWUlEcj4IhE/j3VJTD8UYX7H1GHiN0fp2Lb+OTWIytZJe7c3//2JG9Iy1vqEXE/ZaryHNLIv3LvLQ0B5t1ZF3EN36Q8EIvZUA12xP+MbwmTPYEd9h5dY1vhfWlrUbz/GcSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4zjrQdevkkhHFrnsjcvUfdhUrSkajkqA5RHKhKwB8k=;
 b=LRHl0jYXl/N4UxUKlCzevuvFE/KndhgzyZAJh9ETNQwfB+Pnn842nFlFsGGfRiz09zNTUbyr7BoATNLnHxs0pheoxPNTZelYaTDc15KvJUvYepOPaSEzL8QmE4/5zyTIaet5bk6fkE0UxV8SNBVX2HynrIP2f52AseD4KESNfMNppc2JIqftxqWfeDJuQCDFVr6eHHhqhp7LMT/h7SvSW/ZWFaeQp6u0nKfnroGbSxYyV/gQre91MlUsdG3TK3wr6oQZ7yjb+6o2ITcYrtbYduBBGT+Zgp3Uqm4uMCNABwKQr6O9P0YoQW/Tu4iHkefNJ9Ub6CUjDT2vt7nPBsSTIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by DB9PR04MB9648.eurprd04.prod.outlook.com (2603:10a6:10:30c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 07:24:02 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::3a74:80e4:4144:62db]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::3a74:80e4:4144:62db%2]) with mapi id 15.20.8398.021; Mon, 10 Feb 2025
 07:24:01 +0000
From: florin.leotescu@oss.nxp.com
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	viorel.suman@nxp.com
Cc: Florin Leotescu <florin.leotescu@nxp.com>
Subject: [PATCH 1/2] hwmon: emc2305: Update cooling device registration to include device node
Date: Mon, 10 Feb 2025 09:31:57 +0200
Message-Id: <20250210073158.336522-2-florin.leotescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250210073158.336522-1-florin.leotescu@oss.nxp.com>
References: <20250210073158.336522-1-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR08CA0002.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::15) To DU7PR04MB11163.eurprd04.prod.outlook.com
 (2603:10a6:10:5b3::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PR04MB11163:EE_|DB9PR04MB9648:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b53b5b4-165d-452b-4016-08dd49a3e47e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?89iP3/43S9jRvEzmKMVmWt2DEYEZKHOhbilkJ/OlD7mdz03c8YclWvYP+P?=
 =?iso-8859-1?Q?+uIJnXhND2YyrflGplA+2pfXYfTg6sWqkT5A7BXjoH0mmjCjBc31919Tw3?=
 =?iso-8859-1?Q?e2dfJm2P7y2XCzfQjfJnFvn7bc4DlviYaMV+zYAutldzda/4zaBLvN9K/E?=
 =?iso-8859-1?Q?6oOR60Yg+GWwA4eUrtQ9TD/9U5+yKEY+w07J3LHXluosP6MWvOGjBOIH5e?=
 =?iso-8859-1?Q?QcBWj3JJ2dA6xocVfwqWYvvJeHbgUKLB2sWK3tf4zKH2zmqkiMlUOsyzSg?=
 =?iso-8859-1?Q?X8JRzT84leIKD65xIsbpM8AM9a9SdrNuqp3oImYX+Wdo5J+NvqC2TD1dXR?=
 =?iso-8859-1?Q?N/xMMh2AYZ4jSE34nBhxjEatt/LL/8zUeAFM2+uewnb4tGfzrHEcmY6YzG?=
 =?iso-8859-1?Q?3ItgbFlWpTE1LGty+JZ9rRLbZj7mttOHmW6istZGgScKiLCybJaZ3F86po?=
 =?iso-8859-1?Q?bR1Yb/0VGXjGdZWemgtDfHIj1H+WZfosUfRiRIn4PeJulhJMiJGlKYO1xw?=
 =?iso-8859-1?Q?NINXkLHb1Z1viSWlxgPjA1ZEc5X/7QRadEtCvPqXk5ld2w6ct61yPl1l5u?=
 =?iso-8859-1?Q?rAMMn6sbf6HqSx/yJ1pRT+JpywoBg5+odkiCGP5jZAeLquflrTBmGRpUVv?=
 =?iso-8859-1?Q?ayefLNRVQkzHGfPZCHkCgi79ZMxXMEo36MAXGFtZNnrRQwGVnO5lKynmn+?=
 =?iso-8859-1?Q?32vIekxjVvMX39b5P+laA1fL5In/W5251RFUoLpLcyZ+NysWk61lI//pnx?=
 =?iso-8859-1?Q?wCob8XfZeCkpySiIgvvtBheBJBFpFe3JKVSIO/gb/GHQnn1sRHyTrzlLwi?=
 =?iso-8859-1?Q?wK98qvmGIWsypcn8FQz8y+o005nh5u9ONJHriiRNstBHqpVu5I8tFNYqCK?=
 =?iso-8859-1?Q?kFIaB4D+ubfFPOgaQ0uhY2qZSUo1GPOTOtwzeptxJdaf4ad0fx+lX7+kv3?=
 =?iso-8859-1?Q?rjV2ViL7kVBrflCDyzd6aeBEJNNe+aUrtsDwzh2Kv0HOt4EVqUKBn5u4L9?=
 =?iso-8859-1?Q?qnLX6FutFXJnu8YbMhyEXtk1UqUv0ITWSFzjJeCdroe/ush0+nKuvo7QU2?=
 =?iso-8859-1?Q?F6zlwlEHYcsifyQofQqYrE5tLz55jMUc/YQGGRQrc3Y+W517mTfedrL5dG?=
 =?iso-8859-1?Q?PiGOsq/9/dgl+fMAXtdCZb3qwWdtPKmKT6z1B3ZtHlFpQJ7RGhJ7BXDlO1?=
 =?iso-8859-1?Q?eeJmF203KrTLUWvpQkD78bsMzf6CYPzwsLewwRjC1ZCbzL8EiomchGvQ2V?=
 =?iso-8859-1?Q?tuTndwn7LhNnsTnWiVSo2ywSmEfaMmNBn/HClsamGjR2pZFe5V7qezJJYi?=
 =?iso-8859-1?Q?Rn0hGnrAbVzUzp9UJSh1OeLEdZ+JYcCaSBCs2R9KJl5lK/7tP6TnPdirOU?=
 =?iso-8859-1?Q?4Xq16yWi+JzpYwBvDY5WgZfCOxL3yUzq9o7a3R3I/CmyAvZLi5g/g8CrLb?=
 =?iso-8859-1?Q?/Ph0lydiutvaQBlG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?kYb+03O1Jt1PmK2OwS0vDbg32VibFqnbM5hMAPvuB1kCF4ZVb8NJdDd0yO?=
 =?iso-8859-1?Q?jbI5/al/x499AXDCH6zCZSQa7BtF2oMWG2Bo1dEqIVEGLoGS4sfzyjGehd?=
 =?iso-8859-1?Q?8xrYTJnDEAV8isaWEFuIjtOYBquGCybJ50iAAOI28rxJEjpIzyAUzvXKBf?=
 =?iso-8859-1?Q?eVI6IRCCKmDtV3kXXeJi3DkaxWVNTEVgjHlLd8G/OQrkrybRnnOVw5J8bQ?=
 =?iso-8859-1?Q?5yu89jGclmAhXowi2vxyo5dW5+DsXsK+U8TnDXQqIXC9V58zFBhiLx9rLJ?=
 =?iso-8859-1?Q?qShN8cbRwaes+NKhsiD1fiXPoc/q5U/dlKG7b6cs3uOLhE8m4CzPmFR8FG?=
 =?iso-8859-1?Q?cVgpKiF2dmkkUTV00SrsIceI/u9Lb20c2rlQpBN4DmLyQtkbuswxWvy/oG?=
 =?iso-8859-1?Q?wYUtkfZgyJ6ByqNp5ayZ5Oiny4zWYxfGEZUF/nUawjkqocIbo2RwYSfPN4?=
 =?iso-8859-1?Q?ebgklkiG28iz+sCw7yTTMKLIBPL9gb89Zk8THqU12J6s4n6fNNHuZEnJrm?=
 =?iso-8859-1?Q?FQ3ukmyLds44dao4weTm0CAIXCH55KEt0fA+4ys0VYY2I1ygRpMa+C4Fmn?=
 =?iso-8859-1?Q?hLopqB2OK2bNOOZ1n0VSTTQsdLLZcds+E2rjTtDLa2OqYrh6wAMoQI2MRQ?=
 =?iso-8859-1?Q?yeTSc50ZWImLcB1ARHxONxRlixZniotvBnRcHgEYDgC8b6O5LWpFaM4ujy?=
 =?iso-8859-1?Q?dk4chdW7Bu26YjUJN3/sU3EEoda+TrgjdP8CdICis+35+L70fIC6YcGjJP?=
 =?iso-8859-1?Q?pGB63peoQPdUAV6pOHXjhACA7a4ct/8iGWdPbW4+nOsWifI6fEiiZyLu0v?=
 =?iso-8859-1?Q?s9eDxFsrquwOLo5vdzYsj68F/Esdo0UAkPMaH/hg0kuoHcxfy+If7ljlea?=
 =?iso-8859-1?Q?Jxp6BDNN+muHbAFcRixNcSfz4Lwv80fSDBYTgCoEItQWNf4ZzK1t08crTr?=
 =?iso-8859-1?Q?tw7/+aQY9f39NMlA0vgzGpLzQ6bpc0md81PmiFisHHApeEOkojINgTlyQ/?=
 =?iso-8859-1?Q?KVXNX4qCbiFwKzeuHCF8SCdaqEZSML93Rx4c7cYgwcoUOEeWxij/jeiNpk?=
 =?iso-8859-1?Q?LxVZW7SpCX+3c0J+VyX2o6pc25B4rJJMS0ulmF2CFqVYtEk2jGYqouHC+E?=
 =?iso-8859-1?Q?wTb2hdW3CdWETUspv6GcVCRdv6GeMf6jc4wHaPGxpVv3Joe4Qq981Mp/Mi?=
 =?iso-8859-1?Q?I4Hfqa49K2t7lngvlZA1oeZpVabiIKd+qGzgzVrrGeOfsCtaAkUZ2UZi5R?=
 =?iso-8859-1?Q?nWBc8U33aP/4nlSn8Qszz+VGmLFWgT6AqwogKzNn2RduqFdVoH7Nqcyo6/?=
 =?iso-8859-1?Q?Uy0nJe34jw+UEfnj7Id5iSlVHJQVyzN4kSyWiYwYaxFxQ+ZyOVDQGI6FC2?=
 =?iso-8859-1?Q?KYpBgpJg9chSS/apS3EHymcpptoF17n6Gw0xP80u5r4hEiwz4PfUrJ93Wi?=
 =?iso-8859-1?Q?Pe93e9LB8bNCY+u/f2uVesw+NHrrfWqK/oDH9Jz1nvVL8zll5Sy6n0lL26?=
 =?iso-8859-1?Q?QpQ/HGg9LuPnnnluDk9jemyaaO6gJ3rsBk67oUn1o+8Vb0kkUAOTy+0MOz?=
 =?iso-8859-1?Q?UroqqIqsYjl9AnBL73Srguwhun5DnAImlrt2sQFTFsKisvlr8No3bO/SYW?=
 =?iso-8859-1?Q?n/mFEgDjm0RapPp5V4nk/sYC439oSpGnlCyNdxZtyoru0Hf7C5fza68Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b53b5b4-165d-452b-4016-08dd49a3e47e
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 07:24:01.9652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0FRqEzO5rBEbtJssBd4QGAl2e+BRo5Sviq0SnpjPpUGHbNG/EMD9zxRe6AyqReUgR1EFThC66AsjFinEb4OfEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9648

From: Florin Leotescu <florin.leotescu@nxp.com>

This patch updates the EMC2305 hwmon driver to register the thermal
cooling device with Device Tree (DTS) node. This change allows
cooling device to be configured based on the properties defined
in the Device Tree.

Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
---
 drivers/hwmon/emc2305.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
index 4d39fbd83769..18e765902d32 100644
--- a/drivers/hwmon/emc2305.c
+++ b/drivers/hwmon/emc2305.c
@@ -293,8 +293,9 @@ static int emc2305_set_single_tz(struct device *dev, int idx)
 	pwm = data->pwm_min[cdev_idx];
 
 	data->cdev_data[cdev_idx].cdev =
-		thermal_cooling_device_register(emc2305_fan_name[idx], data,
-						&emc2305_cooling_ops);
+		devm_thermal_of_cooling_device_register(dev, dev->of_node,
+							emc2305_fan_name[idx], data,
+							&emc2305_cooling_ops);
 
 	if (IS_ERR(data->cdev_data[cdev_idx].cdev)) {
 		dev_err(dev, "Failed to register cooling device %s\n", emc2305_fan_name[idx]);
-- 
2.34.1

