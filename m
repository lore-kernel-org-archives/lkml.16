Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010007.outbound.protection.outlook.com [52.103.68.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B322923F26A;
	Tue, 13 May 2025 10:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747130738; cv=fail; b=TyfSPzRfGAOcSARSFABtVuXbHlSPS56741cGcp1+U9HiO4gA3Tnm9fk96IVCBOv2xrdUkJ7MNY7jq0z6aDwqkgFlSwGdE6XusGN19W+rEFT+c0w0rUZnAaj4qcdAt+X0HyQWAfWWHRS20BHAZxOX/O0rbiPA0MCp2O+WP4XuO/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747130738; c=relaxed/simple;
	bh=TgC0iLF+NhKodgDINUSMjnVMmTg2Cioemq36r/wHzN8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=X3k5Ckk9bxN5lAI7+a8TzH9+N3w9QDsPmsUOcEqC4WT7etOjHPk+eynXmy/Y87bwdfX3C07WW4VWxdvfmbpcpFSnphhQpSniQb/DJ/eLtzxXw7eo196JDLRKmfLvkuGZYKxaLwPzoR/Z6V5AI4vFHIbJSvl9jJVN7QVyGBTLt98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=YA/9MKyE; arc=fail smtp.client-ip=52.103.68.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="YA/9MKyE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YxquxJcCr1uQBW9QdN0ooVSeKYs8tbyHoqJjbHfj/Kd7e3umBWaaZ8HPCRGLl6qVXFWtqkdibWs6lzaHluNNQPWxq4f+RQES4hHuqLuhA+cenXw+CV+7tSE5EQRmWt1Fo3XJHbN39SzXYY4K0oBcktpUL7aPHGJZDRHhEIJzvoUAWp5p9munEAtcpQHbWb+J5gHT6oylqVDBQ0fWJRph9/N8KDoJaGkH0jAIPa9r6EPAT2dM5n8L24RdypW7Wa9Fsqs6YX0D/HK66ehMrnIJaUlOenK+LQje4ajJVEgbLV5T7gHupb1UVj2bmKrf33ulI3Q+GLmYssa1qZjHKheUfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gNYY2dr3Qc8KmzFXBvhWbNlJiT2lbWZqBQbGhDRy5Ng=;
 b=ObHbAOx1OGdZcAAbuVZE632yb6SIZ4nYYWD9nF77WFH70aGfOx6S6/m7u8Rvuu47MhzdGAopu9R5vUg+d04RYXoVsT+UMOoV/7ob+OKo+mw/vcGvwLOFGZV1eAXYVS9UOHq2vg9CepYu0x1XkRfBjZwTTiZ0/rtF7qxknNy6ESvTwrVpgc9dUgckoJF83oQaZ+mJllQFyj9rdnVEtXjESa7MLkaR8M1y7UFXZQg6hi2GGJEk4CWEcj8PNhsIIDr2tg2Syz8dp8aqg84tg0KOPpyZIlKW++jYK1CChITkKMDwi1v86fbDiP2Y1oxi2zUIZ7nB+AUUm5Js/EAu5H/POg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gNYY2dr3Qc8KmzFXBvhWbNlJiT2lbWZqBQbGhDRy5Ng=;
 b=YA/9MKyEGHUpW4uaNOdLje5jNjwLwum7ELSedgOX7n1Wi7wkrs2JwRU64gaqsaoFD6SUh/Rhq8q5ElY5bJ7FDvXpmXT+Emg5+hYZdL2ChGJgdBe99c3JvcBAeN4FysDZJuu/LWb6uZwhxJ5Q5+QUb7cB48svsGz3e+J9lF2Fq2HYc+HHv2Om89Y8RYHuw52bdGFIhRkK3k4LrT+XL6b2i2wLdb5Vz6oBBcuaqwnb7rGRaAUYxyTXXWuCM4uip11oPdQckFJFw2eRYkX7m/j/dEXxl9P92SpmJpnJL/HnLL3lSQ8ua1tCCyMaZKeRNufRHXk/hBQIsvKhH+/8PH/JJQ==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN0P287MB1395.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:17f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 10:05:26 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 10:05:26 +0000
Message-ID:
 <MA0P287MB22629B5A1F6238FBBF9E3609FE96A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 13 May 2025 18:05:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: dts: sophgo: Add xtheadvector to the sg2042
 devicetree
To: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org,
 charlie@rivosinc.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1746828006.git.rabenda.cn@gmail.com>
 <af839bc200637e4eae1cb327c95ac98c82bccd52.1746828006.git.rabenda.cn@gmail.com>
 <MA0P287MB22624E52A6647B43D53DCD2CFE96A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
 <CAAT7Ki9zCYZ7u+nmQgSkgWgv+QSVb=miLRtcNQRfJFcd8JgcJg@mail.gmail.com>
 <MA0P287MB2262FF6EFEC6D01796683DE6FE96A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
 <CAAT7Ki-vamEx2f+nTJbd=WeB815ZheJV=mm7ohzBoZrsoaQV+g@mail.gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <CAAT7Ki-vamEx2f+nTJbd=WeB815ZheJV=mm7ohzBoZrsoaQV+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0126.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::10) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <f28e363b-0fe4-463c-ad61-70334384867c@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN0P287MB1395:EE_
