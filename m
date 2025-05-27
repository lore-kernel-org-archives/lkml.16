Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EF954F81
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 07:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748329303; cv=none; b=EhlHV+uzAgNdQSw0IJlneBXVKCs3ip9WEk5DbApt+30IlUgUNbv9gBbRdOhgg1lpLpfwEoQSTILATO9AaZ9JVQWYubPTgMDX9yOp22qUH4VvOhg+iJoysJNSDI2p+jgJOm9aP5Q5JTMqCEjtZqOYn+sY1B0HXOmA93T+afKVWak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748329303; c=relaxed/simple;
	bh=B5q7fiYtct7ipR5s9umhDhISGNUUlTK6+ka1EtTe6qU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XkwqAhdjbngf0TAZRcovcY0iuBCb50Jdm+FBL3MCvE0ERWcauTi2qqdddI8Lc1GUGUTHLeRr77xyYngSMK5X7znS6gPofWfyuyNOb3E+GLjSeyf0kEl5H3tkQ8mG3bwmpv/rVLrlXj9fvZTgJv2F83vh1gKNh+BHhLcGKZ5tpR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JBpewaTf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JBpewaTf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748329301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B5q7fiYtct7ipR5s9umhDhISGNUUlTK6+ka1EtTe6qU=;
	b=JBpewaTfDyGi9JiocNwtCtJmyM3gXKY2cRZ5cWn09lMQsfDefDYf0DTpM7lYE85WC1t7V7
	Quqfw4UkNub/kM8rt/gU4NC6D4pD4suRsxbR5a+ARqMdQK0oPFiCtDS8JnlEdXiFk89ggm
	Rpx/OVc3TwryABqLYPbJvTX4SI+xhxk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-E-01K1XOMW-Vd7hvd0edrA-1; Tue, 27 May 2025 03:01:39 -0400
X-MC-Unique: E-01K1XOMW-Vd7hvd0edrA-1
X-Mimecast-MFC-AGG-ID: E-01K1XOMW-Vd7hvd0edrA_1748329298
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ad55e6f09efso225067466b.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 00:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748329298; x=1748934098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B5q7fiYtct7ipR5s9umhDhISGNUUlTK6+ka1EtTe6qU=;
        b=PTRlrMeF1vdOgoywTPfg5zF107lbigor/59rZ7/sNszh1bLv7BzRF/dXDOLAME8g67
         005oWfs/V2zQLp4JBPkmNnH5s2LBNBCw7Yh2vF6pfPfgzVuCtJGeltuOusI3fuX/wdPZ
         Hg6EYHvhUJvYKMsk791ki6ywwPQQ9Vc8ki1iJ93oKqiJOnpGszmuZdJvf8go/te1fvJi
         8upmg7HwHNhRoE76t7V1oVaI/lfjSPsM1zZvlbOQzGsfAUO+BEBIq9SxvrOr4xD6oWAW
         BgO4NQmtn7rdbOhlhsP1YIqNMX0RLewkvFChRscU3xbfIDo+HDdKYXZTtRTXIc9GIyEt
         q+oA==
X-Forwarded-Encrypted: i=1; AJvYcCXVyrjq6OXGPowuubq2BOs+jgsu14unuFrdfv0XUd25IQjBC3ygvbytOeZ32g8P9v3+XffSECYxoTVhGSA=@vger.kernel.org
X-Gm-Message-State: AOJu0YztFHnclTNTRSnz+OE7Ji30Rq3PWBTHmfC5cMCsqc/ub+1AqB02
	iHOAlqYqyiHSmj6L3PnOrtYlwyKNobRSFsMXJBckaNRk3pro8nkjHEVwTnNapYKdb5YYMyDafKy
	aTTbd8MMjV1rVnkXkFJoTZep5nprMU6X3JoMbI1JIEiexxBTgd3JE8HMuRfS1gWAIKeIRlxLpWZ
	9Y6kmTowD1D6TtqZ7OVMU57ABKn7wTm6BDAb9L+QAT
X-Gm-Gg: ASbGncuYTC8FMUv2HHnW8+5Z00kbB/2i2+Y2iY0K0ZgOWvq5xshFGQx/SHeHagSAInw
	4ktcnC0HfhbDJ0OL9o2voI12G/BT8THuD5XKiOc0ivsfqtTz401Zm4huTxJ8FTVoC5mE=
X-Received: by 2002:a17:907:6d0c:b0:ad5:a16:93ce with SMTP id a640c23a62f3a-ad85b111dc6mr992590366b.30.1748329298057;
        Tue, 27 May 2025 00:01:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoQBshOQNw97WrbnykVFfOBwRPiPHbWbzrFmHE02npKzwvCurG8dt9putxaRx9X0qa8QomW5NOXAbhteVt21I=
X-Received: by 2002:a17:907:6d0c:b0:ad5:a16:93ce with SMTP id
 a640c23a62f3a-ad85b111dc6mr992587766b.30.1748329297696; Tue, 27 May 2025
 00:01:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430144651.621766-1-tglozar@redhat.com>
In-Reply-To: <20250430144651.621766-1-tglozar@redhat.com>
From: Tomas Glozar <tglozar@redhat.com>
Date: Tue, 27 May 2025 09:01:26 +0200
X-Gm-Features: AX0GCFsfTr9K0cUsZVpZPJfwip0fpw-4aurjv4tMnr2TVu5DG8n8tuv2Ka7He_8
Message-ID: <CAP4=nvR80FQydq+4PWpD80KZfHbS43jnV72Q-brhnK22G+Dt9Q@mail.gmail.com>
Subject: Re: [PATCH] rtla: Define _GNU_SOURCE in timerlat_bpf.c
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	John Kacur <jkacur@redhat.com>, Luis Goncalves <lgoncalv@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

st 30. 4. 2025 v 16:47 odes=C3=ADlatel Tomas Glozar <tglozar@redhat.com> na=
psal:
>
> Because of the shift, timerlat_bpf_init incorrectly reads
> params->entries as 0 for timerlat-hist and disables the creation of
> histogram maps, causing breakage in BPF sample collection mode:
>
> $ rtla timerlat hist -d 1s
> Error pulling BPF data

Linux 6.15 was released with broken rtla on systems with latest glibc
due to this patch not being merged:

$ rtla --version
rtla version 6.15.0
...
$ rtla timerlat hist -d 1s
Error pulling BPF data

Please have a look at this as soon as possible, so the fix can get
into 6.16 and stable.

Thanks,
Tomas

