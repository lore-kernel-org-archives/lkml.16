Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3A32512E7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 18:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743703804; cv=none; b=o4G8XJ2V6gbe2hP3ea3OZP61i6m/3s3SZJ+6v22PH7VyIipcfDb7BHFBOHRsbUk/9YFbh/Lrnpdt6Ar5NHu7B+uFS2flNkEbXvC9LIrfFLJ4AKufbEabbtLPzYbOQmnAQtLoWwSIWOcstPZ9QAFvQENPY5keo+PUVQi/LoUH7ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743703804; c=relaxed/simple;
	bh=tRaMCDQsFxTh97DR7LSJJp2UP+PKxOH/yGDNF3oor4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WnlOM24NLOZV6CuVBP8kx7ouJ2AG4EePDPL4azvt0jCUPWa9NPmY+fMKg1jb9ytCl678F5mAm/jSTBSgHgDRd802f4MG34C7y/Be2+DfkOfFv+FRcJV4zLD/9BAeGFVqVryMGBFTcn3lpvh04puf1hlyvYoesyM/Ay3/wTImokg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=C7WEIsNz; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="C7WEIsNz"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ab78e6edb99so174904466b.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 11:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743703800; x=1744308600; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HcEDrrFsrxiP1Wl9E660bs5VgrcHtAAgyYumdG4aXRY=;
        b=C7WEIsNztGwdeyW70eWkzmRnk9zqvnh+JCVBxlCAJNwCr9zgXBU37z79jepUoyDdqp
         tRrXMgf8LlZkabMEFIrbud8PBGlBxRF7ULkN9riQO4I5b3InmGajvV0TTogsNSWXafpe
         Zke32bhEuUW3ZhZLoC9AMYrFBsBnnODxifPEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743703800; x=1744308600;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HcEDrrFsrxiP1Wl9E660bs5VgrcHtAAgyYumdG4aXRY=;
        b=Q1Xvnfiuea4c0Tc5KrpS7jtVBvT2/tD0b03jHsD7FRd9LKRp4fkA5EyocK005PHroN
         qAcM56FeV/aJwxpBjRlixd5mJLWegfSF4hyTZn/pPhZ9/Jp0Hp4Mv9rgGjZtSWhdY0mq
         eZTKMrSSAJhuOqANVvQVZqrG1Kf4fxZ8ZNin0ys70RLatNe14HqweenS2uDEK03nJ+iC
         yxmBvSVzZXRlTFpZ5+yA4Klflh9f5TDzjuPlPL3dQEJ3x6iYoBYmQKdDAM0M1+ffd3G7
         TqbYYjBAt0MfDB+pfzeNdbrosVxuTbGusKLhUW0pxjPLBWZjFnTy13h5+6J0kFWz5BED
         1IBg==
X-Forwarded-Encrypted: i=1; AJvYcCUZDMr+rC9DBeG/sc71ugtqp30+Uv0RFK0x2hMCw8xXrjMpV6Qjb5Ko8lU5IRq3pyZU/QEbi2XNi/998kg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXe2albRWiJP48x0RQb+VWb4fBasSSU1oR7PaxzP63llGZSenG
	g+wPk71yqW2UoEuxSgkekMJ/5JBx8wGQUZtMIdGr3yqrhW6+eeooxTkdXgP8uZHdCA+bGkHfvOn
	uMTM=
X-Gm-Gg: ASbGncvNUKCHQi7SndPYOWmv2nnL1PaShMkfNRH2njojwzcySkT+Jp9SJn9FCSMKkXU
	KC+QkqYpG3WkMFhADQ2HmsrxXfwZWfRHpB1Yg8xZBF2Izxs/DiLEpcI1//6i/0qdrdAVfLoe7Rv
	wpu/SKYsHhPeKbUaOGcWn3w+hUClXc7Mtrl7lquVPC2MW8wMgwVqk0lkrQBE/6C5ZjxTMqwaIZF
	sk1hDwietuacQ3JcEBDZZd1IoWOMO7wp2KafccCI76o52Id0TAdPhHyZ9eAjsk5e4PWvfRnt3oq
	qkb+smyeNMvWAmeYFHj8FdKBJoEz2ys8F9lt+y0EPFY6f7n+nA0RDHKagWVoWCJO1XYAExB7vOT
	26mWoEFw2yd6EzXFjEkU=