X-MS-Office365-Filtering-Correlation-Id: d773f3bb-7e82-42ac-e331-08dd9205aedd
X-MS-Exchange-SLBlob-MailProps:
	obhAqMD0nT+76ZruCrigLPUIQMEMZUn+m0Xa0eV5f81MRvZJCobLh/x9+xVymDR2a1xFnB3zD3SxR1N4cRKnEmR/B2shRBJ7oeVIuEUuBukmk9cozLTCKXGaBFnE7Mr5paYQlhKg+QV2GSolRyipkRcovxCsr1fmgYiUNBOjLfH5Pc+acfNFt+EvHfML/Gsoj1hRSiw4kH72/cLBT0Qn6IzsjQCn9N1PQEEHO8U18JEBLJrMrOzhXXrVhFOAkLsbE4mcn7BXLJRqbxuSr74vTCYUT0+qn2B1ch5z5dB3yX5APvyMYE5KamR+GwY6TtObaKychtQtRSRoenLLt8iwa1EdWVJAdZJGkKY3ZiY4Cbon3HlvvfgrfKjv0PhdGrJVE29L/4nVtQcVUm+HIL23qNyBJOXdIzhUN/sJv6K5ptzy6UAQfkVRYSuaugx+2owBbB1Ri3ysKGwEC50Gu3kjCuMwaECmbQKPDYR17Xvaqz1SSrwOoBq4LxjUQDK9tR/RLmEVSOqJgRzTsRjkb0viGmdb3zYRunmrRtXVW9uVU199L21ucP3GyU7GFHZnxicFRKEWDdB4JNCvhWzw/UZsLAXrG/2OozkRuuom2HsHA4NJFo/1BnFrx67Q8nJpqISYadma2RevUyT6/hNX9T9qFMHNktBQX7ETXS9OMftSe15gFIqXTZghRlbX1NpDtH35hwDa4ZtNU/SEnWdR89bT6VyweIAu7zRxVQXAzYwVwyEJHbjMiVgPrfCXMWRx8N3tSXZFw5jHpnJ5AN3fGIOxRRHsGJBThir2JgLoHhPewGrt25TnvhC7YLI5UQ5sbz0H
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799009|461199028|7092599006|15080799009|6090799003|19110799006|5072599009|1602099012|440099028|3412199025|4302099013|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VUF1SzNjOVN3SnpQOEQycWdnb3ZhMG9uNk1EUVhUcWllK1VlZTRXOE1kbHhK?=
 =?utf-8?B?TDcxQXhKTHRwZ0d1bThhaUlhbWhTbXp3MENxNmp1dFgxRnJoRjF1c3J2TFZD?=
 =?utf-8?B?Y2ZBMVA2ZkFvdmFvbTNBRnRlWVlUcmw1RFFkNWtmSnp4Ny9CYTNZMTN5SGpr?=
 =?utf-8?B?aXFLbUJDc1ZKOTh2SVJMTXR5cXNoeXdpTXZ0UndIVDZvM1NIcW1mYVZVRC9k?=
 =?utf-8?B?TkJsZ0xoVkdUYUEzamVrNUphUGFCckp6bG5pOExpbWdYNEFMNU9WM1krOWlL?=
 =?utf-8?B?R21PbC9WamR6NFNXS0NLOEZvYlBuT3EwSTZYbGRyak5QTmRkUGt4QWk5WjV6?=
 =?utf-8?B?eWlpeW03OW9qOFpmMEs4UE5BZWR3cWt3SW5pb0pEZ1ltZmpWbjRoWGQvekFB?=
 =?utf-8?B?ck9pRXVEWjlzWTVadUNoY29tdmFDRkZzUmFWRHl4bVhiNlQ3WmMrdW56RE1I?=
 =?utf-8?B?ZVlXV24yaEVkaGhIKzJkOXZmN3dWWVh3cTlIRGNjdDlYNUxEN3BuRk5YOXBv?=
 =?utf-8?B?c0M1OWMvOGRwOHQvUzJQb2gvcU10WGpkSG1KMDkzZkl0eld2b2kwOXYyUlhO?=
 =?utf-8?B?ZFd5R3h3bjlnM3VTK2FSU0dWSEVoZVBJaFFwSzhiWlc1akQ5cnh6SHc1NzBs?=
 =?utf-8?B?c2ppVlNoeGRjRjVIVjhnY3FyUzdpc0Uya2t6TXhKVkRzNEJ2Nm5tSkkwbVJt?=
 =?utf-8?B?ZHZyRDdlRVUra1gremZ6VHAxYkJ3MVlEUGhZMFJ1UjFOZGJaWW1KTk91a095?=
 =?utf-8?B?dEwzSkR6bFoyekdaYTlWNHNrOWhCa2k1S1pDZ2RjajRmL2srMzlmWEFpeHBN?=
 =?utf-8?B?YlFKbnRaT0lYcEJSUWVwYmp4YUtJNXQzYkQvUHNpVEdtNndWTC9uU2lZaHlW?=
 =?utf-8?B?clBrQVBwYXRBY1YyUnBqUGE0VS9MNVduQlVYWkEzNms5YTBIL3FHbDkrRmRG?=
 =?utf-8?B?bHd5TG9nZWFWb2RCL09veURBOW9mVG13dFNMdmxkcDM3TFBOTWNKK3lBYU9Y?=
 =?utf-8?B?LzhDYStvVXBxMDhLQ3ZFLzJuN3BDVEFyTDFnNnN2RllaQTIwa2xMUjNGZVJU?=
 =?utf-8?B?MWluQlg5bWtrN2gyb09lSXU5ZkNXalZRSExCZTlXN3pMRnNXRWhWWVJQakpz?=
 =?utf-8?B?K1J3amZ1V3Nta1BMc0ZYREpONWp1bU5JUy9MdG1DUFh6UGJqZVBhYnVSUmtk?=
 =?utf-8?B?cjNOS1pSVkllWEI3cFVxWkZaM3V4UGxlVFJndHFTMGxCVXFnUEZ6T0dZVDAz?=
 =?utf-8?B?cVIzU0ZmMlBCMFNRZ09NZ1J0aUZFeGdSbUQxcTZEZW9UdURMVEdNSWNBK1gr?=
 =?utf-8?B?RUJEZ1RVVW5ENDFoWVNwblZqQ3JWd2Z5UE9XSGZyMC9zcTEvbXNnb1VXRlRi?=
 =?utf-8?B?OVNWSlBMRmVQcXA0R2lnVzNveDF3SHZ4NW4wWFkyTXZ5c0Z6WEl4dGdwUkh2?=
 =?utf-8?B?NHJnd2FNdjgzOW81Q0RGUlNkUjZvM1ljWjFlRjNHaFVKa1dyd1lGMDJnakhF?=
 =?utf-8?B?TXE3amhmK0o3SzhIeTFsNDZjV1J2bWlDZ2k2RXZsL2plVU53S0YrZ1l5SWRi?=
 =?utf-8?B?bjJmSnRIQXZMQzkxR04zWXFtRmRwbmpxWHNsRnVzR1NMRmxBSjkwYlBzUWdH?=
 =?utf-8?B?OUJ2V0grYTFBQzY4dmRYRUxsL0tMSVgzVWNCOUYvTDZtNnRxelpyVmtwMEhi?=
 =?utf-8?B?eWVISmg3WGRsOSs2SUk4MDdGZWdYQjV6dStSTHZYZElCOG5mVFBHMTIxQmRw?=
 =?utf-8?Q?qQOxUDnQrlZC/+6weq/oePOx1Xeoy3zesSGdJps?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amFtV3dGdk1vZnNOQUc5RUpqU0VJNVFZWkFDL2kzWkFZclZ5WTN5QjVoREFY?=
 =?utf-8?B?YjRmZE92MEdmOGJ0OXJOTDdXVEYxNVVDSTEvMDBjUEQ2K2YweUVRQml0bzVG?=
 =?utf-8?B?MDNrdkdaY2JnMnNvYkUrK3RJYW1LUHFjQnVmbG5ETGpWak1wV2ZUZWZmZEgr?=
 =?utf-8?B?TWxHMkh1SEFGZUhYOEZmTFdXVjMrUnJkYloxZUxXZkNXQTRUYlJWa2hBRk11?=
 =?utf-8?B?OW11SkcwRmYvV20xam9yaCtmOXpyTG5MRWVUb3phb1FiOUphaDJ1aUVlaDdv?=
 =?utf-8?B?d0NraXRGOWx2K0RkME94TnVKcHIyRXVOUWJaV0hZUG1uY2xYVjZOV01iZmhZ?=
 =?utf-8?B?Nm1SeGJMZmhzMkV3bld0TEpMcUtkTEMxM0x3c0FrMnp2bDRja2hMb3BQVWhG?=
 =?utf-8?B?Zkg2aE9TanlBMnFReHZtYjhtRFhZQ2hjelkwd3JjaGRKMkNpZ1Fzd0xVdUZr?=
 =?utf-8?B?Nk5IdnRNQ21KR2tCSVlzdlRyN0JDZ1pLVUJjNEVPVnBWNFlCNWxoYk5WdHND?=
 =?utf-8?B?RFV2aXg3NzVkUGxHK3F6ejU0THRTSlFoWjAzbnMybVZvQjdvbnJMZWVZRjA4?=
 =?utf-8?B?NHJSWE5xeUNOVzBmUHEvVjc4dCtlQ0Q5ZG92cUdkMUVqK1Y2NEc2WUYxQnNl?=
 =?utf-8?B?a1ZZakg5VnYwSEh5SmJEUU1YWHRMdlpFRS9yTUdXMVh2dTVyTnRNcEkzQW9J?=
 =?utf-8?B?eHdoWHpvem13UG9DVXVjTHpvN1RYc3FBZW95TDlMWmhGZXMzaG1RVXh0VG1x?=
 =?utf-8?B?d0N0NkVFREg4T002NGNZUkdRZUtRemc3Z2pZdnVnTFRPdHppRmp3M3dsNWFY?=
 =?utf-8?B?MVNvai9qUkFsVElQaUtlejBvMWRaY091Yjdwd2ZlOWpuZnFDK3FjYkdUQnB0?=
 =?utf-8?B?bGdiV3NaTzczbFFOeVBRZjZQaktHcWNqdXpBdGZlNDRzTU9iVmNsS2djMmI0?=
 =?utf-8?B?eCtmSGtFUlJ5REIwa05EU1I5NE9xL0xpQU10U0NHMFI5UkI5OXpxZTJ0VVNo?=
 =?utf-8?B?YUJhOU5ITTF6MTZQZ1ZFYVROem95ZC96dEZXTFRFSm85YzJnWnZvdG13WENi?=
 =?utf-8?B?ZlVYV0hpNG5tNzNFaFB6U2hSTjJ0cFJvZTJ1a1B3VTcvckRUeGcza2pka3NL?=
 =?utf-8?B?ckJ3L3NZOWVOYUM5UHlMYU5HbkltakNNVVNTUllTRjRVcWEwZnpqRjMreGxW?=
 =?utf-8?B?TUFzRTBSNzhrUlg3K0NYUVlUTFdjbVpqd3VWNlJ3MVJ5aGRDV2kvQUNLMDdJ?=
 =?utf-8?B?ZkpJTmo1bnUvMUptUU9UT3NSRVYyMjFkSUh3UjUwaXhkYUlHK2lQRDVaWDdz?=
 =?utf-8?B?dE5zS0ZONnhxM1pINlljdXpSam0xQzRhUVBsMHpjSDMwdDNqaWhiTDFOa0Nx?=
 =?utf-8?B?Sk53ajlFYXVSNXV4WWZkMDA1NWQ0K0IvUG8zc0czbjVRVXl5VHFYSEVPeTVi?=
 =?utf-8?B?S2RPSWg4L0tOUjE5dU96QmNjaitwVVdyL0JCbklPb2k5Z2VrQVNlTjR3TllI?=
 =?utf-8?B?ckp0VUhET3RMOS9LTVo2OVA1VlhXYnhyZjFRZkYzajlRanBSdllmRDdCSjBn?=
 =?utf-8?B?TU1IdmU3QUhPOGQ0dXQ2N3F1alYrSFVTN3Z1MldQb0xabHN3MFRheFlNaGtp?=
 =?utf-8?B?L2tCYkxqNVBEanVWZWI2ZmNZZ1lJZnVTL3htclVwTkQ2cTdRYlVnMW01RmpB?=
 =?utf-8?B?M0Q4Yk4vK3lHM0hieEJaVDE0LzBTTmFEQnQrcGtMOE9PZ1M1dFVQMnRnaG5y?=
 =?utf-8?Q?GTYItz4qF3ewEyISnLIUjKfjG2GTmjCz8umlBtq?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d773f3bb-7e82-42ac-e331-08dd9205aedd
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 10:05:26.6310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1395

