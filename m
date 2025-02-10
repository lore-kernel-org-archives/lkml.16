Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E060F241C89
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739202969; cv=none; b=j3Ff9n9QJhi8LHBvDDE9cnyr7HsAau7bgy29lgD+fHs7sCkpthaKtarxzKy+xXdTOa0+QTzOmS3pla4FFTsU6ZEz3GKfjgZxD74dLRdHDtqMcY9kT3+a2UPIOzf7jJl/cPCpe6Rbp9iRNfRaJ1MrGkBACfaYqCP7RgJgat41FWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739202969; c=relaxed/simple;
	bh=JDWViGqshwCrE6Nlfvl8H3oqivCzwTY/iSH5UyaRT0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lakc+3AVUyuNh8FB/nuvjbdF72wuyj+T1PcvEURa6eD7TBccv4shqLvDKMnaSabt2E+EOmY/jn5Uq31Ax/Q9l2qClnNysqD5Y7DVYtrCfpBLXDR6UCydQB5ezdIA4hRahrAAbo93LnXzktpxZusvM7s4K7ipGzRq0LOR/tvIR2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ebQ4jtTE; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ebQ4jtTE"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5dccaaca646so8882150a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739202966; x=1739807766; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLczrhEnX8LtCEBU9Vv2CXoUE7ZoNRAQSyYxfOfEIiA=;
        b=ebQ4jtTEedXGuxf0z7KNZY78+Xyi6g61dhdjzgq9welP3Vq5GrPu+HRz5YIL43tb4L
         WxF77ysbVUKW92rjAKEcyVTf/7hzuxjq8KRWB5ZE2ZuDzqEiaCjl1Zic4PZoI824Wnep
         ZT0m0d1csbiwxW7XNdatsMBvncrLiRDiQc3SrrcpPPd5/EGZ9ZpM5wngC3nCOiFp0sXb
         QIpBFHXFxNNkIWvZWalf5BdSBJUjqC8685MU1/aGbVFpdEzirBRzE6uM1hT0sthFew0E
         Sw3KlZ0syRlyjTD44qcxp9LKdaPm6HinLdB7/pv+zILN8XOtGPp7mwTxPwWb62IPfoCV
         K2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739202966; x=1739807766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZLczrhEnX8LtCEBU9Vv2CXoUE7ZoNRAQSyYxfOfEIiA=;
        b=oIU7np4hnWOnFOa3q7JVHN+K8Kp2kwfCo6bz0ugn4yn8nZK+P4A7ZS9gopg2VQxk5l
         q8ahZUiKGfPrbp1/gTMsB761DXO0ciUTMBeBqOZ/EKoswRsFvWYV04d9rSO/DhQDopUu
         XIakjZTik8qxYZ7ePJoGtbarnDI8oN9mM+wF3G4kcF6VB6hTw0rQStOMbM2oXczlS5At
         Ty7IJacNRL1Krqebfnt8xXuYyDK/TnEW0KRdzoB0XvMk/MnFpxn5EE8aOI497nei++8F
         0+y9slFHVXD6OL0dc7hrUqIcx2PwXhwa6ywJ1lzxGTFeqYxEs12Ntlz+5WodQbHpTt57
         T7wA==
X-Forwarded-Encrypted: i=1; AJvYcCWT+yufTYyaHQpDEAbVLd26i8k33bS34Uiyxad+FwZmaHP7l7kKpzEZNs6lqnS3KdRhc8JsZTBEg2CjCVg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9rP+Ta/cEpuhYARCsAKWNMiD94BNclZpmKwZbHkHXMz/pm8gF
	99NBv05hMTE+uVFKBD+888XAueEgihJqfcxdRR21vEYMH9uOeHm4+TOWCO4QbBsgPi7F+81Pa4i
	VrkOoX7wqH2DcEdjvW3hLJWMKpRc4x0l3JZRT
X-Gm-Gg: ASbGncvftcgJavh81AK+gpPUGTUR/VGspaEaI9BbU39ItcGah4UGuoVdwCUGej68oQZ
	69OUQPG88UinubSzzZNBJT7fQ8pCzMtaar8Poi1UkDinffyKXUwY3OvEFoLGLOo2rjIsblHY3
X-Google-Smtp-Source: AGHT+IGFWmgDm7hq6A6RaKGSONbcvRkAhKV9Xeb1PjCXX4BOk5HcG3obgtj/7WN8cuWYEGak/5HR9K8/Btxge7jTVsc=
X-Received: by 2002:a05:6402:26cd:b0:5de:50b4:b71f with SMTP id
 4fb4d7f45d1cf-5de50b4b863mr12936313a12.12.1739202966081; Mon, 10 Feb 2025
 07:56:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1739162392-6356-1-git-send-email-shradhagupta@linux.microsoft.com>
 <1739162428-6679-1-git-send-email-shradhagupta@linux.microsoft.com>
In-Reply-To: <1739162428-6679-1-git-send-email-shradhagupta@linux.microsoft.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 10 Feb 2025 16:55:54 +0100
X-Gm-Features: AWEUYZkdqEH-yIxQt2RFVMSzqvty10M-Vo581AAm7JrrOC4vyHrnC1UN4Is4d6A
Message-ID: <CANn89iJ3cT6BWLmFpdkxn6EeeLTM7rF0pwWGArq1gG8pk8orsg@mail.gmail.com>
Subject: Re: [PATCH v2 net-next 1/2] net: mana: Allow tso_max_size to go up-to GSO_MAX_SIZE
To: Shradha Gupta <shradhagupta@linux.microsoft.com>
Cc: linux-hyperv@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Long Li <longli@microsoft.com>, Konstantin Taranov <kotaranov@microsoft.com>, 
	Souradeep Chakrabarti <schakrabarti@linux.microsoft.com>, Erick Archer <erick.archer@outlook.com>, 
	Shradha Gupta <shradhagupta@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 5:40=E2=80=AFAM Shradha Gupta
<shradhagupta@linux.microsoft.com> wrote:
>
> Allow the max aggregated pkt size to go up-to GSO_MAX_SIZE for MANA NIC.
> This patch only increases the max allowable gso/gro pkt size for MANA
> devices and does not change the defaults.
> Following are the perf benefits by increasing the pkt aggregate size from
> legacy gso_max_size value(64K) to newer one(up-to 511K)
>
> for i in {1..10}; do netperf -t TCP_RR  -H 10.0.0.5 -p50000 -- -r80000,80=
000
> -O MIN_LATENCY,P90_LATENCY,P99_LATENCY,THROUGHPUT|tail -1; done

Was this tested with IPv6 ?
