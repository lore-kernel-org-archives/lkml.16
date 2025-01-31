Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72412136351
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 17:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738343794; cv=none; b=hM5EM3vDELg+WNF4DdV3XckaoXDyetpoDQ3yh2gWf126cdQTN80gEeuijnWjBrtl9eKpnOzgrMG3mwgPG3BBJFzG61hmHn8qoHOBnmNklqvQfBjhcvPqMkD2dmBhg1MwYADpLPdxRmLCI518QXfr6jZ5gJbvhOZKIHv/76jPPGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738343794; c=relaxed/simple;
	bh=IJpXKd7iwRYoZffANHjuO9WmlQvJWizra56J/pdegfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=osZ+3ycPYfZXRyiKh/72hR6ZY7Vvf5h32AXsonbU94+YWe35/KZNDLMa0Ku4cUoRqisOvxNa5NlnUsKJAY0KNByBLlRd0liLaYfVGjLAxvP3PhHf1kCMvZupWMa3amg0M6xECeshP0XW1deqF6TKeyy6jyI0u2PwTpz4qHDcHS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=Vt4jj7fU; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="Vt4jj7fU"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aaeec07b705so367173966b.2
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1738343791; x=1738948591; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqSRqdRuMVUS0hR3bXfCSvdzWeHIS96mx4dwh5De168=;
        b=Vt4jj7fUBJFyOLCUAOxOfXiwNgXuFY6Q0+0QTv81LcG8cTFIqNrdA3c1ZrI2WUjgYC
         hgipZhXShaTH9CzqvPAOlko6JWk3hdwWhJuPSDgQ82X0XVB+dQAV/yGaxF5PTSszLoZb
         gZW8e2Nd3To8gCqeaRHdoXBwmelP7wj7rPYnAZc+SJIl3H6o5TCVfh5YACEohsO3mWX2
         665MBzMXP6VStOKIIQO/zR1bSm3N8h+pMgKDQYpbtNrBkxKfwzBx7uXec8c0e9FKTS3Q
         r2umxkGhv0kTE61CmmqKmzJKcbAFpa0FWPBRcpVxehhjwOC3gcFGQFO+Ljixn9e5i3L/
         UNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738343791; x=1738948591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kqSRqdRuMVUS0hR3bXfCSvdzWeHIS96mx4dwh5De168=;
        b=LBNbWwsiX+9Ay4a8qOWPuRDzFLRegUCJTzQVihaywrMk614lEDXa/6rDnu0lv0kxr5
         NISnZq6vudV+sbDoEtQsedPArYLnuiLLRT/VvlOj7BJ2Jz8On9+q5vkSdEv6Yq+evahJ
         4VoHSBuqKujyv0DmaF2vWeBR9WOJMlJA9aZEXeugfH2EoQffAsVwJ7hJQ9Ln/rZshbww
         jWOpNryCStZzIV+lgsDfu4NBMBOF4BYG7oCFY71oRn4PVNKVaDSKfNxNm+7c8Qmk1Nh/
         6i25URy7D/QoFHi+EXmDbsS4iJ75e1EXx/czZj+SfWixgo6XvmOxEIvRIWEGeTX6plJB
         7uMw==
X-Forwarded-Encrypted: i=1; AJvYcCVSIgNC9f+PZya0emY4TMKVSJiEaXCfHqRnermIqykpwvZKC3qsPFD1cwqBI8wMjw5R+EQniYKEHs8fNsM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrnUS75qBfwS128VdwwVxS08t85tDsiQmsCsOxayepF2EXrJZn
	1fjrkfiDmn+YxlFnwHgyLxMGUp114hqF6qCz9TC4bQY+9RlZHQI7k3/OYKlfC3HG+n/GQ6IH2z0
	gZEV0K1PW3/maE7r/gcGS+GMn4fQvLkudFm+gyw==
X-Gm-Gg: ASbGncuvB5tH/8l3s/oQ3Hjqm/OiVIRoUbKESub1LYzpA5zqGPmaK98h0JILYhqMwGT
	ZnoY+E3dTuQc2E6inzvGmxJKQFjZ5V+HetL9ExjH6i5O6GYrHa7eJo7UGZeyo0awZGtLfP3aSm4
	Bt+IJQV8kbw7vL0LboZsyYE240Zw==
X-Google-Smtp-Source: AGHT+IFrg/3LHjJ/lnlIA5OZd/lPJwrUoD7pnmT/wTf5Yed08bwxEvL1yRpJsQHHZdHQcPsit+hXF79AJUi6y8BFTXI=
X-Received: by 2002:a17:907:728c:b0:ab3:64dd:bc89 with SMTP id
 a640c23a62f3a-ab6cfce265fmr1329620366b.20.1738343790697; Fri, 31 Jan 2025
 09:16:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250128133927.3989681-1-max.kellermann@ionos.com>
 <20250128133927.3989681-9-max.kellermann@ionos.com> <794043b6-4008-448e-b241-1390aa91d2ab@gmail.com>
In-Reply-To: <794043b6-4008-448e-b241-1390aa91d2ab@gmail.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Fri, 31 Jan 2025 18:16:19 +0100
X-Gm-Features: AWEUYZngMvc8L7CbnAKSWZY60DE5_wFqVJVZxAc2vuwSHc9kVxszNfA2g1obggI
Message-ID: <CAKPOu+-SYVHAWbLgrih338E_wCyOqEqA3cBHXf3qa-Xbx43hgg@mail.gmail.com>
Subject: Re: [PATCH 8/8] io_uring: skip redundant poll wakeups
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: axboe@kernel.dk, io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 2:54=E2=80=AFPM Pavel Begunkov <asml.silence@gmail.=
com> wrote:
>                                  |     // it's still 0, wake up is lost

I think I misunderstood how these polling functions in the kernel work
- thanks for the explanation, Pavel. This one patch is indeed flawed,
and I'll try to come up with something better.