X-Google-Smtp-Source: AGHT+IHCodMIBmboTv6a60mDwUgukM1p+s4eolivHS2UAinIE6gUP9NJmwo0fUaTe0XEfbEyVvE+rQ==
X-Received: by 2002:a17:906:dc8a:b0:ac4:4d2:3867 with SMTP id a640c23a62f3a-ac7d188b8aemr55806266b.23.1743703800371;
        Thu, 03 Apr 2025 11:10:00 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe5bd17sm130985066b.10.2025.04.03.11.09.59
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 11:09:59 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so197257366b.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 11:09:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWCcEpMS057Y2DpBKCFREGemauvaAN+QCMxQtWjEq8kGJsHYrWLo5i+j/0tTqfXsJyl4BIFonBAJQfN+yo=@vger.kernel.org
X-Received: by 2002:a17:907:971c:b0:ac3:84d5:a911 with SMTP id
 a640c23a62f3a-ac7d18e240emr44635266b.28.1743703798814; Thu, 03 Apr 2025
 11:09:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250322-vfs-mount-b08c842965f4@brauner> <174285005920.4171303.15547772549481189907.pr-tracker-bot@kernel.org>
 <20250401170715.GA112019@unreal> <20250403-bankintern-unsympathisch-03272ab45229@brauner>
 <20250403-quartal-kaltstart-eb56df61e784@brauner> <196c53c26e8f3862567d72ed610da6323e3dba83.camel@HansenPartnership.com>
 <6pfbsqikuizxezhevr2ltp6lk6vqbbmgomwbgqfz256osjwky5@irmbenbudp2s>
In-Reply-To: <6pfbsqikuizxezhevr2ltp6lk6vqbbmgomwbgqfz256osjwky5@irmbenbudp2s>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 3 Apr 2025 11:09:41 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjksLMWq8At_atu6uqHEY9MnPRu2EuRpQtAC8ANGg82zw@mail.gmail.com>
X-Gm-Features: AQ5f1JqNbQoAaPP_wXcc41hTXOvOxh-9Wv4SKJz_lr5r38JumKJCxYASdK1ME88
Message-ID: <CAHk-=wjksLMWq8At_atu6uqHEY9MnPRu2EuRpQtAC8ANGg82zw@mail.gmail.com>
Subject: Re: [GIT PULL] vfs mount
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Christian Brauner <brauner@kernel.org>, Leon Romanovsky <leon@kernel.org>, pr-tracker-bot@kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Apr 2025 at 10:21, Mateusz Guzik <mjguzik@gmail.com> wrote:
>
> I would argue it would be best if a language wizard came up with a way
> to *demand* explicit use of { } and fail compilation if not present.

I tried to think of some sane model for it, but there isn't any good syntax.

The only way to enforce it would be to also have a "end" marker, ie do
something like

        scoped_guard(x) {
                ...
        } end_scoped_guard;

and that you could more-or-less enforce by having

    #define scoped_guard(..) ... real guard stuff .. \
                do {

    #define end_scope } while (0)

where in addition we could add some dummy variable declaration inside
scoped_guard(), and have a dummy use of that variable in the
end_scope, just to further make sure the two pair up.

It does have the advantage of allowing more flexibility with fewer
tricks when you can define your scope in the macros. Right now
"scoped_guard()" plays some rather ugly games internally, just in
order to avoid this pattern.

And that pattern isn't actually new. We *used* to have this pattern in

        do_each_thread(g, t) {
                ...
        } while_each_thread(g, t);

and honestly, people seemed to hate it.

(Also, sparse has that pattern as

        FOR_EACH_PTR(filelist, file) {
                ...
        } END_FOR_EACH_PTR(file);

and it actually works quite well and once you get used to it it's
nice, but I do think people tend to find it really really odd)

> This would also provide a nice side effect of explicitly delineating
> what's protected.

Sadly, I think we have too many uses for this to be worth it any more.
And I do suspect people would hate the odd "both beginning and end"
thing even if it adds some safety.

I dunno. I personally don't mind the "delineate both the beginning and
the end", but we don't have a great history of it.

               Linus
