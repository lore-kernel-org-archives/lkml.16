Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BF91DFDB8
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 16:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744992525; cv=none; b=h6bwY8mFudR1mfajlWPTnLHIUgqRxBI38zRZn3c0EAETSMIBw58U6PToEfvRSnEOUVkFfq7H57uaiglEucAntvOwB0l3iYgApnrfqOgLRCsFDhcEj1fApyJlxcGkOKfWEmkTHmPm/nvWWH7uNDF8qIW6pub7/t++63xqJo+M634=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744992525; c=relaxed/simple;
	bh=GTRsdQyPhwEI7P5aYqr8HqSfKQVDCSCnob+lAcXVoLw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=K1lpGzO6rUDTc+K/IKKFhNzcSKGNtf5Nd3edna6fRJxbr/hKn236G429/KapZtg6SbZfr7Xwskypk1AtK1Kc0OlijP/qHZZZVUnMs26RTRl0nbDWM7NCNh1tujh//01zapCXEKLKIznu+Y2Dw5i3z8duXNohRWpB3q+McMM4kAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=OUc7G6LQ; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="OUc7G6LQ"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb12so319706a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 09:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1744992522; x=1745597322; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GTRsdQyPhwEI7P5aYqr8HqSfKQVDCSCnob+lAcXVoLw=;
        b=OUc7G6LQ73mGB3DSetYq+jgZEbW4ByPEhGZOhVLDWDlIX11Khz3KdmAJaLD7k+vveH
         q8oOBBBvxNkk0J9aApAIkkhXudc7L+kKIPlwaaV4IPHmUJjnAGwhneydTEl69jaIB+OR
         z1bIt9HDDFLliHRvUMG85CID1HNVNR+pSNWgJu1vqrszyX7PpCLNi1Nclg/sr8wYVpOz
         rckvt6+U1/KJ3XqkdeXsLQPh1a2pD+I0SSTBuAMbrkhHfUfpy/PiZ354IzR6NqFFd6/o
         5ZUzB38NSdvc4a1Eawm3VUeV87ROkIF/Zl5oIwm08/8NQTaZWzbN4V1BivP7hpiyzCwA
         N2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744992522; x=1745597322;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GTRsdQyPhwEI7P5aYqr8HqSfKQVDCSCnob+lAcXVoLw=;
        b=tPyeKeF34Cjxk7Ga2b2OXY+dJIWzZGUpxHzwkVqwtOesT4xlpLiKnx0LKaSlZTothz
         Xi7bphtf2+2RYMYGo/FPa4ItKXj/ZgjSNhzX1e9bClwUvQY9ByKxIOZoCZ8EDWAEH6q0
         yf1aCf6Uda6476aX3IfHfXex4Ry3ckZZQexTRY68a3VvpVkW8PhM1oPygQTgzytTk++b
         AS7bVrrt84OVi1sT/dmRIKwoibljlEvpUX7J0yEeyxfsqe5eJco5iF3YzRgMxUrEpSqo
         p4Qd2rohoHYtZ5pNRYeG4I4kN0IotQG46+u1Nj1/dgj3xJJrSEqdZvio5/N2ceyHrcWX
         DG2Q==
X-Forwarded-Encrypted: i=1; AJvYcCULGPs2OSRkloWxEXy4EW+ioxy2vrIxYb6/6ovqlk0EvPJwt5UkWWLTek/d5JYqs+pw0lcuj1jkB+ib0mg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyq7dCDMhhvtwSbGLbJI1Ea7s0W+Hp0RAnQoXf16uPmUAklRdE
	qPee3fhSKr8z+pyRGkA3GitnmKizxIYD/C75SzsetMLX2GrSRYNKLrRhnzp3BIo=
X-Gm-Gg: ASbGnctKveZ2qYHvdAjPsjTOzRjOxS9EImtkESrlQiq729tDqq4Zwb4EQoBQSe0a0Uw
	O3tq4zUtJOuT7jwsdAUf90J2tAr5ancgEvkBmriCpoL4GhZwzGnfpAVU1ij6xkd60UiQ9fIIoLW
	rn74D1GE3a9lT8nM6ak1+L3VlkMT8HjMkLtSBdV1L3le1ZpKmVfed6kn+2qpiZkku5o5tmht/7T
	jRGasZf6iMmB3Mo4nBpguAG4Pf/8yV6mYFwWw7CP3kvNp7IU0Oo6M2aTjlX3dbE8dptTyxoD20P
	XAo3c/Zu6Oy2M3FFj0Km7paS1+mWX6qEj9INNEDEJBSf
X-Google-Smtp-Source: AGHT+IHa4TgX8s0MmpF8GB8R16O010Ve/qC4qv/99ZOSj9/ybMOt/qI/ikL+RDoyJZEPVnEbqnzHwA==
X-Received: by 2002:a17:907:3fa1:b0:ac6:d0f6:c85c with SMTP id a640c23a62f3a-acb74b36c70mr264464766b.20.1744992521672;
        Fri, 18 Apr 2025 09:08:41 -0700 (PDT)
Received: from cloudflare.com ([2a09:bac5:506a:2387::38a:4e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec51601sm137723466b.74.2025.04.18.09.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 09:08:40 -0700 (PDT)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: Andrii Nakryiko <andrii@kernel.org>,  Eduard Zingerman
 <eddyz87@gmail.com>,  Mykola Lysenko <mykolal@fb.com>,  Alexei Starovoitov
 <ast@kernel.org>,  Daniel Borkmann <daniel@iogearbox.net>,  Martin KaFai
 Lau <martin.lau@linux.dev>,  Song Liu <song@kernel.org>,  Yonghong Song
 <yonghong.song@linux.dev>,  John Fastabend <john.fastabend@gmail.com>,  KP
 Singh <kpsingh@kernel.org>,  Stanislav Fomichev <sdf@fomichev.me>,  Hao
 Luo <haoluo@google.com>,  Jiri Olsa <jolsa@kernel.org>,  Shuah Khan
 <shuah@kernel.org>,  Jonathan Corbet <corbet@lwn.net>,
  bpf@vger.kernel.org,  linux-kselftest@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-doc@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 2/9] selftests/bpf: Add socket_kind_to_str()
 to socket_helpers
In-Reply-To: <20250411-selftests-sockmap-redir-v2-2-5f9b018d6704@rbox.co>
	(Michal Luczaj's message of "Fri, 11 Apr 2025 13:32:38 +0200")
References: <20250411-selftests-sockmap-redir-v2-0-5f9b018d6704@rbox.co>
	<20250411-selftests-sockmap-redir-v2-2-5f9b018d6704@rbox.co>
Date: Fri, 18 Apr 2025 18:08:30 +0200
Message-ID: <87h62la1vl.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Apr 11, 2025 at 01:32 PM +02, Michal Luczaj wrote:
> Add function that returns string representation of socket's domain/type.
>
> Suggested-by: Jakub Sitnicki <jakub@cloudflare.com>
> Signed-off-by: Michal Luczaj <mhal@rbox.co>
> ---

Reviewed-by: Jakub Sitnicki <jakub@cloudflare.com>