Adding Charlie.

Hi, Charlie,

Can you please help confirm this? Is there something wrong with my 
understanding? Copied here below for your quick reference:

> One more question is about writing value of "thead,vlenb". See bindings
> description in Documentation/devicetree/bindings/riscv/cpus.yaml:
> 
> ```
> 
>    thead,vlenb:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
>        VLEN/8, the vector register length in bytes. This property is
> required on
>        thead systems where the vector register length is not identical
> on all harts, or
>        the vlenb CSR is not available.
> 
> ```
> 
> What I am not sure about is whether we should write 128 or 128/8=16?
> Assuming VLEN of C910 is 128bit.


Thanks, Chen

On 2025/5/13 17:13, Han Gao wrote:
>> Assuming VLEN of C910 is 128bit.
> I refer to the value of c906 because c906 and c910/c920v1 have the same value.
>
> Link: https://lore.kernel.org/linux-riscv/20241113-xtheadvector-v11-3-236c22791ef9@rivosinc.com/
> [1]
>
> On Tue, May 13, 2025 at 4:06 PM Chen Wang <unicorn_wang@outlook.com> wrote:
>>
>> On 2025/5/13 14:45, Han Gao wrote:
>>> You can use xxd to convert it.
>>>
>>> cat /sys/devices/system/cpu/cpu63/of_node/thead,vlenb | xxd
>>> 00000000: 0000 0080                                ....
>>>
>>> Regards,
>>> Han
>> I can read this after disable ERRATA_THEAD_GHOSTWRITE.
>>
>> I recommend adding some explanation notes in the commit message. For
>> example, when we need to enable xtheadvector, the prerequisite is to
>> turn off "ERRATA_THEAD_GHOSTWRITE".
>> I found the relevant patch is
>> https://lore.kernel.org/linux-riscv/20241113-xtheadvector-v11-0-236c22791ef9@rivosinc.com/,
>> also hope adding this will help later people quickly understand and
>> avoid my mistakes.
>>
>> One more question is about writing value of "thead,vlenb". See bindings
>> description in Documentation/devicetree/bindings/riscv/cpus.yaml:
>>
>> ```
>>
>>     thead,vlenb:
>>       $ref: /schemas/types.yaml#/definitions/uint32
>>       description:
>>         VLEN/8, the vector register length in bytes. This property is
>> required on
>>         thead systems where the vector register length is not identical
>> on all harts, or
>>         the vlenb CSR is not available.
>>
>> ```
>>
>> What I am not sure about is whether we should write 128 or 128/8=16?
>> Assuming VLEN of C910 is 128bit.
>>
>> Thanks,
>>
>> Chen
>>
>>> On Tue, May 13, 2025 at 9:19 AM Chen Wang <unicorn_wang@outlook.com> wrote:
>>>> Hi，Han,
>>>>
>>>> I tested with this patch and the machine can bootup. But I find when I
>>>> run "cat /sys/devices/system/cpu/cpu63/of_node/thead,vlenb", it print
>>>> nothing, though I expect to see 128.
>>>>
>>>> Do you know why?
>>>>
>>>> Regards,
>>>>
>>>> Chen
>>>>
>>>> On 2025/5/10 6:11, Han Gao wrote:
>>>>> The sg2042 SoCs support xtheadvector so it can be included in the
>>>>> devicetree. Also include vlenb for the cpu.
>>>>>
>>>>> Signed-off-by: Han Gao <rabenda.cn@gmail.com>
>>>>> ---
>>>>>     arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 192 +++++++++++++-------
>>>>>     1 file changed, 128 insertions(+), 64 deletions(-)
>>>>>
>>>>> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
>>>>> index b136b6c4128c..927e0260acbd 100644
>>>>> --- a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
>>>>> +++ b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
>>>>> @@ -260,7 +260,8 @@ cpu0: cpu@0 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <0>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -285,7 +286,8 @@ cpu1: cpu@1 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <1>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -310,7 +312,8 @@ cpu2: cpu@2 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <2>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -335,7 +338,8 @@ cpu3: cpu@3 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <3>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -360,7 +364,8 @@ cpu4: cpu@4 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <4>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -385,7 +390,8 @@ cpu5: cpu@5 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <5>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -410,7 +416,8 @@ cpu6: cpu@6 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <6>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -435,7 +442,8 @@ cpu7: cpu@7 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <7>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -460,7 +468,8 @@ cpu8: cpu@8 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <8>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -485,7 +494,8 @@ cpu9: cpu@9 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <9>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -510,7 +520,8 @@ cpu10: cpu@10 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <10>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -535,7 +546,8 @@ cpu11: cpu@11 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <11>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -560,7 +572,8 @@ cpu12: cpu@12 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <12>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -585,7 +598,8 @@ cpu13: cpu@13 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <13>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -610,7 +624,8 @@ cpu14: cpu@14 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <14>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -635,7 +650,8 @@ cpu15: cpu@15 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <15>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -660,7 +676,8 @@ cpu16: cpu@16 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <16>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -685,7 +702,8 @@ cpu17: cpu@17 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <17>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -710,7 +728,8 @@ cpu18: cpu@18 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <18>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -735,7 +754,8 @@ cpu19: cpu@19 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <19>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -760,7 +780,8 @@ cpu20: cpu@20 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <20>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -785,7 +806,8 @@ cpu21: cpu@21 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <21>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -810,7 +832,8 @@ cpu22: cpu@22 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <22>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -835,7 +858,8 @@ cpu23: cpu@23 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <23>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -860,7 +884,8 @@ cpu24: cpu@24 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <24>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -885,7 +910,8 @@ cpu25: cpu@25 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <25>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -910,7 +936,8 @@ cpu26: cpu@26 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <26>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -935,7 +962,8 @@ cpu27: cpu@27 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <27>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -960,7 +988,8 @@ cpu28: cpu@28 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <28>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -985,7 +1014,8 @@ cpu29: cpu@29 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <29>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -1010,7 +1040,8 @@ cpu30: cpu@30 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <30>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -1035,7 +1066,8 @@ cpu31: cpu@31 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <31>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -1060,7 +1092,8 @@ cpu32: cpu@32 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <32>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -1085,7 +1118,8 @@ cpu33: cpu@33 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <33>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -1110,7 +1144,8 @@ cpu34: cpu@34 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <34>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -1135,7 +1170,8 @@ cpu35: cpu@35 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <35>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -1160,7 +1196,8 @@ cpu36: cpu@36 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <36>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -1185,7 +1222,8 @@ cpu37: cpu@37 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <37>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -1210,7 +1248,8 @@ cpu38: cpu@38 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <38>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -1235,7 +1274,8 @@ cpu39: cpu@39 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <39>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -1260,7 +1300,8 @@ cpu40: cpu@40 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <40>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -1285,7 +1326,8 @@ cpu41: cpu@41 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <41>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -1310,7 +1352,8 @@ cpu42: cpu@42 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <42>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -1335,7 +1378,8 @@ cpu43: cpu@43 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <43>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -1360,7 +1404,8 @@ cpu44: cpu@44 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <44>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -1385,7 +1430,8 @@ cpu45: cpu@45 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <45>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -1410,7 +1456,8 @@ cpu46: cpu@46 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <46>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -1435,7 +1482,8 @@ cpu47: cpu@47 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <47>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -1460,7 +1508,8 @@ cpu48: cpu@48 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <48>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -1485,7 +1534,8 @@ cpu49: cpu@49 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <49>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -1510,7 +1560,8 @@ cpu50: cpu@50 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <50>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -1535,7 +1586,8 @@ cpu51: cpu@51 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <51>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -1560,7 +1612,8 @@ cpu52: cpu@52 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <52>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -1585,7 +1638,8 @@ cpu53: cpu@53 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <53>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -1610,7 +1664,8 @@ cpu54: cpu@54 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <54>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -1635,7 +1690,8 @@ cpu55: cpu@55 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <55>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -1660,7 +1716,8 @@ cpu56: cpu@56 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <56>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -1685,7 +1742,8 @@ cpu57: cpu@57 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <57>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -1710,7 +1768,8 @@ cpu58: cpu@58 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <58>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -1735,7 +1794,8 @@ cpu59: cpu@59 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <59>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -1760,7 +1820,8 @@ cpu60: cpu@60 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <60>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -1785,7 +1846,8 @@ cpu61: cpu@61 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <61>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -1810,7 +1872,8 @@ cpu62: cpu@62 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <62>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
>>>>> @@ -1835,7 +1898,8 @@ cpu63: cpu@63 {
>>>>>                         riscv,isa-base = "rv64i";
>>>>>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>>>                                                "zicntr", "zicsr", "zifencei",
>>>>> -                                            "zihpm";
>>>>> +                                            "zihpm", "xtheadvector";
>>>>> +                     thead,vlenb = <128>;
>>>>>                         reg = <63>;
>>>>>                         i-cache-block-size = <64>;
>>>>>                         i-cache-size = <65536>;
