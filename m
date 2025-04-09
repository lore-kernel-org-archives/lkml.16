Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98C1254861
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 07:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744182848; cv=none; b=MuXhyVCG5MV06croMgN+C88yxPYms/VLPr0Jc0A4+GtWy/4o1wju3bCaQ8XTWDw/6qzMUUbJwmiH/JTKEO5Sla117Wkhj25P/olkoFf9YqA6qdvjEY1wsb1eZqMZaccdkXwzgyZVSCsyRiWgyV8ycLhualKfUAgM0b8x/XJkkXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744182848; c=relaxed/simple;
	bh=o4u22On0K74aCLxCe4KHlANGFU1KZOeJn9PZNDHqBII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=leiR51dvnbPttefv99W0BMXaz5GUhcY5vR1uGHwAiwyElN4JKgEMKhqwyQ6z4eBw4C6HZScqQJsfQtxgWkgli0ISdNx2bWFDxaAhDhmtB2U3BZSYNwZxGDIZf+hNLx6hJdO2g1UHAbth/CjeevngVggocENz0/wWx1uxkAfGVQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ekCQmfKE; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ekCQmfKE"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-47691d82bfbso126134001cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 00:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744182845; x=1744787645; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o4u22On0K74aCLxCe4KHlANGFU1KZOeJn9PZNDHqBII=;
        b=ekCQmfKEB0bLWZzXtd7R2oH2sSK14iQ2pma12G0EcIvhTlGB5SzYD+FgtuHYRw2Ziv
         omL2HXb+4fJjfL/p/Xo6SNAkjcTaoFkU1s6RAPZ+TM0i75czBtd9YFBdwfmbDCGnS9R6
         N/uMZVezf3JMPZb38v+Zbn5iTlPumqS+2SSWkdwnYavt6JFgEUiv+wc9xB+eJEZypHh9
         gMjWJpEyz556pzyVvs43uDl82DSSbFZ7XDTR3exeKDf0t5BFnsw1LMoZo/e1RdvRzZ9r
         OXkD0+UHehK8C0/iex+frri3vn2aEBBt3adjC5LInhzD4JrYmcCKSJU4HS2lwnw66Ows
         jbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744182845; x=1744787645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o4u22On0K74aCLxCe4KHlANGFU1KZOeJn9PZNDHqBII=;
        b=JlA3u1Rsg/HBA9Wb+8JEOLw+GEi5eOyi/l2NRcYFH2uPIATzRqFUro8h9sxCg36Dha
         m/3wllurKCYXcPpaTLTbG4SFaxYqaLI7f5Q11xym+QjvIpEgum9wWm7XaLDFjlbfE3Vm
         YuMiSNGTvvQE+sM+0nj9dwbZ958bRVAGh6+JLdstPiDwFbwzxycCK+nWN9OdmKCbvnTZ
         oxYR4RyjWBpz5Dl//KVs15jr97qhgsL8ZL3AlyhRy0u7CYBTBvZ3X5eMEF91Wyi3ilGM
         qnn6l9Vma2IvfePN6lAe2akGOD6ykUHM/yqRJU05/839IUx37zX/i0lWgC5y5MHu1KK2
         5GXA==
X-Forwarded-Encrypted: i=1; AJvYcCW292VGmJWfQQoN5wlxa1YBtEx0AgtSZDITklIjx72a903e3I6FUyM6JDMg8tkSY+FiKS0WV2ILG5Qji0Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqoI+TFHXVpuHZB93bXTh9n3DLYhXSVKHTxOYSKF0nE/U0AhDI
	qSFMyX7BsLa0FJS6Yr7EEEhGe+O648ELffOc0ZzS2iZI+K5B46Hzz7xfgsmuaO6/qE+jTWf3ifz
	okjxrM/UjMsgeR8iQpm88bN9GJ6YHaA2xy9IO
X-Gm-Gg: ASbGncvb0qQdNT1cE1OeBjfKA/FK4AoY2/maGjnZQ3f+mf+JPeU441kuZHN3kRdlAOY
	YXZSdhWgW3K8Xsi9oJJy8h3z6AvvnxEyklHFZ08xomRZZi9n0ZukBV53bmHv/2i9v+ZMFkxq+QY
	P5RV39PjeQwqREbfKyGWZU2g==
X-Google-Smtp-Source: AGHT+IEPf+bMOSyPAyRRT5FnYt/dQDrDJkP7fgIqSBGifSkvX0GxrGH6i7XdUzqfrW17ujqWAY4wjqbjwcnaYpM00XA=
X-Received: by 2002:a05:622a:1209:b0:475:ce:3c59 with SMTP id
 d75a77b69052e-479600c94ffmr21204371cf.30.1744182844448; Wed, 09 Apr 2025
 00:14:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408-tcpsendmsg-v3-0-208b87064c28@debian.org> <20250408-tcpsendmsg-v3-2-208b87064c28@debian.org>
In-Reply-To: <20250408-tcpsendmsg-v3-2-208b87064c28@debian.org>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 9 Apr 2025 09:13:53 +0200
X-Gm-Features: ATxdqUExgIlhI5h9g1kuJu6S49AR43PpGh5RclwAbpAXHtSKJ9IcrrdS9kYyTqQ
Message-ID: <CANn89iKr2kfCakou8id62C5ic95HF5RCps9a2cUv5FL3yjAGdg@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/2] trace: tcp: Add tracepoint for tcp_sendmsg_locked()
To: Breno Leitao <leitao@debian.org>
Cc: David Ahern <dsahern@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@amazon.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 8:32=E2=80=AFPM Breno Leitao <leitao@debian.org> wro=
te:
>
> Add a tracepoint to monitor TCP send operations, enabling detailed
> visibility into TCP message transmission.
>
> Create a new tracepoint within the tcp_sendmsg_locked function,
> capturing traditional fields along with size_goal, which indicates the
> optimal data size for a single TCP segment. Additionally, a reference to
> the struct sock sk is passed, allowing direct access for BPF programs.
> The implementation is largely based on David's patch[1] and suggestions.
>
> Link: https://lore.kernel.org/all/70168c8f-bf52-4279-b4c4-be64527aa1ac@ke=
rnel.org/ [1]
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Eric Dumazet <edumazet@google.com>
